# PhysIO-Live
Here is where the future PhysIO Matlab Livescript demo lives.

## How to work with this repository

### There are two ways to work with this repository:


- [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=likeajumprope/PhysIO-Live-standalone)

- Run locally on your machine

### For the second option, follow the steps below:

1. Clone this repository *recursively*. This way, all dependent libraries, e.g., [SPM](https://www.fil.ion.ucl.ac.uk/spm/) and [TAPAS PhysIO][SPM](https://www.fil.ion.ucl.ac.uk/spm/) are automatically installed as well.
    ```
    git clone --recursive https://github.com/likeajumprope/PhysIO-Live"
    ```
   - *Note:* Check that the `libs` subfolder is not empty, and e.g,. `libs/tapas` contains files.
2. Get the data. 
   For this live demo, we use the [Forrest Gump](https://openneuro.org/datasets/ds000113/versions/1.3.0) data set. Here we use the audio perception sub data set (see also [here](https://www.studyforrest.org/data.html))
   The following files need to be downloaded into the sub-01 folder:
   - sub-01/ses-audiotoryperception/func/sub-01_ses-auditoryperception_task-auditoryperception_run-01_bold.nii.gz (unpack)
   - sub-01/ses-forestgump/anat/sub-01_ses-forrestgump_T1w.nii.gz (unpack)
   - sub-01_ses-auditoryperception_func_sub-01_ses-auditoryperception_task-auditoryperception_run-01_physio.tsv
   - recording-cardresp_physio.json
3. Adapt the environment variables  in main.m

## Debugging - common issues

- Make sure every step is run out of the results/>subjectID<  folder!
- Make sure tapas, spm/matlabbatch are on the path. Any "cannot find/open file" error is usually due to the relevant folder not being  on the path.
- Some operations take some time. A wheel of doom when hovering over the batch editor indicates that the process is still running!

(C) 2023 Johanna Bayer, supervised by Lars Kasper
