#! /bin/bash

export ANTSPATH=/usr/local/ANTs-2.1.0-rc3/bin
inputPath=/mnt/panuc/CorticalThickness/HCP

for i in 101006; do
    bash ${ANTSPATH}/antsBrainExtraction.sh -d 3 \
	-a ${inputPath}/${i}_T1.nii.gz \
	-e ${inputPath}/MVTemplate_NotSkullStripped/T_template0.nii.gz \
	-m /mnt/panuc/CorticalThickness/Kirby/HCP_Brainmask.nii.gz \
	-o ${inputPath}/${i}_
done
