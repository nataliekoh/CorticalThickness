#! /bin/bash

export ANTSPATH=/usr/local/ANTs-2.1.0-rc3/bin

# Step 1. Multivariate template construction - https://github.com/ntustison/TemplateBuildingExample

inputPath=/mnt/panuc/CorticalThickness/HCP

# ${ANTSPATH}/buildtemplateparallel.sh \
#   -d 2 \ # Image dimension
#   -o BTP/T_ \ # Output prefix
#   -i 4 \ # Iterations
#   -g 0.2 \ # Gradient step size (default = 0.25); smaller numbers = more cautious template update steps
#   -j 1 \ # No. of CPU cores to use
#   -c 0 \ # Control for parallel computation; 0 = serial, 1 = SGE qsub, etc
#   -m 100x70x50x10 \ # Max iterations for each reg
#   -n 1 \ # N4BiasFieldCorrection; 0 = off, 1 = on
#   -r 1 \ # Rigid body registration; 0 = off, 1 = on
#   -s CC \ # Type of similarity metric for registration
#   -t RI \ # Type of transformation model for registration
#   OASIS*1.nii.gz # Images for template building

#${ANTSPATH}/buildtemplateparallel.sh -d 2 -o BTP_ -i 4 -g 0.2 -j 8 -c 1 -m 100x70x50x10 -n 1 -r 1 -s CC -t GR ${inputPath}/*_T1.nii.gz

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
  -o ${inputPath}/T_ \
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
  ${inputPath}/*_T1.nii.gz

#cd /mnt/home/natkoh/hires_structural/ANTS_HIRES; for s in `cat ../sublist`; do echo ""; echo $s; echo ""; antsApplyTransforms -d 3 -i ../${s}_T1.nii.gz -r MV_Template_2/T_template0.nii.gz -o ${s}_warped.nii.gz -n BSpline -t MV_Template_2/T_${s}_T1?Warp.nii.gz; done
