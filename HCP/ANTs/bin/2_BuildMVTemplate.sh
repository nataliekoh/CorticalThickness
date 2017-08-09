#! /bin/bash

export ANTSPATH=/usr/local/ANTs-2.1.0-rc3/bin
inputPath=/mnt/panuc/CorticalThickness/HCP/ANTs

# ${ANTSPATH}/antsMultivariateTemplateConstruction.sh \
#   -d 2 \ # Image dimensions
#   -o ${outputPath}/T_ \ # Output prefix
#   -i 4 \ # Iterations
#   -g 0.2 \ # Gradient step
#   -j 8 \ # No. of CPU cores to use
#   -c 1 \ # Control for parallel computation
#   -k 1 \ # No. of modalities to construct template (default = 1)
#   -w 1 \ # Modality weights used in similarity matric (default = 1)
#   -m 100x70x50x10 \ # Max interations for each reg
#   -n 1 \ # N4Biasfield correction; 0 = off, 1 = on
#   -r 1 \ # Rigid body registration; 0 = off, 1 = on
#   -s CC \ # Type of similarity metric for registration
#   -t GR \ # Type of transformation model for registration 
#   ${inputPath}/*_3T_T1w_MPR1.nii.gz

${ANTSPATH}/antsMultivariateTemplateConstruction.sh \
  -d 3 \
  -o ${inputPath}/MVC_CC_Template/T_ \
  -i 5 \
  -g 0.2 \
  -j 24 \
  -c 1 \
  -k 1 \
  -w 1 \
  -m 100x90x70x20 \
  -n 1 \
  -r 1 \
  -s CC \
  -t GR \
  ${inputPath}/MVC_CC_Template/*_T1*.nii.gz
