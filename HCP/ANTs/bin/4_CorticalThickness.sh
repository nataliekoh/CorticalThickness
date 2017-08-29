#! /bin/bash

for i in `cat ../../HCPsubjectids`; do
    antsCorticalThickness.sh -d 3 \
			     -a ../../batch/${i}_3T_T1w_MPR1.nii.gz \
			     -e MVC_CC_Template/T_template0.nii.gz \
			     -m ../HCP_BrainExtractionMask.nii.gz \
			     -p ../cortthickprior%d.nii.gz \
			     -o ${i}_
done

			     
