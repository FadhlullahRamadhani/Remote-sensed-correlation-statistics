# Remote-sensed-correlation
 
This is the source code for "Mapping a cloud free spatiotemporal by using PROBA-V and Sentinel-1 in cloud prone paddy fields and its correlation with local statistics"


This is the steps to recreate the mapping. Please change the path of folder accordingly. 

I. Download Data Sentinel-1 and PROBA-V
1. Install Python and GEE login. Please refer to https://developers.google.com/earth-engine/python_install

2. Download S1 VH with LEE filtering data using dl_S1_VH_DESC_LEE_7regency_full1.py

2. Download PROVA-V using dl_PROBA_ALL_100_JAVA_v1.py

II. Classification PROBA-V process
A. Separate the PROBA-V-Bands with A-step1-PROBA_separate_bands1.R and A-step2-PROBA_split_paddy1.R masking each band according to rice field area (with ArcGIS installed. adjust the folder of ArcPy)

B. Building PROBA-V the model
1. Extracting on points from S-2 classification just for four rice condition: 1. Bare land, 2. Vegetative, 3. Reproductive, 4. Ripening. The dataset is ML_PROBA_100m_2019_v1.xlsx

2. Only data with good pixel quality is processed

3. Building the model using SVM Radial and tuning it using B-ML_PROBA-100m_2019_v1.r

4. Change RDS path file to best model on C-step1-2019_classify_PROBA_v2.R


C. Running the PROBA-V model
1. Run C-step1-2019_classify_PROBA_v2.R for classifying

2. Run C-step2-2019_composite_PROBA_100v1.R for compositing into 12 days


II. Classification S-1 process
D. Aggregate and masking from rice area VH and VV of Sentinel-1 with D-Step1-S1_LEE_VH_AGGREGATE_SPLIT.R and D-Step1-S1_LEE_VV_AGGREGATE_SPLIT.R masking each band according to rice field area (with ArcGIS installed. adjust the folder of ArcPy)

E. Building S-1 the model
1. Extracting on points from S-2 classification just for four rice condition: 1. Bare land, 2. Vegetative, 3. Reproductive, 4. Ripening. The dataset is S1_LEE_DATA_ML_v7_WEST_USED.xlsx

2. Only data with good pixel quality is processed

3. Building the model using SVM Radial and tuning it using E-ML_S1_LEE_2019_v7_WEST.R

4. Change RDS path file to best model on F-step1-2019_classify_S1_LEE_allresV4_3212.R


F. Running S-1 the model
1. Run F-step1-2019_classify_S1_LEE_allresV4_3212.R for classifying\

2. Run F-step2-2019_merge_S1_12days.R for merging between S-1 tiles

3. Run F-step3-2019_majority_S1_12days.R for majority operation and reducing noise speckles


G. Composite process
1. Run G-step1-2019_composite_PROBA_100_S1_100m_v2.r for compositing PROBA-V and S-1 where PROBA-V is the first priority and the cloud and shadow replace with S-1 classification

2. Run G-step2-2019_repair_PROBA_100_S1_100m_v5.R for syncronize the temporal data

3. Run G-step3-2019_resample_PROBA_100_S1_100m_v2.R for resampling into 25m (gdalwarp.exe installed)

4. Run G-step4-2019_paddysplit_SENSOR_PROBA_100_S1_100m_v2.R for split map with sub district shp (run generated py file)

5. Run G-step5-2019_paddyarea_SENSOR_PROBA_100_S1_100m_v2 for calculating area.

6. Run G-step6-2019_recap_paddyarea_SENSOR_PROBA_100_S1_100m_v2.R for recapitulate area

H. Cross-correlation

1. Run D-step1-2019_CHANGE_ALLv1 for detecting change classes with 5,10,15,20,25,30 lag days

2. Run D-step2-Recap-Change_V4.R for recaping the change detection data

III. Classification MOD13Q1 process
A. Pre-processing
1. Separating bands from original MOD13Q1 with A.1.MOD13Q1_separate_band.R 

2. Cliping the MOD13Q1-Bands with A.2.MOD13Q1_ARCPY_PADDY1.R and A.3.MOD13Q1_split_band_region.R (with ArcGIS installed. adjust the folder of ArcPy)

3. resampling MOD13Q1 bands into 10m A.4.MOD13Q1_resample10m_band_region.R

B. Building the model 
1. Labelling on points from field survey just for five rice condition: 1. Bare land, 2. Flooding, 3. Vegetative, 4. Reproductive, 5. Ripening.

2. Building the model using SVM Radial with dataset S1_MOD13Q1_ML_v6.xlsx and tuning it using B.S1_MOD13Q1_ML_v6.r

3. Change RDS path file to best model on C-Run-ML-MOD13Q1_S1_classify_v6_2019.R

C. Running the model

1. Run C-Run-ML-MOD13Q1_S1_classify_v6_2019.R for each district.

D. Temporal changes

1. Run D.MOD13Q1_change_v1.R for detecting change classes with 16 lag days

2. Run D.Recap-Change_MOD13Q1.R for recaping the change detection data

