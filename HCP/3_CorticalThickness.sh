#! /bin/bash

for i in 101915; do
    antsCorticalThickness.sh -d 3 \
			     -a ${i}_T1.nii.gz \
			     -e T_template0.nii.gz \
			     -m ../NKI/HCP_BrainExtractionMask.nii.gz \
			     -p priors/cortthickprior%d.nii.gz \
			     -o ${i}_
done

			     
