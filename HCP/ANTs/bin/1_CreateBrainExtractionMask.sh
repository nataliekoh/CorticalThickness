#! /bin/bash

# Use NKI templates to create brain extraction mask
# Make sure to reorient, upsample and register NKI templates to HCP space first

antsBrainExtraction.sh -d 3 \
		       -o HCP_BrainExtractionMask.nii.gz \
		       -a ../HCP/T_template0.nii.gz \
		       -e transformed_T_template.nii.gz \
		       -m transformed_T_BrainCerebellumProbabilityMask.nii.gz

SmoothImage 3 HCP_BrainExtractionMask.nii.gz 1 HCP_smoothedBrainExtractionMask.nii.gz 1
