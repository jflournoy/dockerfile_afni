# BIDS-ready AFNI 17.\* Dockerfile

Latest version of AFNI from instructions at [https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/steps_linux_ubuntu.html](https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/steps_linux_ubuntu.html)

To run an interactive session, try:

```
docker run -i -t \
    -v /local/path/to/raw/data:/raw_data:ro \
    -v /local/path/to/data/derivatives:/data_derivatives \
    jflournoy/dockerfile_afni_17
```

The `-v` option allows you to specify a file-system mount of the form `/local:/container:options`. We mount the raw data directory read-only with `ro`. 

Once you have a command line prompt, check the afni version with `afni -ver`. If you're interested in trying to get a GUI, see [this stackoverflow post](https://stackoverflow.com/questions/25281992/alternatives-to-ssh-x11-forwarding-for-docker-containers/25334301#25334301). Command-line utilities work well -- e.g., `3dFWHMx`:

```
root@473443dbc162:/# 3dFWHMx -acf NULL /raw_data/bold4d.nii.gz                                                                               
++ 3dFWHMx: AFNI version=AFNI_17.0.16 (Mar 21 2017) [64-bit]
++ Authored by: The Bob
** AFNI converts NIFTI_datatype=512 (UINT16) in file /raw_data/bold4d.nii.gz to FLOAT32
     Warnings of this type will be muted for this session.
     Set AFNI_NIFTI_TYPE_WARN to YES to see them all, NO to see none.
*+ WARNING:   If you are performing spatial transformations on an oblique dset, 
  such as /raw_data/bold4d.nii.gz,
  or viewing/combining it with volumes of differing obliquity,
  you should consider running: 
     3dWarp -deoblique 
  on this and  other oblique datasets in the same session.
 See 3dWarp -help for details.
++ Oblique dataset:/raw_data/bold4d.nii.gz is 7.596907 degrees from plumb.
*+ WARNING: removed 7724 voxels from mask because they are constant in time
*+ WARNING: Suggestion: use the '-detrend' option:
 + 728410 (out of 795053) voxel time series have significant means
++ start FWHM calculations
 + FWHM done (0.00 CPU s thus far)
++ start ACF calculations out to radius = 35.68 mm
 + ACF done (0.00 CPU s thus far)
 10.3174  13.5028  12.0841     11.8961
 0.724423  38.668  13.4381    70.2055
```
