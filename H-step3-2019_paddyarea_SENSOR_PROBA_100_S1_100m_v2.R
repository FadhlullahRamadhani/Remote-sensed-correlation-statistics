
rm(list=ls())

setwd("F:/MasseyOffice1/Research/R-Script2019/")
#'B4','B3','B2','B5'
library(raster)
mainDir_BANDS <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/BANDS",sep="")
mainDir_BAT <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/",sep="")
mainDir_SHP_PADDY <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/shp/paddy_utm",sep="")

regencies <- c("WEST", "EAST")
args <- commandArgs(trailingOnly = TRUE)
print(args)
# mod_number <- as.integer(args[2])
# div_number <- as.integer(args[1])
# #idkab<- 3215
model_ML <-"svmRadial0610"

period_composite_list <- 12
period_composite_str <- 12
region <-"WEST"

for (j in 1:length(period_composite_list)) {
  composite <- period_composite_list[j]
  composite_str <- period_composite_str[j]
  
  folder_ML_classify_fmask <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-",composite_str,"-25m-PADDY/",collapse = "",sep = "")
  
  period_list_classify <- sort(list.dirs(folder_ML_classify_fmask,full.names = FALSE,
                                         recursive = FALSE),decreasing = TRUE)
  
  for (int_classify in 1:length(period_list_classify)){
    period<- period_list_classify[int_classify]
    if (period=="NA") {
      next
    }
    # if (int_classify %% div_number != mod_number) {
    #   next
    # }
    print(period)
    period_date <- as.Date(period)
    folder_to <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m-PADDY-SUBDISTRICT",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    folder_ori <-  paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m-PADDY/",period,"/",model_ML,collapse = "",sep = "")
    setwd(file.path(folder_ori))
    
    file_from <- paste(folder_ori, "/","PADDY_", region,"-",period,"_PROBA_S1_ML_utm_SENSOR_25m_",composite_str,"_",model_ML,".tif", sep="")
    
    if (file.exists(file_from)==FALSE) {
      next
    }
    file_to <- paste(folder_to, "/","SD-PADDY_", region,"-",period,"_PROBA_S1_ML_utm_SENSOR_25m_",composite_str,"_",model_ML,".csv", sep="")
    
    
    if (file.exists(file_to)==FALSE) {
      
      #paddy subdistrict
      print("Mask subdistrict")
      
      #raster subdistrict
      raster_paddy <- raster(file_from)
      raster_subdistrict_filename <-  paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/SHP/resample_paddywest2019.tif",collapse = "",sep = "")
      if (file.exists(raster_subdistrict_filename)==TRUE){
        raster_subdistrict <-raster(raster_subdistrict_filename)
      } else {
        input.rasters.subdisctrict <- raster(paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/SHP/paddywest2019.tif",collapse = "",sep = ""))
        raster_subdistrict <- projectRaster(input.rasters.subdisctrict,raster_paddy,method = 'ngb')
        writeRaster(raster_subdistrict, filename=raster_subdistrict_filename, format="GTiff", overwrite=TRUE)
      }
      
      rast_stack1 <- stack(raster_paddy,raster_subdistrict)
      
      fun_raster1 <- function(x) {
        if (is.na(x[1])==FALSE) {
          if (is.na(x[2])==FALSE) {
            result <-  as.integer(paste(x[2],x[1],sep = ""))
          } else {
            result <-  NA
          }
        } else {
          result <-  NA
        }
        return(result)
      }
      
      fmask_clip_paddy1_subdistrict <- calc(rast_stack1, fun_raster1)
      
      paddy_raster_df_count_subdistrict <- table(na.omit(as.data.frame(fmask_clip_paddy1_subdistrict)))
      temp <-paddy_raster_df_count_subdistrict * 25 * 25 / 10000
      temp2 <- as.data.frame(temp,stringsAsFactors = FALSE)
      temp2$subdistrict <- as.integer(substr(temp2$Var1,1,7))
      temp2$code <- as.integer(substr(temp2$Var1,8,length(temp2$Var1)))
      temp2$area_ha <- temp2$Freq
      temp2$Var1 <- NULL
      temp2$Freq <- NULL
      write.csv(temp2, file = file_to)
      fmask_clip_paddy1_subdistrict<-NA
      raster_subdistrict<-NA
      raster_reclassify<-NA
      raster_mask<-NA
      gc()
      
      
    }
  }
}

