% Script visualize_physio
% Use PhysIO to create contrasts and display them for fMRI data w/o task
% modeling
%
%  visualize_physio
%
%
%   See also

% Author:   Johanna Bayer, Lars Kasper
% Created:  2023-11-24
% Copyright (C) 2022


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Visualize Movie of fMRI data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
doVisualizeFmri4D = false;

if doVisualizeFmri4D
    spm_check_registration('nifti/bold.nii')

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create contrasts for smoothed or unsmoothed GLM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if hasStruct
    fileStructural = 'nifti/mstruct.nii';
else
    fileStructural = 'nifti/mmeanbold.nii';
end

if doSmooth
    fileSpm = 'glm_s3/SPM.mat';
else
    fileSpm = 'glm/SPM.mat';
end

args = tapas_physio_report_contrasts(...
    'fileReport', 'physio_out/physio.ps', ...
    'fileSpm', fileSpm, ...
    'filePhysIO', 'physio_out/physio.mat', ...
    'fileStructural', fileStructural)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Compute tSNR gains from model (takes some time to compute residuals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


doComputeTsnrGains = true;

if doComputeTsnrGains
    indexContrastForSnrRatio = 0; % 0 = vs no noise modelin, 7 = vs motion

    namesPhysContrasts  = {'Cardiac', 'RespiratoryVolumePerTime'};
    tapas_physio_compute_tsnr_gains('physio_out/physio.mat', fileSpm, ...
        indexContrastForSnrRatio, ...
        namesPhysContrasts);
end
