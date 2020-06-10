rm(list=ls())
library(raster)
library(rgdal)
library(readxl)


regencies <- c("WEST", "EAST")
regencies_prov <- c("32", "35")
#regencies <- c("EAST", "WEST")
#regencies <- c("WEST")
#idkab<- 3215
model_ML_PROBA <-"svmRadial06"
model_ML_S1 <-"svmRadial10"
model_ML <-"svmRadial0610"

period_composite_list <- c(12)
composite_str <- c("12")
for (i in 1:length(regencies)){
  region <- regencies[i]
  prov <- regencies_prov[i]

  folder_ML_classify_fmask <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-100m-MERGE-MAJOR-12",sep="")
  
  period_list_classify <- sort(list.dirs(folder_ML_classify_fmask,full.names = FALSE,recursive = FALSE),decreasing = FALSE)
  
  
  int_k<-1

  input <-NA
  for (int_classify in 1:length(period_list_classify)){
    period<- period_list_classify[int_classify]
    period_date <- as.Date(period)
    
    folder_clip_COMPOSITE <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-",composite_str,"/",collapse = "",sep = "")
    dir.create(folder_clip_COMPOSITE, showWarnings = FALSE)
    folder_clip_COMPOSITE <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-",composite_str,"/",period_date,"/",collapse = "",sep = "")
    dir.create(folder_clip_COMPOSITE, showWarnings = FALSE)
    folder_clip_COMPOSITE <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-",composite_str,"/",period_date,"/",model_ML,"/",collapse = "",sep = "")
    dir.create(folder_clip_COMPOSITE, showWarnings = FALSE)
    filename_result_COMPOSITE <- paste(folder_clip_COMPOSITE,region,"-",period_date,"_PROBA-S1-100_ML_COMPOSITE_utm_",composite_str,"_",model_ML, sep="")
    filename_csv_COMPOSITE <- paste(folder_clip_COMPOSITE,region,"-",period_date,"_PROBA-S1-100_ML_stats_region_COMPOSITE_utm","_",composite_str,"_",model_ML,".csv", sep="")
    filename_result_SENSOR <- paste(folder_clip_COMPOSITE,region,"-",period_date,"_PROBA-S1-100_ML_SENSOR_utm","_",composite_str,"_",model_ML, sep="")
    filename_csv_SENSOR <- paste(folder_clip_COMPOSITE,region,"-",period_date,"_PROBA-S1-100_ML_stats_region_SENSOR_utm","_",composite_str,"_",model_ML,".csv", sep="")
    filename_tif_COMPOSITE <- paste(folder_clip_COMPOSITE,region,"-",period_date,"_PROBA-S1-100_ML_COMPOSITE_utm_",composite_str,"_",model_ML,".tif", sep="")
    
    if (file.exists(filename_tif_COMPOSITE)) {
      next
    }
    print(period)
    
    mainDir_PROBA <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/CLASSIFY-MASK-COMPOSITE-12/",period,"/",model_ML_PROBA,"/",sep="")
    if (dir.exists(mainDir_PROBA)==FALSE) {
      next
    }
    setwd(mainDir_PROBA)
    
    search_str <- paste(region,".*[.]tif$",sep = "")
    input.PROBA <- lapply(list.files(pattern=search_str), raster)
    
    
    input.PROBA<- Filter(Negate(is.null), input.PROBA)
    if (ncell(input.PROBA)<1) {
      next
    }
    if (length(input.PROBA)==0) {
      next
    }
    if (is.na(input.PROBA)==TRUE) {
      next
    }
    
    mainDir_S1 <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-100m-MERGE-MAJOR-12/",period,"/",model_ML_S1,"/",sep="")
    if (dir.exists(mainDir_S1)==FALSE) {
      next
    }
    setwd(mainDir_S1)
    
    search_str <- paste(prov,".*[.]tif$",sep = "")
    input.S1 <- lapply(list.files(pattern=search_str), raster)
    input.S1<- Filter(Negate(is.null), input.S1)
    if (ncell(input.S1)<1) {
      next
    }
    if (length(input.S1)==0) {
      next
    }
    if (is.na(input.S1)==TRUE) {
      next
    }
    input.S1_raster <- input.S1[[1]]
    input.PROBA_raster <- input.PROBA[[1]]
    input.S1.resample <- raster::resample(input.S1_raster,input.PROBA_raster, method='ngb')
    print(paste(format(Sys.time(), "%a %b %d %X %Y"),region, int_classify,filename_tif_COMPOSITE,sep=" | ")) 
    
    rast_stack1 <- stack(input.PROBA_raster,input.S1.resample)
    fun_raster1 <- function(x) {
      if (is.na(x[1])==TRUE) {
        result <- x[2]
      } else {
        if (x[1]>4) { 
          result <- x[2]
        } else {
          result <- x[1]
        }
      } 
      return(result)
    }
    raster_COMPOSITE <- calc(rast_stack1, fun_raster1)
    
    rast_stack_sensor <- stack(input.PROBA_raster,input.S1.resample)
    fun_raster_sensor <- function(x) {
      if (is.na(x[1])==TRUE) {
        result <- 2
      } else {
        if (x[1]>4) { 
          result <- 2
        } else {
          result <- 1
        }
      } 
      return(result)
    }
    raster_SENSOR <- calc(rast_stack_sensor, fun_raster_sensor)
    
    
    
    writeRaster(raster_COMPOSITE, filename=filename_result_COMPOSITE, format="GTiff", overwrite=TRUE)
    raster_df_count_COMPOSITE <- table(na.omit(as.data.frame(raster_COMPOSITE)))
    temp <- raster_df_count_COMPOSITE * 100*100 / 10000
    temp2 <- as.data.frame(temp,stringsAsFactors = FALSE)
    temp2$code <- temp2$Var1
    temp2$area_ha <- temp2$Freq
    temp2$Var1 <- NULL
    temp2$Freq <- NULL
    write.csv(temp2, file = filename_csv_COMPOSITE)
    raster_COMPOSITE<-NA
    
    writeRaster(raster_SENSOR, filename=filename_result_SENSOR, format="GTiff", overwrite=TRUE)
    raster_df_count_SENSOR <- table(na.omit(as.data.frame(raster_SENSOR)))
    temp <- raster_df_count_SENSOR * 100*100 / 10000
    temp2 <- as.data.frame(temp,stringsAsFactors = FALSE)
    temp2$code <- temp2$Var1
    temp2$area_ha <- temp2$Freq
    temp2$Var1 <- NULL
    temp2$Freq <- NULL
    write.csv(temp2, file = filename_csv_SENSOR)
    raster_SENSOR<-NA
    input <-NA
    gc()
    
    
  }
  removeTmpFiles(h=0)
  
}
