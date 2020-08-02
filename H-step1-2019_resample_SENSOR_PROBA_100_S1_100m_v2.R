
rm(list=ls())

setwd("F:/MasseyOffice1/Research/R-Script2019/")
#'B4','B3','B2','B5'

mainDir_BANDS <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/BANDS",sep="")
mainDir_BAT <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/",sep="")
mainDir_SHP_25m <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/shp/",sep="")

regencies <- c("WEST", "EAST")

#idkab<- 3215
model_ML <-"svmRadial0610"
region <- "WEST"
period_list <- 12
period_str <- 12
for (j in 1:length(period_list)) {
  temp<-""
  composite <- period_list[j]
  composite_str <- period_str[j]
  folder_ML_classify_fmask <-  paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-",composite_str,"/",collapse = "",sep = "")
  period_list_classify <- sort(list.dirs(folder_ML_classify_fmask,full.names = FALSE,recursive = FALSE),decreasing = FALSE)
  
  print(composite)
  if (length(period_list_classify)==0) {
    next
  }
  for (int_classify in 1:length(period_list_classify)){
    period<- period_list_classify[int_classify]
    if (period=="NA") {
      next
    }
    period_date <- as.Date(period)
    folder_to <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    folder_to <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m/",period,"/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    folder_to <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m/",period,"/",model_ML,"/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    
    folder_ori <-   paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-",composite_str,"/",period,"/",model_ML,"/",collapse = "",sep = "")
    if (dir.exists(folder_ori)==FALSE) {
      next
    } 
    setwd(file.path(folder_ori))
    file_from <- paste(region,"-",period,"_PROBA-S1-100_ML_SENSOR_utm_",composite_str,"_",model_ML,".tif", sep="")
    
    #WEST-2017-01-12_PROBA-S1-100_ML_SENSOR_utm_12_svmRadial0610.tif
    
    if (file.exists(file_from)==FALSE) {
      next
    }
    file_to <- paste(folder_to,region,"-",period,"_PROBA_S1_ML_utm_SENSOR_25m_",composite_str,"_",model_ML,".tif", sep="")
    
    if (file.exists(file_to)==FALSE) {
      #print(paste(region,name_band_to,sep="-"))
      tif_ori <- paste(folder_ori, "/",file_from,sep="")  
      temp <- paste(temp, "\"C:/Program Files/QGIS 3.8/bin/gdalwarp.exe\" -tr 25 25 ",tif_ori," ", file_to, "  -co COMPRESS=DEFLATE -co TILED=YES --config GDAL_CACHEMAX 1000 --config GDAL_NUM_THREADS 2 ", "\r\n",sep="")
    }
  }
  temp <- gsub("\\", "\\\\", temp, fixed = TRUE)
  filename1 <- paste(mainDir_BAT, "/","run_PROBA_sensor_S1_sampling_25m_",composite_str,".bat",sep="")
  write(temp,file = filename1)
  
}