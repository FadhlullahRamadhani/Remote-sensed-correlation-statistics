
rm(list=ls())

get_free_ram <- function(){
  if(Sys.info()[["sysname"]] == "Windows"){
    x <- system2("wmic", args =  "OS get FreePhysicalMemory /Value", stdout = TRUE)
    x <- x[grepl("FreePhysicalMemory", x)]
    x <- gsub("FreePhysicalMemory=", "", x, fixed = TRUE)
    x <- gsub("\r", "", x, fixed = TRUE)
    as.integer(x)
  } else {
    stop("Only supported on Windows OS")
  }
}
right = function(text, num_char) {
  substr(text, nchar(text) - (num_char-1), nchar(text))
}
args <- commandArgs(trailingOnly = TRUE)
print(args)
mod_number <- as.integer(args[2])
mod_div <- as.integer(args[1])

library(raster)
library(rgdal)
library(DescTools)
library(readxl)

clear_water <- c(248,249,250)

#idkab <- c(3517,3518,3215,3522,3213,3524,3212)
# idkab <- c(3518,3215,3522,3213,3524,3212)

mainDir <- paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS-PADDY/BLUE/",sep="")
setwd(file.path(mainDir))
#WithMasking_LOOCV_LS8_nnet_center_scale_100
mainDir1 <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/MODEL/svmRadial/",collapse = "",sep = "")
filename <- paste(mainDir1,"WithMasking_LOOCV_ML_PROBA_100m_2019_v1_svmRadial_noProc_0001.rds", sep="")
allModelsResults <- readRDS(filename)
regencies <- c("WEST", "EAST")
#regencies <- c("WEST")
#idkab <- c(3212,3213,3215)
for (region in regencies) { 
  search_str <- paste("*",region,".*[.]tif$",sep = "")
  files <- sort(list.files(pattern=search_str),decreasing = FALSE)
  for (i in 1:length(files)){
    if (i %% mod_div != mod_number) {
      next
    }
    filename_original <-files[i]
    date_str <- substr(filename_original,42,49)
    period <- as.Date(date_str,format = "%Y%m%d")
    
    
    #model <- c('fda','nnet','rf','svmLinear','svmPoly','svmRadial')
    model_ML <- c('svmRadial06')
    folder <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/CLASSIFY-PADDY/",collapse = "",sep = "")
    dir.create(folder, showWarnings = FALSE)
    folder <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/CLASSIFY-PADDY/",period,"",collapse = "",sep = "")
    dir.create(folder, showWarnings = FALSE)
    folder <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/CLASSIFY-PADDY/",period,"/",model_ML,"/",collapse = "",sep = "")
    dir.create(folder, showWarnings = FALSE)
    
    folder_classify_mask <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/CLASSIFY-PADDY-MASK/",collapse = "",sep = "")
    dir.create(folder_classify_mask, showWarnings = FALSE)
    folder_classify_mask <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/CLASSIFY-PADDY-MASK/",period,"/",collapse = "",sep = "")
    dir.create(folder_classify_mask, showWarnings = FALSE)
    folder_classify_mask <- paste("F:/R-Script-DriveF/ML-PROBA-100-3212/CLASSIFY-PADDY-MASK/",period,"/",model_ML,"/",collapse = "",sep = "")
    dir.create(folder_classify_mask, showWarnings = FALSE)
    filename_result_classify_mask <- paste(folder_classify_mask,region,"_", period, "_PROBA_100_classify_paddy_mask_",model_ML, sep="")
    filename_tif_classify_mask <- paste(folder_classify_mask,region,"_", period,"_PROBA_100_classify_paddy_mask_",model_ML,".tif", sep="")
    filename_csv_classify_mask <- paste(folder_classify_mask,region,"_", period,"_PROBA_100_classify_paddy_mask_",model_ML,".csv", sep="")
    
    if (file.exists(filename_csv_classify_mask)) {
      next
    }
    
    mask <- paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS-PADDY/MASK/PADDY_PROBA-TOC-MASK-100m-utm-",region,"-",date_str,".tif",sep = "")
    if (file.exists(mask)==FALSE) {
      next
    }
    fmask_clip_paddy1 <- raster(mask)
    fmask_clip_paddy1[fmask_clip_paddy1==0] <- NA
    fmask_clip_paddy1_table <- as.data.frame(table(na.omit(as.data.frame(fmask_clip_paddy1))))
    data_total <- sum(fmask_clip_paddy1_table$Freq)
    clear_water_rows <- fmask_clip_paddy1_table[fmask_clip_paddy1_table$Var1 %in% clear_water,]
    data_ok <- sum(clear_water_rows$Freq)
    #Clear 	322, 386, 834, 898, 1346
    #Water 	324, 388, 836, 900, 1348
    
    # if (data_total>0 ) {
    #   data_avg<- data_ok/data_total * 100  
    #   print(paste(format(Sys.time(), "%a %b %d %Y %X")," | ",region," | ",period," | ", data_avg," | ",sep=""))
    #   if (data_avg<20) {
    #     next
    #   }
    # } else {
    #   next
    # }
    
    #print(paste(format(Sys.time(), "%a %b %d %Y %X")," | ",region," | ",period,sep=""))
    list_ok <- c("RED","NIR","BLUE","SWIR","NDVI","SM")
    
    print(paste(format(Sys.time(), "%a %b %d %Y %X")," | ",region," | ",period," | ",sep=""))
    
    #PADDY_SM_PROBA-TOC-BANDS-100m-utm-WEST-20180502
    band_name <- paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS-PADDY/RED/PADDY_RED_PROBA-TOC-BANDS-100m-utm-",region,"-",date_str,".tif",sep = "")
    if (file.exists(band_name)==FALSE) {
      next
    }
    RED_NA <- raster(band_name)
    RED_NA[RED_NA==0] <- NA
    RED_raster <- RED_NA
    RED_raster_df <- as.data.frame(RED_raster)
    RED_raster_df_template <- as.data.frame(RED_raster)
    RED_raster_df[is.na(RED_raster_df)] <- -999
    
    band_name <- paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS-PADDY/NIR/PADDY_NIR_PROBA-TOC-BANDS-100m-utm-",region,"-",date_str,".tif",sep = "")
    if (file.exists(band_name)==FALSE) {
      next
    }
    NIR_NA <- raster(band_name)
    NIR_NA[NIR_NA==0] <- NA
    NIR_raster <- NIR_NA
    NIR_raster_df <- as.data.frame(NIR_raster)
    NIR_raster_df_template <- as.data.frame(NIR_raster)
    NIR_raster_df[is.na(NIR_raster_df)] <- -999
    
    band_name <- paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS-PADDY/BLUE/PADDY_BLUE_PROBA-TOC-BANDS-100m-utm-",region,"-",date_str,".tif",sep = "")
    if (file.exists(band_name)==FALSE) {
      next
    }
    BLUE_NA <- raster(band_name)
    BLUE_NA[BLUE_NA==0] <- NA
    BLUE_raster <- BLUE_NA
    BLUE_raster_df <- as.data.frame(BLUE_raster)
    BLUE_raster_df_template <- as.data.frame(BLUE_raster)
    BLUE_raster_df[is.na(BLUE_raster_df)] <- -999
    
    band_name <- paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS-PADDY/SWIR/PADDY_SWIR_PROBA-TOC-BANDS-100m-utm-",region,"-",date_str,".tif",sep = "")
    if (file.exists(band_name)==FALSE) {
      next
    }
    SWIR_NA <- raster(band_name)
    SWIR_NA[SWIR_NA==0] <- NA
    SWIR_raster <- SWIR_NA
    SWIR_raster_df <- as.data.frame(SWIR_raster)
    SWIR_raster_df_template <- as.data.frame(SWIR_raster)
    SWIR_raster_df[is.na(SWIR_raster_df)] <- -999
    
    band_name <- paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS-PADDY/NDVI/PADDY_PROBA-TOC-NDVI-100m-utm-",region,"-",date_str,".tif",sep = "")
    if (file.exists(band_name)==FALSE) {
      next
    }
    NDVI_NA <- raster(band_name)
    NDVI_NA[NDVI_NA==0] <- NA
    NDVI_raster <- NDVI_NA
    NDVI_raster_df <- as.data.frame(NDVI_raster)
    NDVI_raster_df_template <- as.data.frame(NDVI_raster)
    NDVI_raster_df[is.na(NDVI_raster_df)] <- -999
    
    
    
    JAVA_classify_df <- data.frame(RED=RED_raster_df,NIR=NIR_raster_df,
                                   BLUE=BLUE_raster_df,SWIR=SWIR_raster_df,
                                   NDVI=NDVI_raster_df,stringsAsFactors=FALSE)
    
    colnames(JAVA_classify_df) <- c("RED","NIR","BLUE","SWIR","NDVI")
    NIR_NA <- NA
    NIR_raster <- NA
    NIR_raster_df <- NA
    NIR_raster_df_template <- NA
    
    BLUE_NA <- NA
    BLUE_raster <- NA
    BLUE_raster_df <- NA
    BLUE_raster_df_template <- NA
    
    SWIR_NA <- NA
    SWIR_raster <- NA
    SWIR_raster_df <- NA
    SWIR_raster_df_template <- NA
    
    NDVI_NA <- NA
    NDVI_raster <- NA
    NDVI_raster_df <- NA
    NDVI_raster_df_template <- NA
    
 
    print ("predicting")
    if (get_free_ram()<1000000) {
      print(get_free_ram())
      print("sleep 60s")
      Sys.sleep(60)
      next
    }
    size_df <-  dim(JAVA_classify_df)[1]
    divided <- as.integer(size_df/5)
    for (it in 1:5) {
      size_df_0 <- (it-1)*(divided)+1
      size_df_1 <- (it)*(divided)
      if (it==1){
        result1 <- predict(allModelsResults,JAVA_classify_df[size_df_0:size_df_1,])
        allModelsResults_predictions <- result1
      } else {
        result1 <- predict(allModelsResults,JAVA_classify_df[size_df_0:size_df_1,])
        allModelsResults_predictions[size_df_0:size_df_1] <- predict(allModelsResults,JAVA_classify_df[size_df_0:size_df_1,])
      }
    }
    
    JAVA_classify_df <- NA
    
    allModelsResults_predictions_coded <- allModelsResults_predictions #predict(allModelsResults,JAVA_classify_df)
    
    
    allModelsResults_predictions_filter <- RED_raster_df_template
    #
    allModelsResults_predictions_filter[!is.na(RED_raster_df_template)] <- allModelsResults_predictions_coded[!is.na(RED_raster_df_template)]
    allModelsResults_predictions_coded <- NA
    
    allModelsResults_predictions_filter <- as.matrix(allModelsResults_predictions_filter)
    
    result_temp <- raster(RED_raster)
    
    nrows=RED_raster@nrows
    ncols=RED_raster@ncols
    
    temp1<-matrix(allModelsResults_predictions_filter,nrows,ncols,byrow=TRUE)
    allModelsResults_predictions_filter <- NA
    temp2 <- raster(temp1)
    extent(temp2) <- RED_raster
    projection(temp2) <- projection(RED_raster)
    raster_classify <- temp2
    
    filename_result <- paste(folder,region,"_",  period, "_PROBA_100_classify_paddy_",model_ML, sep="")
    filename_tif <- paste(folder,region,"_",  period,"_PROBA_100_classify_paddy_",model_ML,".tif", sep="")
    
    temp1 <- NA
    temp2 <- NA
    writeRaster(raster_classify, filename=filename_result, format="GTiff", overwrite=TRUE)
    
    
    
    mask_clip_paddy1 <- raster(mask)
    
    rast_stack <- stack(raster_classify,mask_clip_paddy1)
    
    fun_raster <- function(x) {
      if (is.na(x[2])==FALSE) {
        if (right(DecToBin(x[2]),3)=="000") {
          result <- x[1]
        }  else {
          result <- x[2]
        }
      } else {
        result <- NA
      }
      
      return(result)
    }
    #fun_raster(c(1,322))
    raster_classify_mask <- calc(rast_stack, fun_raster)
    rast_stack <- NA
    writeRaster(raster_classify_mask, filename=filename_result_classify_mask, format="GTiff", overwrite=TRUE)
    paddy_raster_classify_mask <- table(na.omit(as.data.frame(raster_classify_mask)))
    temp <-paddy_raster_classify_mask * 100*100 / 10000
    temp2 <- as.data.frame(temp,stringsAsFactors = FALSE)
    temp2$code <- temp2$Var1
    temp2$area_ha <- temp2$Freq
    temp2$Var1 <- NULL
    temp2$Freq <- NULL
    write.csv(temp2, file = filename_csv_classify_mask)
    raster_classify_mask <- NA
    
    gc()
    
    
  }
}