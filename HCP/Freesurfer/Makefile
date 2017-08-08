#* Freesurfer makefile suitable processing high resolution data
# NOTE THAT THIS RUNS FREESURFER v6.0 

DIR=$(shell pwd)
include $(DIR)/Freesurfer.conf

.PHONY: cropT1 FREESURFER freesurfer-qa freesurfer-qcache

#! Get T1 with correct FOV (needs to be hand checked before making FREESURFER target)
cropT1: $(subjs:%=FOV_fixed/%_T1_cropped.nii.gz)  

#!crop FOV to be 256x256x256 for FreeSurfer
FOV_fixed/%_T1_cropped.nii.gz: $(PROJHOME)/%_3T_T1w_MPR1.nii.gz
	fslroi $(PROJHOME)/$*_3T_T1w_MPR1.nii.gz FOV_fixed/$*_T1_cropped.nii.gz 0 256 23 256 80 256

#! Run Freesurfer 6.0 
FREESURFER: $(subjs:%=%/mri/aparc+aseg.mgz) 

#! Run Freesurfer 6.0 with high res options
%/mri/aparc+aseg.mgz: $(SUBJECTS_DIR)/FOV_fixed/%_T1_cropped.nii.gz expert.opts
	echo $* ;\
	source $${FREESURFER_SETUP} ;\
	export SUBJECTS_DIR=$(SUBJECTS_DIR) ;\
	$(FSBIN)/recon-all -all -s $* -hires -cw256 -i $(SUBJECTS_DIR)/FOV_fixed/$*_T1_cropped.nii.gz -expert expert.opts

#! Make Freesurfer QA Reports
qafiles=$(subjs:%=QA/%)

freesurfer-qa: $(qafiles) $(subjs:%=%/mri/overlay.nii.gz) \
	$(subjs:%=%/mri/overlay.gif) $(subjs:%=%)/mri/orig.nii.gz) \
	$(subjs:%=%/mri/brainmask.nii.gz)

QA/%: %
	$(QA_TOOLS)/recon_checker -s $*
#	source $${FREESURFER_SETUP} ;\

%/mri/orig.nii.gz: %/mri/orig.mgz
	mri_convert $< $@

%/mri/brainmask.nii.gz: %/mri/brainmask.mgz
	mri_convert $< $@

%/mri/overlay.nii.gz: %/mri/orig.nii.gz %/mri/brainmask.nii.gz
	overlay 1 1 $(word 1,$^) -a \
		$(word 2,$^) 1 10 \
		$@

%.s$(SESSION)/mri/overlay.gif: %.s$(SESSION)/mri/overlay.nii.gz
	slices $< -o $(basename $@).png ;\
	convert $(basename $@).png -resize 500 $@ ;\
	rm $(basename $@).png

#! Make Freesurfer q-cache
#freesurfer-qcache: $(subjs:%=%/surf/lh.thickness.fwhm0.fsaverage.mgh)

#%/surf/lh.thickness.fwhm0.fsaverage.mgh: %/mri/aparc+aseg.mgz
#	recon-all -s $* -qcache
