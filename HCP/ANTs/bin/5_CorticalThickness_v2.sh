#! /bin/bash

#for i in `cat ../../GOODsubjects`; do
for i in 100307 101006 110107; do
    antsCorticalThickness.sh -d 3 \
			     -a ../../batch/${i}_3T_T1w_MPR1.nii.gz \
			     -e ../MVC_CC_Template/T_template0.nii.gz \
			     -m ../HCP_smoothedBrainExtractionMask.nii.gz \
			     -p ../cortthickprior%d.nii.gz \
			     -o ../CorticalThickness_v2/${i}_
done

			     
