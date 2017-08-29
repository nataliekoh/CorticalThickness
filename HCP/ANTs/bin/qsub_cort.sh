#! /bin/bash

export ANTSpath=/usr/local/ANTs-2.1.0-rc3/bin

antsCorticalThickness.sh -d 3 \
			 -a ../../batch/SUBJECTID_3T_T1w_MPR1.nii.gz \
			 -e ../MVC_CC_Template/T_template0.nii.gz \
			 -m ../HCP_BrainExtractionMask.nii.gz \
			 -p ../cortthickprior%d.nii.gz \
			 -o ../CorticalThickness/SUBJECTID_

			     
