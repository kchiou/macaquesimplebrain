#!/usr/bin/env Rscript

.baseImages = list(
	'chiou_huang_2023'    = 'chiou_huang_2023.svg',
	'chiou_decasien_2022' = 'chiou_decasien_2022.svg',
	'wbb47'               = 'wbb47_template.svg',
	'aparc'               = 'aparc_template.svg',
	'aparc_aseg'          = 'aparc_aseg_template.svg',
	'lausanne120'         = 'lausanne120_template.svg',
	'lausanne120_aseg'    = 'lausanne120_aseg_template.svg',
	'lausanne250'         = 'lausanne250_template.svg'
)

.regionLists = list(
	'chiou_huang_2023'    = c('dmPFC','vmPFC','dlPFC','vlPFC','ACC','CC','CN','NAc','EC','PC','A1','AMY','HIP','M1','mdTN','vlTN','LGN','S1','IPP','SPP','STS','MT','IT','V1','CV','lCb','MB','MdO','MdC','Pons'), # c('dlPFC', 'ACC', 'M1', 'EC', 'IPP', 'CN', 'NAc', 'HIP', 'mdTN', 'lCb', 'MB'),
	'chiou_decasien_2022' = c('dmPFC','dlPFC','vmPFC','vlPFC','ACCg','M1','STS','V1','AMY','CA3','DG','CN','Pu','LGN','VMH'),
	'wbb47'               = c('BB47-FA', 'BB47-FB', 'BB47-FBA', 'BB47-FCBm', 'BB47-FCop', 'W40-8A', 'W40-8B', 'W40-9', 'W40-10', 'W40-11', 'W40-12', 'W40-13', 'W40-14', 'W40-45', 'W40-46', 'BB47-IA', 'BB47-IB', 'BB47-LA', 'BB47-LC', 'BB47-FL', 'BB47-PB', 'BB47-PC', 'BB47-PCop', 'BB47-PEm', 'BB47-PEp', 'BB47-PF', 'BB47-PG', 'BB47-TA', 'BB47-TB', 'BB47-TC', 'BB47-TE', 'BB47-TEO', 'BB47-TF', 'BB47-TG', 'BB47-TH', 'BB47-A', 'BB47-OA', 'BB47-OB', 'BB47-OC'),
	'aparc'               = c('ctx-lh-bankssts', 'ctx-lh-caudalanteriorcingulate', 'ctx-lh-caudalmiddlefrontal', 'ctx-lh-cuneus', 'ctx-lh-entorhinal', 'ctx-lh-fusiform', 'ctx-lh-inferiorparietal', 'ctx-lh-inferiortemporal', 'ctx-lh-isthmuscingulate', 'ctx-lh-lateraloccipital', 'ctx-lh-lateralorbitofrontal', 'ctx-lh-lingual', 'ctx-lh-medialorbitofrontal', 'ctx-lh-middletemporal', 'ctx-lh-parahippocampal', 'ctx-lh-paracentral', 'ctx-lh-parsopercularis', 'ctx-lh-parsorbitalis', 'ctx-lh-parstriangularis', 'ctx-lh-pericalcarine', 'ctx-lh-postcentral', 'ctx-lh-posteriorcingulate', 'ctx-lh-precentral', 'ctx-lh-precuneus', 'ctx-lh-rostralanteriorcingulate', 'ctx-lh-rostralmiddlefrontal', 'ctx-lh-superiorfrontal', 'ctx-lh-superiorparietal', 'ctx-lh-superiortemporal', 'ctx-lh-supramarginal', 'ctx-lh-frontalpole', 'ctx-lh-temporalpole', 'ctx-lh-transversetemporal', 'ctx-lh-insula', 'ctx-rh-bankssts', 'ctx-rh-caudalanteriorcingulate', 'ctx-rh-caudalmiddlefrontal', 'ctx-rh-cuneus', 'ctx-rh-entorhinal', 'ctx-rh-fusiform', 'ctx-rh-inferiorparietal', 'ctx-rh-inferiortemporal', 'ctx-rh-isthmuscingulate', 'ctx-rh-lateraloccipital', 'ctx-rh-lateralorbitofrontal', 'ctx-rh-lingual', 'ctx-rh-medialorbitofrontal', 'ctx-rh-middletemporal', 'ctx-rh-parahippocampal', 'ctx-rh-paracentral', 'ctx-rh-parsopercularis', 'ctx-rh-parsorbitalis', 'ctx-rh-parstriangularis', 'ctx-rh-pericalcarine', 'ctx-rh-postcentral', 'ctx-rh-posteriorcingulate', 'ctx-rh-precentral', 'ctx-rh-precuneus', 'ctx-rh-rostralanteriorcingulate', 'ctx-rh-rostralmiddlefrontal', 'ctx-rh-superiorfrontal', 'ctx-rh-superiorparietal', 'ctx-rh-superiortemporal', 'ctx-rh-supramarginal', 'ctx-rh-frontalpole', 'ctx-rh-temporalpole', 'ctx-rh-transversetemporal', 'ctx-rh-insula'),
	'aparc_aseg'          = c('Left-Thalamus-Proper', 'Left-Caudate', 'Left-Putamen', 'Left-Pallidum', 'Left-Hippocampus', 'Left-Amygdala', 'Left-Accumbens-area', 'Right-Thalamus-Proper', 'Right-Caudate', 'Right-Putamen', 'Right-Pallidum', 'Right-Hippocampus', 'Right-Amygdala', 'Right-Accumbens-area', 'ctx-lh-bankssts', 'ctx-lh-caudalanteriorcingulate', 'ctx-lh-caudalmiddlefrontal', 'ctx-lh-cuneus', 'ctx-lh-entorhinal', 'ctx-lh-fusiform', 'ctx-lh-inferiorparietal', 'ctx-lh-inferiortemporal', 'ctx-lh-isthmuscingulate', 'ctx-lh-lateraloccipital', 'ctx-lh-lateralorbitofrontal', 'ctx-lh-lingual', 'ctx-lh-medialorbitofrontal', 'ctx-lh-middletemporal', 'ctx-lh-parahippocampal', 'ctx-lh-paracentral', 'ctx-lh-parsopercularis', 'ctx-lh-parsorbitalis', 'ctx-lh-parstriangularis', 'ctx-lh-pericalcarine', 'ctx-lh-postcentral', 'ctx-lh-posteriorcingulate', 'ctx-lh-precentral', 'ctx-lh-precuneus', 'ctx-lh-rostralanteriorcingulate', 'ctx-lh-rostralmiddlefrontal', 'ctx-lh-superiorfrontal', 'ctx-lh-superiorparietal', 'ctx-lh-superiortemporal', 'ctx-lh-supramarginal', 'ctx-lh-frontalpole', 'ctx-lh-temporalpole', 'ctx-lh-transversetemporal', 'ctx-lh-insula', 'ctx-rh-bankssts', 'ctx-rh-caudalanteriorcingulate', 'ctx-rh-caudalmiddlefrontal', 'ctx-rh-cuneus', 'ctx-rh-entorhinal', 'ctx-rh-fusiform', 'ctx-rh-inferiorparietal', 'ctx-rh-inferiortemporal', 'ctx-rh-isthmuscingulate', 'ctx-rh-lateraloccipital', 'ctx-rh-lateralorbitofrontal', 'ctx-rh-lingual', 'ctx-rh-medialorbitofrontal', 'ctx-rh-middletemporal', 'ctx-rh-parahippocampal', 'ctx-rh-paracentral', 'ctx-rh-parsopercularis', 'ctx-rh-parsorbitalis', 'ctx-rh-parstriangularis', 'ctx-rh-pericalcarine', 'ctx-rh-postcentral', 'ctx-rh-posteriorcingulate', 'ctx-rh-precentral', 'ctx-rh-precuneus', 'ctx-rh-rostralanteriorcingulate', 'ctx-rh-rostralmiddlefrontal', 'ctx-rh-superiorfrontal', 'ctx-rh-superiorparietal', 'ctx-rh-superiortemporal', 'ctx-rh-supramarginal', 'ctx-rh-frontalpole', 'ctx-rh-temporalpole', 'ctx-rh-transversetemporal', 'ctx-rh-insula'),
	'lausanne120'         = c('ctx-lh-bankssts_1', 'ctx-lh-caudalanteriorcingulate_1', 'ctx-lh-caudalmiddlefrontal_1', 'ctx-lh-cuneus_1', 'ctx-lh-entorhinal_1', 'ctx-lh-fusiform_1', 'ctx-lh-fusiform_2', 'ctx-lh-inferiorparietal_1', 'ctx-lh-inferiorparietal_2', 'ctx-lh-inferiortemporal_1', 'ctx-lh-inferiortemporal_2', 'ctx-lh-isthmuscingulate_1', 'ctx-lh-lateraloccipital_1', 'ctx-lh-lateraloccipital_2', 'ctx-lh-lateralorbitofrontal_1', 'ctx-lh-lateralorbitofrontal_2', 'ctx-lh-lingual_1', 'ctx-lh-lingual_2', 'ctx-lh-medialorbitofrontal_1', 'ctx-lh-middletemporal_1', 'ctx-lh-middletemporal_2', 'ctx-lh-parahippocampal_1', 'ctx-lh-paracentral_1', 'ctx-lh-parsopercularis_1', 'ctx-lh-parsorbitalis_1', 'ctx-lh-parstriangularis_1', 'ctx-lh-pericalcarine_1', 'ctx-lh-postcentral_1', 'ctx-lh-postcentral_2', 'ctx-lh-postcentral_3', 'ctx-lh-posteriorcingulate_1', 'ctx-lh-precentral_1', 'ctx-lh-precentral_2', 'ctx-lh-precentral_3', 'ctx-lh-precentral_4', 'ctx-lh-precuneus_1', 'ctx-lh-precuneus_2', 'ctx-lh-rostralanteriorcingulate_1', 'ctx-lh-rostralmiddlefrontal_1', 'ctx-lh-rostralmiddlefrontal_2', 'ctx-lh-rostralmiddlefrontal_3', 'ctx-lh-superiorfrontal_1', 'ctx-lh-superiorfrontal_2', 'ctx-lh-superiorfrontal_3', 'ctx-lh-superiorfrontal_4', 'ctx-lh-superiorparietal_1', 'ctx-lh-superiorparietal_2', 'ctx-lh-superiorparietal_3', 'ctx-lh-superiortemporal_1', 'ctx-lh-superiortemporal_2', 'ctx-lh-supramarginal_1', 'ctx-lh-supramarginal_2', 'ctx-lh-frontalpole_1', 'ctx-lh-temporalpole_1', 'ctx-lh-transversetemporal_1', 'ctx-lh-insula_1', 'ctx-lh-insula_2', 'ctx-rh-bankssts_1', 'ctx-rh-caudalanteriorcingulate_1', 'ctx-rh-caudalmiddlefrontal_1', 'ctx-rh-cuneus_1', 'ctx-rh-entorhinal_1', 'ctx-rh-fusiform_1', 'ctx-rh-fusiform_2', 'ctx-rh-inferiorparietal_1', 'ctx-rh-inferiorparietal_2', 'ctx-rh-inferiorparietal_3', 'ctx-rh-inferiortemporal_1', 'ctx-rh-inferiortemporal_2', 'ctx-rh-isthmuscingulate_1', 'ctx-rh-lateraloccipital_1', 'ctx-rh-lateraloccipital_2', 'ctx-rh-lateraloccipital_3', 'ctx-rh-lateralorbitofrontal_1', 'ctx-rh-lateralorbitofrontal_2', 'ctx-rh-lingual_1', 'ctx-rh-lingual_2', 'ctx-rh-medialorbitofrontal_1', 'ctx-rh-medialorbitofrontal_2', 'ctx-rh-middletemporal_1', 'ctx-rh-middletemporal_2', 'ctx-rh-parahippocampal_1', 'ctx-rh-paracentral_1', 'ctx-rh-parsopercularis_1', 'ctx-rh-parsorbitalis_1', 'ctx-rh-parstriangularis_1', 'ctx-rh-pericalcarine_1', 'ctx-rh-postcentral_1', 'ctx-rh-postcentral_2', 'ctx-rh-posteriorcingulate_1', 'ctx-rh-precentral_1', 'ctx-rh-precentral_2', 'ctx-rh-precentral_3', 'ctx-rh-precuneus_1', 'ctx-rh-precuneus_2', 'ctx-rh-rostralanteriorcingulate_1', 'ctx-rh-rostralmiddlefrontal_1', 'ctx-rh-rostralmiddlefrontal_2', 'ctx-rh-superiorfrontal_1', 'ctx-rh-superiorfrontal_2', 'ctx-rh-superiorfrontal_3', 'ctx-rh-superiorfrontal_4', 'ctx-rh-superiorparietal_1', 'ctx-rh-superiorparietal_2', 'ctx-rh-superiorparietal_3', 'ctx-rh-superiortemporal_1', 'ctx-rh-superiortemporal_2', 'ctx-rh-supramarginal_1', 'ctx-rh-supramarginal_2', 'ctx-rh-frontalpole_1', 'ctx-rh-temporalpole_1', 'ctx-rh-transversetemporal_1', 'ctx-rh-insula_1', 'ctx-rh-insula_2'),
	'lausanne120_aseg'    = c('Left-Thalamus-Proper', 'Left-Caudate', 'Left-Putamen', 'Left-Pallidum', 'Left-Hippocampus', 'Left-Amygdala', 'Left-Accumbens-area', 'Right-Thalamus-Proper', 'Right-Caudate', 'Right-Putamen', 'Right-Pallidum', 'Right-Hippocampus', 'Right-Amygdala', 'Right-Accumbens-area', 'ctx-lh-bankssts_1', 'ctx-lh-caudalanteriorcingulate_1', 'ctx-lh-caudalmiddlefrontal_1', 'ctx-lh-cuneus_1', 'ctx-lh-entorhinal_1', 'ctx-lh-fusiform_1', 'ctx-lh-fusiform_2', 'ctx-lh-inferiorparietal_1', 'ctx-lh-inferiorparietal_2', 'ctx-lh-inferiortemporal_1', 'ctx-lh-inferiortemporal_2', 'ctx-lh-isthmuscingulate_1', 'ctx-lh-lateraloccipital_1', 'ctx-lh-lateraloccipital_2', 'ctx-lh-lateralorbitofrontal_1', 'ctx-lh-lateralorbitofrontal_2', 'ctx-lh-lingual_1', 'ctx-lh-lingual_2', 'ctx-lh-medialorbitofrontal_1', 'ctx-lh-middletemporal_1', 'ctx-lh-middletemporal_2', 'ctx-lh-parahippocampal_1', 'ctx-lh-paracentral_1', 'ctx-lh-parsopercularis_1', 'ctx-lh-parsorbitalis_1', 'ctx-lh-parstriangularis_1', 'ctx-lh-pericalcarine_1', 'ctx-lh-postcentral_1', 'ctx-lh-postcentral_2', 'ctx-lh-postcentral_3', 'ctx-lh-posteriorcingulate_1', 'ctx-lh-precentral_1', 'ctx-lh-precentral_2', 'ctx-lh-precentral_3', 'ctx-lh-precentral_4', 'ctx-lh-precuneus_1', 'ctx-lh-precuneus_2', 'ctx-lh-rostralanteriorcingulate_1', 'ctx-lh-rostralmiddlefrontal_1', 'ctx-lh-rostralmiddlefrontal_2', 'ctx-lh-rostralmiddlefrontal_3', 'ctx-lh-superiorfrontal_1', 'ctx-lh-superiorfrontal_2', 'ctx-lh-superiorfrontal_3', 'ctx-lh-superiorfrontal_4', 'ctx-lh-superiorparietal_1', 'ctx-lh-superiorparietal_2', 'ctx-lh-superiorparietal_3', 'ctx-lh-superiortemporal_1', 'ctx-lh-superiortemporal_2', 'ctx-lh-supramarginal_1', 'ctx-lh-supramarginal_2', 'ctx-lh-frontalpole_1', 'ctx-lh-temporalpole_1', 'ctx-lh-transversetemporal_1', 'ctx-lh-insula_1', 'ctx-lh-insula_2', 'ctx-rh-bankssts_1', 'ctx-rh-caudalanteriorcingulate_1', 'ctx-rh-caudalmiddlefrontal_1', 'ctx-rh-cuneus_1', 'ctx-rh-entorhinal_1', 'ctx-rh-fusiform_1', 'ctx-rh-fusiform_2', 'ctx-rh-inferiorparietal_1', 'ctx-rh-inferiorparietal_2', 'ctx-rh-inferiorparietal_3', 'ctx-rh-inferiortemporal_1', 'ctx-rh-inferiortemporal_2', 'ctx-rh-isthmuscingulate_1', 'ctx-rh-lateraloccipital_1', 'ctx-rh-lateraloccipital_2', 'ctx-rh-lateraloccipital_3', 'ctx-rh-lateralorbitofrontal_1', 'ctx-rh-lateralorbitofrontal_2', 'ctx-rh-lingual_1', 'ctx-rh-lingual_2', 'ctx-rh-medialorbitofrontal_1', 'ctx-rh-medialorbitofrontal_2', 'ctx-rh-middletemporal_1', 'ctx-rh-middletemporal_2', 'ctx-rh-parahippocampal_1', 'ctx-rh-paracentral_1', 'ctx-rh-parsopercularis_1', 'ctx-rh-parsorbitalis_1', 'ctx-rh-parstriangularis_1', 'ctx-rh-pericalcarine_1', 'ctx-rh-postcentral_1', 'ctx-rh-postcentral_2', 'ctx-rh-posteriorcingulate_1', 'ctx-rh-precentral_1', 'ctx-rh-precentral_2', 'ctx-rh-precentral_3', 'ctx-rh-precuneus_1', 'ctx-rh-precuneus_2', 'ctx-rh-rostralanteriorcingulate_1', 'ctx-rh-rostralmiddlefrontal_1', 'ctx-rh-rostralmiddlefrontal_2', 'ctx-rh-superiorfrontal_1', 'ctx-rh-superiorfrontal_2', 'ctx-rh-superiorfrontal_3', 'ctx-rh-superiorfrontal_4', 'ctx-rh-superiorparietal_1', 'ctx-rh-superiorparietal_2', 'ctx-rh-superiorparietal_3', 'ctx-rh-superiortemporal_1', 'ctx-rh-superiortemporal_2', 'ctx-rh-supramarginal_1', 'ctx-rh-supramarginal_2', 'ctx-rh-frontalpole_1', 'ctx-rh-temporalpole_1', 'ctx-rh-transversetemporal_1', 'ctx-rh-insula_1', 'ctx-rh-insula_2'),
	'lausanne250'         = c('ctx-lh-bankssts_1', 'ctx-lh-bankssts_2', 'ctx-lh-caudalanteriorcingulate_1', 'ctx-lh-caudalmiddlefrontal_1', 'ctx-lh-caudalmiddlefrontal_2', 'ctx-lh-caudalmiddlefrontal_3', 'ctx-lh-cuneus_1', 'ctx-lh-entorhinal_1', 'ctx-lh-fusiform_1', 'ctx-lh-fusiform_2', 'ctx-lh-fusiform_3', 'ctx-lh-fusiform_4', 'ctx-lh-inferiorparietal_1', 'ctx-lh-inferiorparietal_2', 'ctx-lh-inferiorparietal_3', 'ctx-lh-inferiorparietal_4', 'ctx-lh-inferiorparietal_5', 'ctx-lh-inferiortemporal_1', 'ctx-lh-inferiortemporal_2', 'ctx-lh-inferiortemporal_3', 'ctx-lh-inferiortemporal_4', 'ctx-lh-isthmuscingulate_1', 'ctx-lh-lateraloccipital_1', 'ctx-lh-lateraloccipital_2', 'ctx-lh-lateraloccipital_3', 'ctx-lh-lateraloccipital_4', 'ctx-lh-lateraloccipital_5', 'ctx-lh-lateralorbitofrontal_1', 'ctx-lh-lateralorbitofrontal_2', 'ctx-lh-lateralorbitofrontal_3', 'ctx-lh-lateralorbitofrontal_4', 'ctx-lh-lingual_1', 'ctx-lh-lingual_2', 'ctx-lh-lingual_3', 'ctx-lh-lingual_4', 'ctx-lh-medialorbitofrontal_1', 'ctx-lh-medialorbitofrontal_2', 'ctx-lh-middletemporal_1', 'ctx-lh-middletemporal_2', 'ctx-lh-middletemporal_3', 'ctx-lh-middletemporal_4', 'ctx-lh-parahippocampal_1', 'ctx-lh-paracentral_1', 'ctx-lh-paracentral_2', 'ctx-lh-parsopercularis_1', 'ctx-lh-parsopercularis_2', 'ctx-lh-parsorbitalis_1', 'ctx-lh-parstriangularis_1', 'ctx-lh-pericalcarine_1', 'ctx-lh-postcentral_1', 'ctx-lh-postcentral_2', 'ctx-lh-postcentral_3', 'ctx-lh-postcentral_4', 'ctx-lh-postcentral_5', 'ctx-lh-postcentral_6', 'ctx-lh-postcentral_7', 'ctx-lh-posteriorcingulate_1', 'ctx-lh-posteriorcingulate_2', 'ctx-lh-precentral_1', 'ctx-lh-precentral_2', 'ctx-lh-precentral_3', 'ctx-lh-precentral_4', 'ctx-lh-precentral_5', 'ctx-lh-precentral_6', 'ctx-lh-precentral_7', 'ctx-lh-precentral_8', 'ctx-lh-precuneus_1', 'ctx-lh-precuneus_2', 'ctx-lh-precuneus_3', 'ctx-lh-precuneus_4', 'ctx-lh-precuneus_5', 'ctx-lh-rostralanteriorcingulate_1', 'ctx-lh-rostralmiddlefrontal_1', 'ctx-lh-rostralmiddlefrontal_2', 'ctx-lh-rostralmiddlefrontal_3', 'ctx-lh-rostralmiddlefrontal_4', 'ctx-lh-rostralmiddlefrontal_5', 'ctx-lh-rostralmiddlefrontal_6', 'ctx-lh-superiorfrontal_1', 'ctx-lh-superiorfrontal_2', 'ctx-lh-superiorfrontal_3', 'ctx-lh-superiorfrontal_4', 'ctx-lh-superiorfrontal_5', 'ctx-lh-superiorfrontal_6', 'ctx-lh-superiorfrontal_7', 'ctx-lh-superiorfrontal_8', 'ctx-lh-superiorfrontal_9', 'ctx-lh-superiorparietal_1', 'ctx-lh-superiorparietal_2', 'ctx-lh-superiorparietal_3', 'ctx-lh-superiorparietal_4', 'ctx-lh-superiorparietal_5', 'ctx-lh-superiorparietal_6', 'ctx-lh-superiorparietal_7', 'ctx-lh-superiortemporal_1', 'ctx-lh-superiortemporal_2', 'ctx-lh-superiortemporal_3', 'ctx-lh-superiortemporal_4', 'ctx-lh-superiortemporal_5', 'ctx-lh-supramarginal_1', 'ctx-lh-supramarginal_2', 'ctx-lh-supramarginal_3', 'ctx-lh-supramarginal_4', 'ctx-lh-supramarginal_5', 'ctx-lh-frontalpole_1', 'ctx-lh-temporalpole_1', 'ctx-lh-transversetemporal_1', 'ctx-lh-insula_1', 'ctx-lh-insula_2', 'ctx-lh-insula_3', 'ctx-lh-insula_4', 'ctx-rh-bankssts_1', 'ctx-rh-caudalanteriorcingulate_1', 'ctx-rh-caudalmiddlefrontal_1', 'ctx-rh-caudalmiddlefrontal_2', 'ctx-rh-caudalmiddlefrontal_3', 'ctx-rh-cuneus_1', 'ctx-rh-cuneus_2', 'ctx-rh-entorhinal_1', 'ctx-rh-fusiform_1', 'ctx-rh-fusiform_2', 'ctx-rh-fusiform_3', 'ctx-rh-fusiform_4', 'ctx-rh-inferiorparietal_1', 'ctx-rh-inferiorparietal_2', 'ctx-rh-inferiorparietal_3', 'ctx-rh-inferiorparietal_4', 'ctx-rh-inferiorparietal_5', 'ctx-rh-inferiorparietal_6', 'ctx-rh-inferiortemporal_1', 'ctx-rh-inferiortemporal_2', 'ctx-rh-inferiortemporal_3', 'ctx-rh-inferiortemporal_4', 'ctx-rh-isthmuscingulate_1', 'ctx-rh-lateraloccipital_1', 'ctx-rh-lateraloccipital_2', 'ctx-rh-lateraloccipital_3', 'ctx-rh-lateraloccipital_4', 'ctx-rh-lateraloccipital_5', 'ctx-rh-lateralorbitofrontal_1', 'ctx-rh-lateralorbitofrontal_2', 'ctx-rh-lateralorbitofrontal_3', 'ctx-rh-lateralorbitofrontal_4', 'ctx-rh-lingual_1', 'ctx-rh-lingual_2', 'ctx-rh-lingual_3', 'ctx-rh-medialorbitofrontal_1', 'ctx-rh-medialorbitofrontal_2', 'ctx-rh-medialorbitofrontal_3', 'ctx-rh-middletemporal_1', 'ctx-rh-middletemporal_2', 'ctx-rh-middletemporal_3', 'ctx-rh-middletemporal_4', 'ctx-rh-parahippocampal_1', 'ctx-rh-paracentral_1', 'ctx-rh-paracentral_2', 'ctx-rh-paracentral_3', 'ctx-rh-parsopercularis_1', 'ctx-rh-parsopercularis_2', 'ctx-rh-parsorbitalis_1', 'ctx-rh-parstriangularis_1', 'ctx-rh-parstriangularis_2', 'ctx-rh-pericalcarine_1', 'ctx-rh-pericalcarine_2', 'ctx-rh-postcentral_1', 'ctx-rh-postcentral_2', 'ctx-rh-postcentral_3', 'ctx-rh-postcentral_4', 'ctx-rh-postcentral_5', 'ctx-rh-posteriorcingulate_1', 'ctx-rh-posteriorcingulate_2', 'ctx-rh-precentral_1', 'ctx-rh-precentral_2', 'ctx-rh-precentral_3', 'ctx-rh-precentral_4', 'ctx-rh-precentral_5', 'ctx-rh-precentral_6', 'ctx-rh-precuneus_1', 'ctx-rh-precuneus_2', 'ctx-rh-precuneus_3', 'ctx-rh-precuneus_4', 'ctx-rh-precuneus_5', 'ctx-rh-rostralanteriorcingulate_1', 'ctx-rh-rostralmiddlefrontal_1', 'ctx-rh-rostralmiddlefrontal_2', 'ctx-rh-rostralmiddlefrontal_3', 'ctx-rh-rostralmiddlefrontal_4', 'ctx-rh-rostralmiddlefrontal_5', 'ctx-rh-rostralmiddlefrontal_6', 'ctx-rh-superiorfrontal_1', 'ctx-rh-superiorfrontal_2', 'ctx-rh-superiorfrontal_3', 'ctx-rh-superiorfrontal_4', 'ctx-rh-superiorfrontal_5', 'ctx-rh-superiorfrontal_6', 'ctx-rh-superiorfrontal_7', 'ctx-rh-superiorfrontal_8', 'ctx-rh-superiorparietal_1', 'ctx-rh-superiorparietal_2', 'ctx-rh-superiorparietal_3', 'ctx-rh-superiorparietal_4', 'ctx-rh-superiorparietal_5', 'ctx-rh-superiorparietal_6', 'ctx-rh-superiorparietal_7', 'ctx-rh-superiortemporal_1', 'ctx-rh-superiortemporal_2', 'ctx-rh-superiortemporal_3', 'ctx-rh-superiortemporal_4', 'ctx-rh-superiortemporal_5', 'ctx-rh-supramarginal_1', 'ctx-rh-supramarginal_2', 'ctx-rh-supramarginal_3', 'ctx-rh-supramarginal_4', 'ctx-rh-frontalpole_1', 'ctx-rh-temporalpole_1', 'ctx-rh-transversetemporal_1', 'ctx-rh-insula_1', 'ctx-rh-insula_2', 'ctx-rh-insula_3')
)

.map2color = function(x,pal,limits=NULL){
	if (is.null(limits)) limits=range(x)
	pal[findInterval(x,seq(limits[1],limits[2],length.out=length(pal)+1), all.inside=TRUE)]
}

.ggsciPalettes = list(
	'npg'          = c('nrc'),
	'aaas'         = c('default'),
	'nejm'         = c('default'),
	'jama'         = c('default'),
	'lancet'       = c('lanonc'),
	'uchicago'     = c('default', 'light', 'dark'),
	'jco'          = c('default'),
	'frontiers'    = c('default'),
	'ucscgb'       = c('default'),
	'igv'          = c('default', 'alternating'),
	'gsea'         = c('default'),
	'locuszoom'    = c('default'),
	'd3'           = c('category10', 'category20', 'category20b', 'category20c'),
	'material'     = c('red', 'pink', 'purple', 'deep-purple', 'indigo', 'blue', 'light-blue', 'cyan', 'teal', 'green', 'light-green', 'lime', 'yellow', 'amber', 'orange', 'deep-orange', 'brown', 'grey', 'blue-grey'),
	'cosmic'       = c('hallmarks_light', 'hallmarks_dark', 'signature_substitutions'),
	'flatui'       = c('default', 'flattastic', 'aussie'),
	'startrek'     = c('uniform'),
	'simpsons'     = c('springfield'),
	'futurama'     = c('planetexpress'),
	'rickandmorty' = c('schwifty'),
	'tron'         = c('legacy')
)

.colorBrewerPalettes = list(
	'sequential' = list(
		'Blues'    = 9,
		'BuGn'     = 9,
		'BuPu'     = 9,
		'GnBu'     = 9,
		'Greens'   = 9,
		'Greys'    = 9,
		'Oranges'  = 9,
		'OrRd'     = 9,
		'PuBu'     = 9,
		'PuBuGn'   = 9,
		'PuRd'     = 9,
		'Purples'  = 9,
		'RdPu'     = 9,
		'Reds'     = 9,
		'YlGn'     = 9,
		'YlGnBu'   = 9,
		'YlOrBr'   = 9,
		'YlOrRd'   = 9
	),
	'diverging' = list(
		'BrBG'     = 11,
		'PiYG'     = 11,
		'PRGn'     = 11,
		'PuOr'     = 11,
		'RdBu'     = 11,
		'RdGy'     = 11,
		'RdYlBu'   = 11,
		'RdYlGn'   = 11,
		'Spectral' = 11
	),
	'qualitative' = list(
		'Accent'   = 8,
		'Dark2'    = 8,
		'Paired'   = 12,
		'Pastel1'  = 9,
		'Pastel2'  = 8,
		'Set1'     = 9,
		'Set2'     = 8,
		'Set3'     = 12
	)
)

.ggsciMapPalette = function(color.theme) {
	if (grepl('_',color.theme)) {	
		fun = paste0('ggsci::pal_',gsub('^(.+?)_(.+)','\\1',color.theme))
		pal = gsub('^(.+?)_(.+)','\\2',color.theme)
	} else {
		fun = paste0('ggsci::pal_',color.theme)
		pal = .ggsciPalettes[[color.theme]][1]
	}
	eval(parse(text=fun))(palette=pal)
}

.ggsciMapPalette2 = function(color.theme) {
	if (grepl('_',color.theme)) {	
		fun = paste0('ggsci::rgb_',gsub('^(.+?)_(.+)','\\1',color.theme))
		pal = gsub('^(.+?)_(.+)','\\2',color.theme)
	} else {
		fun = paste0('ggsci::rgb_',color.theme)
		pal = .ggsciPalettes[[color.theme]][1]
	}
	eval(parse(text=fun))(palette=pal,n=255)
}

.colorBrewerMapPalette = function(color.theme) {
	.colorBrewerPalettes[[which(unlist(lapply(names(.colorBrewerPalettes),function(i) color.theme %in% names(.colorBrewerPalettes[[i]]))))]][[color.theme]]
}

#' Simple macaque brain plot
#'
#' This function plots data onto a simple macaque brain.
#' 
#' @param values Vector of values to be plotted. Names are optional and should correspond with region names. If names are not provided, `regions` must be provided.
#' @param regions Vector of region names. Should be the same length as `values`. Required if `values` is an unnamed vector.
#' @param base.image Base image to be used. Should be one of `c("chiou_huang_2023", "chiou_decasien_2022", "wbb47", "aparc", "aparc_aseg", "lausanne120", "lausanne120_aseg", "lausanne250")`.
#' @param color If `TRUE`, `values` are interpreted as color values to be plotted.
#' @param color.family Source of color palettes. Should be one of `c("brewer", "viridis". "ggsci")`.
#' @param color.theme Specific palette supported by one of the `color.family` sources.
#' @param color.limits Limits for the color range. It `NULL`, limits will be calculated from the data.
#' @param reverse If `TRUE`, reverse the color scale. Ignored if `color` is `TRUE`.
#' @param legend If `TRUE`, a legend will be included.
#' @param legend.title Custom title for the legend. Ignored if `legend` is not `TRUE`.
#' @param labels If `TRUE`, brain regions are labeled.
#' @param display.options List of brain display parameters.
#' @return A ggplot object.
#' @export
plot_brain = function(
	values=NULL,
	regions=NULL,
	base.image=NULL,
	color=NULL,
	color.family=c('viridis','brewer','ggsci'),
	color.theme=NULL,
	color.limits=NULL,
	reverse = FALSE,
	legend=TRUE,
	labels=TRUE,
	legend.title=NULL,
	display.options=list()
) {
	suppressMessages(require(svgtools,warn.conflicts=FALSE))
	suppressMessages(require(xml2,warn.conflicts=FALSE))
	suppressMessages(require(purrr,warn.conflicts=FALSE))
	suppressMessages(require(ggplot2,warn.conflicts=FALSE))
	suppressMessages(require(svgparser,warn.conflicts=FALSE))
	
	if (is.null(values)) stop('"values" must not be NULL!')
	if (is.null(regions) && is.null(names(values))) stop('Either "values" must be a named vector or "regions" must be provided.')
	if (!is.null(regions) && (length(regions) %% length(values)) != 0) stop('Length of "regions" and "values" does not conform.')
	if (is.null(regions)) regions = names(values)
	
	if (any(c('character','factor','ordered','logical') %in% class(values))) {
		if (!is.null(color) && color) {
			colors = values
		} else {
			color.family = intersect(color.family,c('brewer','ggsci'))[1]
			if (color.family == 'brewer') {
				suppressMessages(require(RColorBrewer,warn.conflicts=FALSE))
				if (is.null(color.theme)) color.theme = 'Set3'
				if (!color.theme %in% names(.colorBrewerPalettes$qualitative))
					stop('"color.theme" must be one of ',paste0('c("',paste(names(.colorBrewerPalettes$qualitative),collapse='", "'),'")'))
				colors = if (reverse) {
					suppressWarnings(rev(RColorBrewer::brewer.pal(length(unique(values)),name=color.theme)))
				} else {
					suppressWarnings(RColorBrewer::brewer.pal(length(unique(values)),name=color.theme))
				}
				names(colors) = if ('factor' %in% class(values)) levels(values) else unique(values)
				colors = colors[values]
			} else if (color.family == 'ggsci') {
				suppressMessages(require(ggsci,warn.conflicts=FALSE))
				if (is.null(color.theme)) color.theme = 'npg'
				if (!color.theme %in% c(names(.ggsciPalettes ),c(unlist(lapply(names(.ggsciPalettes),function(i) paste(i,.ggsciPalettes[[i]],sep='_'))))))
					stop('"pal" must in one of ','c("',paste(c(unlist(lapply(names(.ggsciPalettes),function(i) paste(i,.ggsciPalettes[[i]],sep='_')))),collapse='", "'),'")')
				colors = if (reverse) {
					suppressWarnings(rev(.ggsciMapPalette(color.theme)(length(unique(values)))))
				} else {
					suppressWarnings(.ggsciMapPalette(color.theme)(length(unique(values))))
				}
				names(colors) = if ('factor' %in% class(values)) levels(values) else unique(values)
				colors = colors[values]
			}
		}
	} else if (any(c('numeric','integer') %in% class(values))) {
		if (!is.null(color.limits) && length(color.limits) != 2 && !class(color.limits) %in% c('integer','numeric')) stop('"color.limits" must be "integer" or "numeric" class of length 2')

		color.family = intersect(color.family,c('brewer','viridis','ggsci'))[1]
		if (color.family == 'brewer') {
			suppressMessages(require(RColorBrewer,warn.conflicts=FALSE))
			if (is.null(color.theme)) color.theme = 'PuBu'
			if (!color.theme %in% unlist(lapply(.colorBrewerPalettes[c('sequential','diverging')],names)))
				stop('"color.theme" must be one of c("',paste(unlist(lapply(.colorBrewerPalettes[c('sequential','diverging')],names)),collapse='", "'),'")')
			colors = if (reverse) {
				.map2color(values,rev(RColorBrewer::brewer.pal(.colorBrewerMapPalette(color.theme),name=color.theme)),limits=color.limits)
			} else {
				.map2color(values,RColorBrewer::brewer.pal(.colorBrewerMapPalette(color.theme),name=color.theme),limits=color.limits)
			}
		} else if (color.family == 'viridis') {
			suppressMessages(require(viridis,warn.conflicts=FALSE))
			if (is.null(color.theme)) color.theme = 'viridis'
			if (!color.theme %in% c('magma','A','inferno','B','plasma','C','viridis','D','cividis','E','rocket','F','mako','G','turbo','H'))
				stop('"color.theme" must be one of c("magma","A","inferno","B","plasma","C","viridis","D","cividis","E","rocket","F","mako","G","turbo","H")')
			colors = if (reverse) {
				.map2color(values,rev(viridis::viridis_pal(option=color.theme)(255)),limits=color.limits)
			} else {
				.map2color(values,viridis::viridis_pal(option=color.theme)(255),limits=color.limits)
			}
		} else if (color.family == 'ggsci') {
			suppressMessages(require(ggsci,warn.conflicts=FALSE))
			if (is.null(color.theme)) color.theme = 'gsea'
			if (!color.theme %in% c('gsea','material'))
				stop('"color.theme" must in one of c("gsea", "material")')
			colors = if (reverse) {
				.map2color(values,rev(.ggsciMapPalette2(color.theme)),limits=color.limits)
			} else {
				.map2color(values,.ggsciMapPalette2(color.theme),limits=color.limits)
			}
		}
	} else {
		stop('"values" must be one of c("integer","numeric","logical","character","factor")')
	}
	names(colors) = regions
	
	if (!is.null(base.image) && !base.image %in% names(.baseImages)) {
		stop('Invalid base image "',base.image,'". ',paste0('c("',paste(names(.baseImages),collapse='", "'),'")'),' are supported base images.')
	}
	if (is.null(base.image)) base.image = 'chiou_huang_2023'
	svg = system.file(.baseImages[base.image],package='macaquesimplebrain')
	xml = svgtools::read_svg(svg)
	
	these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@class="',i,'"]'))),collapse='|'))
	
	purrr::walk2(these.nodes, colors[xml2::xml_attr(these.nodes,'class')], ~xml2::xml_set_attr(.x, 'fill', .y))
	purrr::walk2(these.nodes, 'inline', ~xml2::xml_set_attr(.x, 'display', .y))
	
	these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@class="label-',i,'"]'))),collapse='|'))
	purrr::walk2(these.nodes, if(labels) '#000' else 'none', ~xml2::xml_set_attr(.x, 'fill', .y))
	purrr::walk2(these.nodes, if(labels) 'inline' else 'none', ~xml2::xml_set_attr(.x, 'display', .y))
	these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@id="path-',i,'"]'))),collapse='|'))
	purrr::walk2(these.nodes, if(labels) '#000' else 'none', ~xml2::xml_set_attr(.x, 'stroke', .y))
	purrr::walk2(these.nodes, if(labels) 'inline' else 'none', ~xml2::xml_set_attr(.x, 'display', .y))
	
	if (length(display.options)) {
		if (!any(c('outline_color','outline_alpha','outline_width','bg_color','bg_alpha','bg2_color','bg2_alpha','stroke_color','stroke_alpha','stroke_width','label_color','label_alpha','pointer_color','pointer_alpha','pointer_width','inset_color','inset_alpha','inset_width','inset_dasharray') %in% names(display.options))) stop('At least one parameter must be provided from c("bg_color", "bg_alpha", "bg2_color", "bg2_alpha", "stroke_color", "stroke_alpha", "stroke_width", "label_color", "label_alpha", "pointer_color", "pointer_alpha", "pointer_width", "inset_color", "inset_alpha", "inset_width", "inset_dasharray").')
		if (length(intersect(c('bg_color','bg_alpha'),names(display.options)))) {
			these.nodes = xml2::xml_find_all(xml,'//*[@class="bg"]')
			purrr::walk2(these.nodes, 'inline', ~xml2::xml_set_attr(.x, 'display', .y))
			if ('bg_color' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['bg_color']], ~xml2::xml_set_attr(.x, 'fill', .y))
			if ('bg_alpha' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['bg_alpha']], ~xml2::xml_set_attr(.x, 'opacity', .y))
		}
		if (length(intersect(c('bg2_color','bg2_alpha'),names(display.options)))) {
			these.nodes = xml2::xml_find_all(xml,'//*[@class="bg2"]')
			purrr::walk2(these.nodes, 'inline', ~xml2::xml_set_attr(.x, 'display', .y))
			if ('bg2_color' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['bg2_color']], ~xml2::xml_set_attr(.x, 'fill', .y))
			if ('bg2_alpha' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['bg2_alpha']], ~xml2::xml_set_attr(.x, 'opacity', .y))
		}
		if (length(intersect(c('outline_color','outline_alpha','outline_width'),names(display.options)))) {
			these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@id="',i,'"]'))),collapse='|'))
			if ('outline_color' %in% names(display.options)) {
				if (display.options[['outline_color']] == 'inherit') {
					purrr::walk2(these.nodes, colors[xml2::xml_attr(these.nodes,'id')], ~xml2::xml_set_attr(.x, 'stroke', .y))
				} else {
					purrr::walk2(these.nodes, display.options[['outline_color']], ~xml2::xml_set_attr(.x, 'stroke', .y))
				}
			}
			if ('outline_width' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['outline_width']], ~xml2::xml_set_attr(.x, 'stroke-width', .y))
			if ('outline_alpha' %in% names(display.options)) {
				# purrr::walk2(these.nodes, ifelse(display.options[['outline_alpha']]*2>1,1,display.options[['outline_alpha']]*2), ~xml2::xml_set_attr(.x, 'stroke-opacity', .y))
				these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@class="',i,'"]|//*[@id="',i,'"]'))),collapse='|'))
				purrr::walk2(these.nodes, display.options[['outline_alpha']], ~xml2::xml_set_attr(.x, 'opacity', .y))
			}
		}
		if (length(intersect(c('inset_color','inset_alpha','inset_width','inset_dasharray'),names(display.options)))) {
			these.nodes = xml2::xml_find_all(xml,'//*[contains(@class, "inset")]')
			if ('inset_color' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['inset_color']], ~xml2::xml_set_attr(.x, 'stroke', .y))
			if ('inset_width' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['inset_width']], ~xml2::xml_set_attr(.x, 'stroke-width', .y))
			if ('inset_alpha' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['inset_alpha']], ~xml2::xml_set_attr(.x, 'stroke-opacity', .y))
			if ('inset_dasharray' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['inset_dasharray']], ~xml2::xml_set_attr(.x, 'stroke-dasharray', .y))			
		}
		if (length(intersect(c('stroke_color','stroke_alpha','stroke_width'),names(display.options)))) {
			these.nodes = xml2::xml_find_all(xml,'//*[contains(@class, "brain")]')
			if ('stroke_color' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['stroke_color']], ~xml2::xml_set_attr(.x, 'stroke', .y))
			if ('stroke_alpha' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['stroke_alpha']], ~xml2::xml_set_attr(.x, 'stroke-opacity', .y))
			if ('stroke_width' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['stroke_width']], ~xml2::xml_set_attr(.x, 'stroke-width', .y))
		}
		if (length(intersect(c('label_color','label_alpha'),names(display.options))) && labels) {
			these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@class="label-',i,'"]'))),collapse='|'))
			if ('label_color' %in% names(display.options)) {
				if (display.options[['label_color']] == 'inherit') {
					purrr::walk2(these.nodes, colors[gsub('^label-','',xml2::xml_attr(these.nodes,'class'))], ~xml2::xml_set_attr(.x, 'fill', .y))
				} else {
					purrr::walk2(these.nodes, display.options[['label_color']], ~xml2::xml_set_attr(.x, 'fill', .y))
				}
			}
			if ('label_alpha' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['label_alpha']], ~xml2::xml_set_attr(.x, 'opacity', .y))
		}
		if (length(intersect(c('pointer_color','pointer_alpha','pointer_width'),names(display.options))) && labels) {
			these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@id="path-',i,'"]'))),collapse='|'))
			if ('pointer_color' %in% names(display.options)) {
				if (display.options[['pointer_color']] == 'inherit') {
					purrr::walk2(these.nodes, colors[gsub('^path-','',xml2::xml_attr(these.nodes,'id'))], ~xml2::xml_set_attr(.x, 'stroke', .y))
				} else {
					purrr::walk2(these.nodes, display.options[['pointer_color']], ~xml2::xml_set_attr(.x, 'stroke', .y))
				}
			}
			if ('pointer_alpha' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['pointer_alpha']], ~xml2::xml_set_attr(.x, 'stroke-opacity', .y))
			if ('pointer_width' %in% names(display.options)) purrr::walk2(these.nodes, display.options[['pointer_width']], ~xml2::xml_set_attr(.x, 'stroke-width', .y))
		}
	}
	if (!grepl('xmlns="http://www.w3.org/2000/svg"',toString(xml))) {
		g = svgparser::read_svg(gsub('<svg ','<svg xmlns="http://www.w3.org/2000/svg" ',toString(xml)))
	} else {
		g = svgparser::read_svg(toString(xml))
	}
	
	if (any(c('character','factor','ordered','logical') %in% class(values))) {
		if (legend) {
			if (!is.null(color) && color) {
				p = ggplot(data=data.frame(x=(0:(length(regions)-1))/(length(regions)-1),y=(0:(length(regions)-1))/(length(regions)-1),regions,values=regions,colors),aes(x,y)) + geom_polygon(mapping=aes(fill=values),alpha=0,show.legend=TRUE) + scale_fill_manual(values=colors)
			} else {
				legend.colors = unique(data.frame(values,colors))$colors
				names(legend.colors) = unique(data.frame(values,colors))$values
				p = ggplot(data=data.frame(x=(0:(length(regions)-1))/(length(regions)-1),y=(0:(length(regions)-1))/(length(regions)-1),regions,values,colors),aes(x,y)) + geom_polygon(mapping=aes(fill=values),alpha=0,show.legend=TRUE) + scale_fill_manual(values=legend.colors)
			}
		} else {
			names(colors) = values
			p = ggplot() + geom_blank(mapping=aes(fill=values),show.legend=FALSE) + scale_fill_manual(values=colors)
		}
	} else if (any(c('numeric','integer') %in% class(values))) {
		if (color.family == 'brewer') {
			if (reverse){
				p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + scale_fill_gradientn(colors=rev(RColorBrewer::brewer.pal(.colorBrewerMapPalette(color.theme),name=color.theme)))
			} else {
				p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + scale_fill_gradientn(colors=RColorBrewer::brewer.pal(.colorBrewerMapPalette(color.theme),name=color.theme))
			}
		} else if (color.family == 'ggsci') {
			if (reverse) {
				p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + scale_fill_gradientn(colors=rev(.ggsciMapPalette2(color.theme)))
			} else {
				p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + scale_fill_gradientn(colors=.ggsciMapPalette2(color.theme))
			}
		} else if (color.family == 'viridis') {
			if (reverse) {
				p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + viridis::scale_fill_viridis(option=color.theme,direction=-1)
			} else {
				p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + viridis::scale_fill_viridis(option=color.theme)
			}
		}
	}
	p = p + annotation_custom(g,xmin=0,xmax=1.25,ymin=0,ymax=1)
	if (legend) {
		if (any(c('character','factor','ordered','logical') %in% class(values))) {
			p = p + theme_void(base_size=24) + theme(legend.position='right',legend.margin=margin(r = 0.25, unit='in'),legend.text.align=0) + guides(fill=guide_legend(position='right',override.aes=list(alpha=1)))
		} else {
			p = p + theme_void(base_size=24) + theme(legend.margin=margin(r = 0.25, unit='in'),legend.text.align=1)
		}
		if (!is.null(legend.title) && !is.na(legend.title) && legend.title != 'none') {
			p + labs(fill=legend.title) 
		} else if (!is.null(legend.title) && (is.na(legend.title) || legend.title == 'none')) {
			p + theme(legend.title = element_blank())
		} else {
			p
		}
	} else {
		p + theme_void(base_size=24) + theme(legend.position='none')
	}
}

