import arcpy, arcinfo
from arcpy import env
from arcpy.sa import *
import time
import os
import math
from datetime import datetime
arcpy.CheckOutExtension("spatial")
S3_major_32 = "F:\\R-Script-DriveF\\S1-ML-2019\\shp\\paddy_utm\\paddy_32.shp"
from_32_2017_01_12_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-01-12\\svmRadial10\\32-2017-01-12_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_01_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-01-12\\svmRadial10\\32-2017-01-12_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_01_12_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-01-12_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_01_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_01_24_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-01-24\\svmRadial10\\32-2017-01-24_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_01_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-01-24\\svmRadial10\\32-2017-01-24_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_01_24_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-01-24_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_01_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_02_05_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-02-05\\svmRadial10\\32-2017-02-05_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_02_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-02-05\\svmRadial10\\32-2017-02-05_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_02_05_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-02-05_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_02_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_02_17_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-02-17\\svmRadial10\\32-2017-02-17_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_02_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-02-17\\svmRadial10\\32-2017-02-17_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_02_17_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-02-17_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_02_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_03_01_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-03-01\\svmRadial10\\32-2017-03-01_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_03_01_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-03-01\\svmRadial10\\32-2017-03-01_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_03_01_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-03-01_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_03_01_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_03_13_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-03-13\\svmRadial10\\32-2017-03-13_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_03_13_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-03-13\\svmRadial10\\32-2017-03-13_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_03_13_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-03-13_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_03_13_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_03_25_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-03-25\\svmRadial10\\32-2017-03-25_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_03_25_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-03-25\\svmRadial10\\32-2017-03-25_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_03_25_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-03-25_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_03_25_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_04_06_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-04-06\\svmRadial10\\32-2017-04-06_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_04_06_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-04-06\\svmRadial10\\32-2017-04-06_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_04_06_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-04-06_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_04_06_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_04_18_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-04-18\\svmRadial10\\32-2017-04-18_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_04_18_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-04-18\\svmRadial10\\32-2017-04-18_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_04_18_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-04-18_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_04_18_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_04_30_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-04-30\\svmRadial10\\32-2017-04-30_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_04_30_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-04-30\\svmRadial10\\32-2017-04-30_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_04_30_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-04-30_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_04_30_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_05_12_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-05-12\\svmRadial10\\32-2017-05-12_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_05_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-05-12\\svmRadial10\\32-2017-05-12_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_05_12_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-05-12_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_05_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_05_24_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-05-24\\svmRadial10\\32-2017-05-24_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_05_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-05-24\\svmRadial10\\32-2017-05-24_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_05_24_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-05-24_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_05_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_06_05_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-06-05\\svmRadial10\\32-2017-06-05_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_06_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-06-05\\svmRadial10\\32-2017-06-05_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_06_05_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-06-05_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_06_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_06_17_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-06-17\\svmRadial10\\32-2017-06-17_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_06_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-06-17\\svmRadial10\\32-2017-06-17_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_06_17_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-06-17_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_06_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_06_29_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-06-29\\svmRadial10\\32-2017-06-29_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_06_29_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-06-29\\svmRadial10\\32-2017-06-29_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_06_29_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-06-29_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_06_29_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_07_11_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-07-11\\svmRadial10\\32-2017-07-11_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_07_11_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-07-11\\svmRadial10\\32-2017-07-11_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_07_11_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-07-11_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_07_11_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_07_23_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-07-23\\svmRadial10\\32-2017-07-23_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_07_23_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-07-23\\svmRadial10\\32-2017-07-23_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_07_23_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-07-23_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_07_23_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_08_04_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-08-04\\svmRadial10\\32-2017-08-04_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_08_04_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-08-04\\svmRadial10\\32-2017-08-04_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_08_04_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-08-04_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_08_04_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_08_16_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-08-16\\svmRadial10\\32-2017-08-16_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_08_16_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-08-16\\svmRadial10\\32-2017-08-16_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_08_16_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-08-16_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_08_16_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_08_28_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-08-28\\svmRadial10\\32-2017-08-28_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_08_28_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-08-28\\svmRadial10\\32-2017-08-28_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_08_28_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-08-28_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_08_28_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_09_09_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-09-09\\svmRadial10\\32-2017-09-09_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_09_09_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-09-09\\svmRadial10\\32-2017-09-09_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_09_09_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-09-09_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_09_09_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_09_21_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-09-21\\svmRadial10\\32-2017-09-21_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_09_21_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-09-21\\svmRadial10\\32-2017-09-21_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_09_21_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-09-21_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_09_21_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_10_03_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-10-03\\svmRadial10\\32-2017-10-03_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_10_03_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-10-03\\svmRadial10\\32-2017-10-03_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_10_03_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-10-03_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_10_03_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_10_15_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-10-15\\svmRadial10\\32-2017-10-15_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_10_15_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-10-15\\svmRadial10\\32-2017-10-15_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_10_15_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-10-15_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_10_15_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_10_27_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-10-27\\svmRadial10\\32-2017-10-27_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_10_27_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-10-27\\svmRadial10\\32-2017-10-27_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_10_27_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-10-27_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_10_27_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_11_08_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-11-08\\svmRadial10\\32-2017-11-08_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_11_08_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-11-08\\svmRadial10\\32-2017-11-08_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_11_08_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-11-08_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_11_08_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_11_20_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-11-20\\svmRadial10\\32-2017-11-20_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_11_20_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-11-20\\svmRadial10\\32-2017-11-20_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_11_20_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-11-20_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_11_20_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_12_02_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-12-02\\svmRadial10\\32-2017-12-02_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_12_02_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-12-02\\svmRadial10\\32-2017-12-02_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_12_02_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-12-02_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_12_02_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_12_14_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-12-14\\svmRadial10\\32-2017-12-14_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_12_14_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-12-14\\svmRadial10\\32-2017-12-14_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_12_14_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-12-14_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_12_14_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_12_26_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-12-26\\svmRadial10\\32-2017-12-26_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_12_26_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-12-26\\svmRadial10\\32-2017-12-26_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_12_26_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-12-26_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_12_26_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2017_12_31_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2017-12-31\\svmRadial10\\32-2017-12-31_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2017_12_31_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2017-12-31\\svmRadial10\\32-2017-12-31_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2017_12_31_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2017-12-31_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2017_12_31_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_01_12_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-01-12\\svmRadial10\\32-2018-01-12_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_01_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-01-12\\svmRadial10\\32-2018-01-12_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_01_12_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-01-12_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_01_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_01_24_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-01-24\\svmRadial10\\32-2018-01-24_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_01_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-01-24\\svmRadial10\\32-2018-01-24_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_01_24_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-01-24_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_01_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_02_05_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-02-05\\svmRadial10\\32-2018-02-05_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_02_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-02-05\\svmRadial10\\32-2018-02-05_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_02_05_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-02-05_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_02_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_02_17_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-02-17\\svmRadial10\\32-2018-02-17_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_02_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-02-17\\svmRadial10\\32-2018-02-17_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_02_17_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-02-17_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_02_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_03_01_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-03-01\\svmRadial10\\32-2018-03-01_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_03_01_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-03-01\\svmRadial10\\32-2018-03-01_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_03_01_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-03-01_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_03_01_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_03_13_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-03-13\\svmRadial10\\32-2018-03-13_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_03_13_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-03-13\\svmRadial10\\32-2018-03-13_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_03_13_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-03-13_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_03_13_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_03_25_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-03-25\\svmRadial10\\32-2018-03-25_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_03_25_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-03-25\\svmRadial10\\32-2018-03-25_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_03_25_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-03-25_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_03_25_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_04_06_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-04-06\\svmRadial10\\32-2018-04-06_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_04_06_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-04-06\\svmRadial10\\32-2018-04-06_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_04_06_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-04-06_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_04_06_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_04_18_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-04-18\\svmRadial10\\32-2018-04-18_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_04_18_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-04-18\\svmRadial10\\32-2018-04-18_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_04_18_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-04-18_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_04_18_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_04_30_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-04-30\\svmRadial10\\32-2018-04-30_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_04_30_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-04-30\\svmRadial10\\32-2018-04-30_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_04_30_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-04-30_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_04_30_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_05_12_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-05-12\\svmRadial10\\32-2018-05-12_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_05_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-05-12\\svmRadial10\\32-2018-05-12_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_05_12_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-05-12_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_05_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_05_24_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-05-24\\svmRadial10\\32-2018-05-24_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_05_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-05-24\\svmRadial10\\32-2018-05-24_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_05_24_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-05-24_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_05_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_06_05_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-06-05\\svmRadial10\\32-2018-06-05_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_06_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-06-05\\svmRadial10\\32-2018-06-05_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_06_05_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-06-05_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_06_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_06_17_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-06-17\\svmRadial10\\32-2018-06-17_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_06_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-06-17\\svmRadial10\\32-2018-06-17_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_06_17_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-06-17_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_06_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_06_29_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-06-29\\svmRadial10\\32-2018-06-29_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_06_29_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-06-29\\svmRadial10\\32-2018-06-29_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_06_29_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-06-29_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_06_29_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_07_11_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-07-11\\svmRadial10\\32-2018-07-11_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_07_11_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-07-11\\svmRadial10\\32-2018-07-11_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_07_11_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-07-11_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_07_11_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_07_23_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-07-23\\svmRadial10\\32-2018-07-23_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_07_23_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-07-23\\svmRadial10\\32-2018-07-23_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_07_23_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-07-23_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_07_23_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_08_04_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-08-04\\svmRadial10\\32-2018-08-04_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_08_04_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-08-04\\svmRadial10\\32-2018-08-04_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_08_04_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-08-04_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_08_04_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_08_16_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-08-16\\svmRadial10\\32-2018-08-16_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_08_16_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-08-16\\svmRadial10\\32-2018-08-16_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_08_16_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-08-16_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_08_16_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_08_28_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-08-28\\svmRadial10\\32-2018-08-28_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_08_28_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-08-28\\svmRadial10\\32-2018-08-28_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_08_28_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-08-28_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_08_28_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_09_09_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-09-09\\svmRadial10\\32-2018-09-09_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_09_09_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-09-09\\svmRadial10\\32-2018-09-09_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_09_09_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-09-09_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_09_09_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_09_21_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-09-21\\svmRadial10\\32-2018-09-21_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_09_21_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-09-21\\svmRadial10\\32-2018-09-21_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_09_21_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-09-21_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_09_21_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_10_03_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-10-03\\svmRadial10\\32-2018-10-03_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_10_03_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-10-03\\svmRadial10\\32-2018-10-03_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_10_03_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-10-03_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_10_03_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_10_15_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-10-15\\svmRadial10\\32-2018-10-15_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_10_15_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-10-15\\svmRadial10\\32-2018-10-15_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_10_15_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-10-15_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_10_15_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_10_27_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-10-27\\svmRadial10\\32-2018-10-27_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_10_27_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-10-27\\svmRadial10\\32-2018-10-27_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_10_27_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-10-27_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_10_27_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_11_08_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-11-08\\svmRadial10\\32-2018-11-08_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_11_08_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-11-08\\svmRadial10\\32-2018-11-08_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_11_08_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-11-08_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_11_08_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_11_20_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-11-20\\svmRadial10\\32-2018-11-20_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_11_20_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-11-20\\svmRadial10\\32-2018-11-20_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_11_20_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-11-20_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_11_20_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_12_02_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-12-02\\svmRadial10\\32-2018-12-02_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_12_02_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-12-02\\svmRadial10\\32-2018-12-02_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_12_02_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-12-02_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_12_02_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_12_14_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-12-14\\svmRadial10\\32-2018-12-14_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_12_14_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-12-14\\svmRadial10\\32-2018-12-14_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_12_14_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-12-14_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_12_14_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_12_26_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-12-26\\svmRadial10\\32-2018-12-26_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_12_26_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-12-26\\svmRadial10\\32-2018-12-26_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_12_26_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-12-26_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_12_26_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2018_12_31_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2018-12-31\\svmRadial10\\32-2018-12-31_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2018_12_31_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2018-12-31\\svmRadial10\\32-2018-12-31_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2018_12_31_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2018-12-31_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2018_12_31_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_01_12_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-01-12\\svmRadial10\\32-2019-01-12_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_01_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-01-12\\svmRadial10\\32-2019-01-12_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_01_12_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-01-12_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_01_12_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_01_24_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-01-24\\svmRadial10\\32-2019-01-24_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_01_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-01-24\\svmRadial10\\32-2019-01-24_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_01_24_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-01-24_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_01_24_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_02_05_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-02-05\\svmRadial10\\32-2019-02-05_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_02_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-02-05\\svmRadial10\\32-2019-02-05_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_02_05_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-02-05_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_02_05_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_02_17_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-02-17\\svmRadial10\\32-2019-02-17_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_02_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-02-17\\svmRadial10\\32-2019-02-17_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_02_17_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-02-17_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_02_17_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_03_01_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-03-01\\svmRadial10\\32-2019-03-01_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_03_01_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-03-01\\svmRadial10\\32-2019-03-01_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_03_01_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-03-01_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_03_01_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_03_13_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-03-13\\svmRadial10\\32-2019-03-13_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_03_13_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-03-13\\svmRadial10\\32-2019-03-13_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_03_13_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-03-13_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_03_13_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_03_25_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-03-25\\svmRadial10\\32-2019-03-25_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_03_25_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-03-25\\svmRadial10\\32-2019-03-25_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_03_25_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-03-25_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_03_25_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_04_06_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-04-06\\svmRadial10\\32-2019-04-06_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_04_06_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-04-06\\svmRadial10\\32-2019-04-06_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_04_06_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-04-06_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_04_06_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_04_18_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-04-18\\svmRadial10\\32-2019-04-18_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_04_18_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-04-18\\svmRadial10\\32-2019-04-18_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_04_18_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-04-18_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_04_18_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)
from_32_2019_04_30_S1_ML_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-12\\2019-04-30\\svmRadial10\\32-2019-04-30_S1_ML_MERGE_12_svmRadial10.tif"
to_32_2019_04_30_S1_ML_MAJOR_MERGE_12_svmRadial10_tif = "F:\\R-Script-DriveF\\S1-ML-2019\\CLASSIFY-100m-MERGE-MAJOR-12\\2019-04-30\\svmRadial10\\32-2019-04-30_S1_ML_MAJOR_MERGE_12_svmRadial10.tif"
outMajFilt = MajorityFilter(from_32_2019_04_30_S1_ML_MERGE_12_svmRadial10_tif, "EIGHT", "MAJORITY")
print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '32-2019-04-30_S1_ML_MERGE_12_svmRadial10.tif'
outMajFilt.save(to_32_2019_04_30_S1_ML_MAJOR_MERGE_12_svmRadial10_tif)

