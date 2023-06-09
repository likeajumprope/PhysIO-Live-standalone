%-----------------------------------------------------------------------
% Job saved on 11-Aug-2022 00:49:39 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.stats.fmri_spec.dir = {'glm'};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = TR;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = nSlices;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = nSlices/2;
%%
matlabbatch{1}.spm.stats.fmri_spec.sess.scans = {
                                                    fullfile(pathSubject,'/nifti/rbold.nii,1')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,2')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,3')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,4')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,5')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,6')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,7')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,8')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,9')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,10')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,11')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,12')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,13')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,14')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,15')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,16')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,17')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,18')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,19')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,20')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,21')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,22')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,23')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,24')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,25')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,26')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,27')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,28')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,29')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,30')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,31')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,32')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,33')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,34')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,35')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,36')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,37')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,38')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,39')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,40')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,41')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,42')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,43')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,44')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,45')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,46')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,47')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,48')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,49')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,50')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,51')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,52')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,53')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,54')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,55')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,56')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,57')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,58')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,59')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,60')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,61')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,62')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,63')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,64')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,65')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,66')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,67')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,68')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,69')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,70')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,71')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,72')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,73')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,74')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,75')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,76')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,77')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,78')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,79')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,80')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,81')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,82')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,83')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,84')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,85')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,86')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,87')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,88')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,89')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,90')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,91')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,92')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,93')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,94')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,95')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,96')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,97')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,98')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,99')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,100')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,101')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,102')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,103')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,104')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,105')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,106')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,107')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,108')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,109')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,110')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,111')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,112')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,113')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,114')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,115')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,116')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,117')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,118')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,119')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,120')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,121')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,122')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,123')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,124')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,125')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,126')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,127')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,128')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,129')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,130')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,131')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,132')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,133')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,134')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,135')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,136')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,137')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,138')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,139')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,140')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,141')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,142')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,143')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,144')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,145')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,146')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,147')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,148')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,149')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,150')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,151')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,152')
                                                     fullfile(pathSubject,'/nifti/rbold.nii,153')
                                                    };
%%
matlabbatch{1}.spm.stats.fmri_spec.sess.cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {fullfile(pathSubject,'/physio_out/multiple_regressors.txt')};
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
