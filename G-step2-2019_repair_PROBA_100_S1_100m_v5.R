rm(list=ls())
library(raster)
library(rgdal)
library(readxl)
reclass_df <-function(df, assignvalue, list)
{
  for (i in list) {
    df[df==i] <- assignvalue
  }
  return(df)
}

#idkab<-3213
idkab <- c("WEST")
#idkab <- c(3212,3213,3215)

model_ML <- c('svmRadial0610')
time_list <- 12
for (j in 1:length(idkab)){
  region <- idkab[j]
  for (time in time_list) {
    folder_ML_classify_fmask <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12",collapse = "",sep = "")
    period_list_classify <- sort(list.dirs(folder_ML_classify_fmask,full.names = FALSE,recursive = FALSE),
                                 decreasing = FALSE)
    
    for (int_classify in 1:length(period_list_classify)){
      
      #for (int_classify in seq(1, length(period_list_classify), 3)){  
      period_first<- period_list_classify[int_classify]
      if (period_first=="") {
        next
      }
      
      search_str <- paste(region,".*COMPOSITE.*[.]tif$",sep = "")
      band_folder <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12/",period_first,"/",model_ML,collapse = "",sep = "")
      if (dir.exists(band_folder)==FALSE){
        next
      }
      setwd(band_folder)
      if (int_classify==1) {
        input.rasters.first <- lapply(list.files(pattern=search_str), raster)
        folder_clip_paddy <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-REPAIR",collapse = "",sep = "")
        dir.create(folder_clip_paddy, showWarnings = FALSE)
        folder_clip_paddy <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-REPAIR/",period_first,"/",collapse = "",sep = "")
        dir.create(folder_clip_paddy, showWarnings = FALSE)
        folder_clip_paddy <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-REPAIR/",period_first,"/",model_ML,"/",collapse = "",sep = "")
        dir.create(folder_clip_paddy, showWarnings = FALSE)
        filename_result_paddy_REPAIR <- paste(folder_clip_paddy,region,"_", period_first,"_PROBA-S1-100_ML_REPAIR_",time,"_",model_ML, sep="")
        filename_tif_paddy_REPAIR <-    paste(folder_clip_paddy,region,"_", period_first,"_PROBA-S1-100_ML_REPAIR_",time,"_",model_ML,".tif", sep="")
        filename_csv_paddy_REPAIR <-    paste(folder_clip_paddy,region,"_", period_first,"_PROBA-S1-100_ML_REPAIR_",time,"_",model_ML,"_check.csv", sep="")
        writeRaster(input.rasters.first[[1]], filename=filename_result_paddy_REPAIR, format="GTiff", overwrite=TRUE)  
        
        next
      }
      input.rasters.first <- lapply(list.files(pattern=search_str), raster)
      if (ncell(input.rasters.first)==0 ) {
        next
      }
      

      period_prev <- as.character(as.Date(period_first) - time)
      if ((period_prev %in% period_list_classify)==FALSE) {
        period_prev <- period_list_classify[int_classify-1]
      }
      
      #
      search_str <- paste(region,".*REPAIR.*[.]tif$",sep = "")
      
      
      band_folder <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-REPAIR/",period_prev,"/",model_ML,collapse = "",sep = "")
     
      if (dir.exists(band_folder)==FALSE){
        next
      }
      setwd(band_folder)
      input.rasters.prev <- lapply(list.files(pattern=search_str), raster)
      if (ncell(input.rasters.prev)==0 ) {
        next
      }
      
      period <- paste(period_prev,"_",period_first,sep="")
      period <- gsub("-","",period)
      period<- period_first
      folder_clip_paddy <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-REPAIR",collapse = "",sep = "")
      dir.create(folder_clip_paddy, showWarnings = FALSE)
      
      folder_clip_paddy <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-REPAIR/",period,"/",collapse = "",sep = "")
      dir.create(folder_clip_paddy, showWarnings = FALSE)
      
      folder_clip_paddy <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-REPAIR/",period,"/",model_ML,"/",collapse = "",sep = "")
      dir.create(folder_clip_paddy, showWarnings = FALSE)
      
      filename_result_paddy_REPAIR <- paste(folder_clip_paddy,region,"_", period,"_PROBA-S1-100_ML_REPAIR_",time,"_",model_ML, sep="")
      filename_tif_paddy_REPAIR <-    paste(folder_clip_paddy,region,"_", period,"_PROBA-S1-100_ML_REPAIR_",time,"_",model_ML,".tif", sep="")
      filename_csv_paddy_REPAIR <-    paste(folder_clip_paddy,region,"_", period,"_PROBA-S1-100_ML_REPAIR_",time,"_",model_ML,"_check.csv", sep="")
      
      print(paste(format(Sys.time(), "%a %b %d %X %Y"),region, int_classify,time,filename_tif_paddy_REPAIR,sep=" | ")) 
      
      if (file.exists(filename_tif_paddy_REPAIR)) {
        next
      }
      rast_stack <- stack(input.rasters.prev[[1]],input.rasters.first[[1]])
      fun_raster <- function(x) {
        if (is.na(x[2])==FALSE) {
          if (is.na(x[1])==FALSE) {
            if (x[1]==1 & x[2]==4) { 
              result <- 1
            } else  if (x[1]==4 & x[2]==3) { 
              result <- 4
            } else  if (x[1]==2 & x[2]==4) { 
              result <- 2
            } else {
              result <- x[2]
            }
          } else {
            result <- x[2]
          } 
        } else {
          result <- NA
        } 
        return(result)
      }
      
      raster_mask <- calc(rast_stack, fun_raster)
      writeRaster(raster_mask, filename=filename_result_paddy_REPAIR, format="GTiff", overwrite=TRUE)  
      
      paddy_raster_df <- as.data.frame(raster_mask)
      paddy_raster_df_count <- table(paddy_raster_df)
      area_ha <-paddy_raster_df_count * 100 * 100 / 10000
      write.csv(area_ha, file = filename_csv_paddy_REPAIR)
      
      
      gc()
      
      
      
    }
    removeTmpFiles(h=0)
  }
}