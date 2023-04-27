% Script main
% Main preproc/analysis script lernit to create PhysIO regressors and
% assess them via a nuisance-only GLM
%
%  main
%
% Author:   Johanna Bayer, supervised by Lars Kasper
% Created:  2023-04-01
% Copyright (C) 2023

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setup paths - #MOD# Modify to your own environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subjectId = 'sub-01'; % subject ID
nSlices = 36; % nSlicesTotal/MB factor
TR = 2.0; % seconds
nVolumes = 153; % number of volumes
sampling_interval = 0.01; % sampling interval


% if true, only the SPM batch jobs are loaded, but you have to run them manually in the batch editor (play button)
isInteractive = true;
hasStruct = false; % if false, uses (bias-corrected) mean of fmri.nii for visualizations
doSmooth = true;

% specify the path to your SPM installtion
pathSPM = '/Users/jobayer/Documents/MATLAB/spm12';

%specify your project
pathProject     = '/Users/jobayer/Dropbox/My Mac (170529-G-APD-PV)/Documents/GitHub/PhysIO-Live/';
pathCode        = fullfile(pathProject, 'code');
pathResults     = fullfile(pathProject, 'results');
pathSubject     = fullfile(pathProject, 'results', subjectId);


addpath(genpath(pathCode));
pathNow = pwd;

cd(pathSubject);

% folder structure created with in results folder of subject to hold
% different preprocessed data
mkdir('glm')
mkdir('nifti')
mkdir('glm_s3')
mkdir('physio_out')

copyfile sub-01_ses-auditoryperception_func_sub-01_ses-auditoryperception_task-auditoryperception_run-01_bold.nii nifti/bold.nii
copyfile sub-01_ses-forrestgump_anat_sub-01_ses-forrestgump_T1w.nii nifti/T1w.nii

% add SPM path
addpath(genpath(pathSPM))
addpath(genpath(fullfile(pathSPM, '/matlabbatch')))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setup SPM Batch editor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% spm_jobman('initcfg')
spm fmri

if isInteractive
    jobMode = 'interactive';
else
    jobMode = 'run';
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Spatial Preproc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if hasStruct
    fileJobPreproc = 'preproc_minimal_spm_job.m'; % minimal preprocessing
else
    fileJobPreproc = 'preproc_minimal_no_struct_spm_job.m'; % use bias corrected mean of fmri.nii for viz
end

% loads matlabbatch and adapts subject-specific data
clear matlabbatch
run(fileJobPreproc)

spm_jobman(jobMode, matlabbatch)

if isInteractive, input('Press Enter to continue'); end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Physio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% loads matlabbatch and adapts subject-specific data
clear matlabbatch

%fileJobPhysio = 'physio_spm_job.m';
fileJobPhysio = 'physio_batch_job.m';

clear matlabbatch
run(fileJobPhysio)

% potential debuggers: add matlabbatch 


spm_jobman(jobMode, matlabbatch)

if isInteractive, input('Press Enter to continue'); end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GLM with or w/o smoothing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if doSmooth
    fileJobGlm = 'glm_s3_spm_smooth_job.m'; % smoothed images
else
    fileJobGlm = 'glm_spm_job.m'; % 
end
clear matlabbatch
run(fileJobGlm)


spm_jobman(jobMode, matlabbatch)

if isInteractive, input('Press Enter to continue'); end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Visualize PhysIO contrasts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% automatic contrast creation using PhysIO
visualize_physio
