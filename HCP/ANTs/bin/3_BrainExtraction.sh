#! /bin/bash

export ANTSPATH=/usr/local/ANTs-2.1.0-rc3/bin
inputPath=/mnt/panuc/CorticalThickness/HCP

for i in `cat ${inputPath}/HCPsubjectids`; do
    bash ${ANTSPATH}/antsBrainExtraction.sh -d 3 \
	-a ${inputPath}/batch/${i}_3T_T1w_MPR1.nii.gz \
	-e ${inputPath}/ANTs/MVC_CC_Template/T_template0.nii.gz \
	-m ${inputPath}/ANTs/HCP_BrainExractionMask.nii.gz \
	-o ${inputPath}/ANTs/BrainExtraction/${i}_
done
