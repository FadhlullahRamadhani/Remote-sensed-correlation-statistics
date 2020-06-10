
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

args <- commandArgs(trailingOnly = TRUE)
print(args)
mod_number <- as.integer(args[1])
library(raster)
library(rgdal)
#mod_number<-1
library(readxl)
clear<-c(322)
water<-c(324)
clear_water <- c(248,249,250)

#idkab <- c(3517,3518,3215,3522,3213,3524,3212)
regencies <- c(3212,3213,3215)
regencies <- sort(regencies,decreasing = FALSE)

model_ML <- c('svmRadial10')

regencies <- c(3215)
#WithMasking_LOOCV_LS8_nnet_center_scale_100
mainDir1 <- paste("F:/R-Script-DriveF/S1-ML-2019/ML_S1_LEE_2019_v7_WEST/svmRadial/",collapse = "",sep = "")

filename <- paste(mainDir1,"WithMasking_LOOCV_ML_S1_LEE_2019_v7_WEST_svmRadial_noProc_0001.rds", sep="")

allModelsResults <- readRDS(filename)
resolution<-100
resolution_str<-100
parts <- c("01","02")
period_starts <- as.Date(c("2016-02-24","2016-02-19"))
#20160224 20160219
for (i_part in 1:2) {
  part <- parts[i_part]
  period_start <- period_starts[i_part]
  for (res in resolution) {
    for (region in regencies) { 
      mainDir <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS-LEE-PADDY-AGG-",res,"m/VH-MEAN/",region,sep="")
      setwd(file.path(mainDir))
      search_str <- paste("*",region,".*[.]tif$",sep = "")
      files <- sort(list.files(pattern=search_str),decreasing = FALSE)
      period_end <- as.Date("2019-05-01")
      diff <- as.integer((period_end-period_start)/12)
      
      for (i in 3:diff){
        # sizes <- file.size(files[i])/(1000*1000)
        # if (sizes<1) {
        #   next
        # }
        period_3 <- period_start + (12*i)
        period_2 <- period_3-12
        period_1 <- period_3-24
        date_str3 <-  as.character(period_3, "%Y%m%d")
        date_str2 <-  as.character(period_2, "%Y%m%d")
        date_str1 <-  as.character(period_1, "%Y%m%d")
        period  <- period_3
        # if (i %% 3!=mod_number) {
        #   next
        # }
        
        
        # if (period!="2018-07-26") {
        #   next
        # }
        
        #model <- c('fda','nnet','svmRadial','svmLinear','svmPoly','svmRadial')
        if (is.na(period)) {
          next
        }
        
        folder <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m/",collapse = "",sep = "")
        dir.create(folder, showWarnings = FALSE)
        folder <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m/",period,"",collapse = "",sep = "")
        dir.create(folder, showWarnings = FALSE)
        folder <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m/",period,"/",model_ML,"/",collapse = "",sep = "")
        dir.create(folder, showWarnings = FALSE)
        
        filename_result <- paste(folder,region,"_",  period, "_S1_LEE_classify_",res,"m_",part,"_",model_ML, sep="")
        filename_tif <- paste(folder,region,"_",  period,"_S1_LEE_classify_",res,"m_",part,"_",model_ML,".tif", sep="")
        

        if (file.exists(filename_tif)) {
          next
        }
        
        print(filename_tif)
        
        mainDir <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS-LEE-PADDY-AGG-",res,"m/VH-MEAN/",region,sep="")
        setwd(file.path(mainDir))
        
        search_str <- paste("*",region,".*",date_str1,".*[.]tif$",sep = "")
        files_VH <- sort(list.files(pattern=search_str),decreasing = FALSE)
        if (length(files_VH)<1) {
          next
        }
        print(files_VH)
        if (length(files_VH)==1) {
          filename_original_1 <-files_VH[1]
          band_name_1 <- paste(mainDir,"/",filename_original_1,sep = "")
          VH1_NA <- raster(band_name_1, band=1)
        } else if (length(files_VH)==2) {
          input.rasters <- lapply(files_VH, raster)
          VH1_NA <- merge(input.rasters[[1]],input.rasters[[2]],tolerance=10)
        } else if (length(files_VH)==3) {
          input.rasters <- lapply(files_VH, raster)
          VH1_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],tolerance=10)
        } else  {
          input.rasters <- lapply(files_VH, raster)
          VH1_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],input.rasters[[4]],tolerance=10)
        }
        
     
        VH1_NA[VH1_NA==0] <- NA
        VH1_raster <- VH1_NA
        VH1_raster_df <- as.data.frame(VH1_raster)
        VH1_raster_df_template <- as.data.frame(VH1_raster)
        VH1_raster_df[is.na(VH1_raster_df)] <- -999    
        
        search_str <- paste("*",region,".*",date_str2,".*[.]tif$",sep = "")
        files_VH <- sort(list.files(pattern=search_str),decreasing = FALSE)
     
        if (length(files_VH)<1) {
          next
        }
        print(files_VH)
        if (length(files_VH)==1) {
          filename_original_2 <-files_VH[1]
          band_name_2 <- paste(mainDir,"/",filename_original_2,sep = "")
          VH2_NA <- raster(band_name_2, band=1)
        } else if (length(files_VH)==2) {
          input.rasters <- lapply(files_VH, raster)
          VH2_NA <- merge(input.rasters[[1]],input.rasters[[2]],tolerance=10)
        } else if (length(files_VH)==3) {
          input.rasters <- lapply(files_VH, raster)
          VH2_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],tolerance=10)
        } else  {
          input.rasters <- lapply(files_VH, raster)
          VH2_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],input.rasters[[4]],tolerance=10)
        }

        VH2_NA[VH2_NA==0] <- NA
        VH2_raster <- VH2_NA
        VH2_raster_df <- as.data.frame(VH2_raster)
        VH2_raster_df_template <- as.data.frame(VH2_raster)
        VH2_raster_df[is.na(VH2_raster_df)] <- -999    
        
        search_str <- paste("*",region,".*",date_str3,".*[.]tif$",sep = "")
        files_VH <- sort(list.files(pattern=search_str),decreasing = FALSE)
        if (length(files_VH)<1) {
          next
        }
        print(files_VH)
        if (length(files_VH)==1) {
          filename_original_3 <-files_VH[1]
          band_name_3 <- paste(mainDir,"/",filename_original_3,sep = "")
          VH3_NA <- raster(band_name_3, band=1)
        } else if (length(files_VH)==2) {
          input.rasters <- lapply(files_VH, raster)
          VH3_NA <- merge(input.rasters[[1]],input.rasters[[2]],tolerance=10)
        } else if (length(files_VH)==3) {
          input.rasters <- lapply(files_VH, raster)
          VH3_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],tolerance=10)
        } else  {
          input.rasters <- lapply(files_VH, raster)
          VH3_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],input.rasters[[4]],tolerance=10)
        }
        VH3_NA[VH3_NA==0] <- NA
        VH3_raster <- VH3_NA
        VH3_raster_df <- as.data.frame(VH3_raster)
        VH3_raster_df_template <- as.data.frame(VH3_raster)
        VH3_raster_df[is.na(VH3_raster_df)] <- -999 
        
        diff_VH1_raster_df <- VH2_raster_df - VH1_raster_df
        diff_VH2_raster_df <- VH3_raster_df - VH2_raster_df
        diff_VH3_raster_df <- VH3_raster_df - VH1_raster_df
        
        mainDir_VV <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS-LEE-PADDY-AGG-",res,"m/VV-MEAN/",region,sep="")
        setwd(file.path(mainDir_VV))
        search_str <- paste("*",region,".*",date_str1,".*[.]tif$",sep = "")
        files_VV <- sort(list.files(pattern=search_str),decreasing = FALSE)
        if (length(files_VV)<1) {
          next
        }
        print(files_VV)
        if (length(files_VV)==1) {
          filename_original_1 <-files_VV[1]
          band_name_1 <- paste(mainDir_VV,"/",filename_original_1,sep = "")
          VV1_NA <- raster(band_name_1, band=1)
        } else if (length(files_VV)==2) {
          input.rasters <- lapply(files_VV, raster)
          VV1_NA <- merge(input.rasters[[1]],input.rasters[[2]],tolerance=10)
        } else if (length(files_VV)==3) {
          input.rasters <- lapply(files_VV, raster)
          VV1_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],tolerance=10)
        } else  {
          input.rasters <- lapply(files_VV, raster)
          VV1_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],input.rasters[[4]],tolerance=10)
        }
        VV1_NA[VV1_NA==0] <- NA
        VV1_raster <- VV1_NA
        VV1_raster_df <- as.data.frame(VV1_raster)
        VV1_raster_df_template <- as.data.frame(VV1_raster)
        VV1_raster_df[is.na(VV1_raster_df)] <- -999    
        
        
        search_str <- paste("*",region,".*",date_str2,".*[.]tif$",sep = "")
        files_VV <- sort(list.files(pattern=search_str),decreasing = FALSE)
        if (length(files_VV)<1) {
          next
        }
        print(files_VV)
        if (length(files_VV)==1) {
          filename_original_2 <-files_VV[1]
          band_name_2 <- paste(mainDir_VV,"/",filename_original_2,sep = "")
          VV2_NA <- raster(band_name_2, band=1)
        } else if (length(files_VV)==2) {
          input.rasters <- lapply(files_VV, raster)
          VV2_NA <- merge(input.rasters[[1]],input.rasters[[2]],tolerance=10)
        } else if (length(files_VV)==3) {
          input.rasters <- lapply(list.files(pattern=search_str), raster)
          input.rasters <- lapply(files_VV, raster)
          VV2_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],tolerance=10)
        } else  {
          input.rasters <- lapply(files_VV, raster)
          VV2_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],input.rasters[[4]],tolerance=10)
        }
        VV2_NA[VV2_NA==0] <- NA
        VV2_raster <- VV2_NA
        VV2_raster_df <- as.data.frame(VV2_raster)
        VV2_raster_df_template <- as.data.frame(VV2_raster)
        VV2_raster_df[is.na(VV2_raster_df)] <- -999    
        
        search_str <- paste("*",region,".*",date_str3,".*[.]tif$",sep = "")
        files_VV <- sort(list.files(pattern=search_str),decreasing = FALSE)
        if (length(files_VV)<1) {
          next
        }
        print(files_VV)
        if (length(files_VV)==1) {
          filename_original_3 <-files_VV[1]
          band_name_3 <- paste(mainDir_VV,"/",filename_original_3,sep = "")
          VV3_NA <- raster(band_name_3, band=1)
        } else if (length(files_VV)==2) {
          input.rasters <- lapply(files_VV, raster)
          VV3_NA <- merge(input.rasters[[1]],input.rasters[[2]],tolerance=10)
        } else if (length(files_VV)==3) {
          input.rasters <- lapply(files_VV, raster)
          VV3_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],tolerance=10)
        } else  {
          input.rasters <- lapply(files_VV, raster)
          VV3_NA <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],input.rasters[[4]],tolerance=10)
        }
        VV3_NA[VV3_NA==0] <- NA
        VV3_raster <- VV3_NA
        VV3_raster_df <- as.data.frame(VV3_raster)
        VV3_raster_df_template <- as.data.frame(VV3_raster)
        VV3_raster_df[is.na(VV3_raster_df)] <- -999 
        
        diff_VV1_raster_df <- VV2_raster_df - VV1_raster_df
        diff_VV2_raster_df <- VV3_raster_df - VV2_raster_df
        diff_VV3_raster_df <- VV3_raster_df - VV1_raster_df
        
        JAVA_classify_df <- data.frame(VV1=VV1_raster_df,VV2=VV2_raster_df,
                                       VV3=VV3_raster_df,diff_VV1=diff_VV1_raster_df,
                                       diff_VV2=diff_VV2_raster_df,diff_VV3=diff_VV3_raster_df,
                                       VH1=VH1_raster_df,VH2=VH2_raster_df,
                                       VH3=VH3_raster_df,diff_VH1=diff_VH1_raster_df,
                                       diff_VH2=diff_VH2_raster_df,diff_VH3=diff_VH3_raster_df,
                                       stringsAsFactors=FALSE)
        
        colnames(JAVA_classify_df) <- c("VV1","VV2","VV3","diff_VV1","diff_VV2","diff_VV3","VH1","VH2","VH3","diff_VH1","diff_VH2","diff_VH3")
        
        print(paste(format(Sys.time(), "%a %b %d %Y %X")," | ",region," | ",period," | ", res," | ",filename_tif,sep=""))
        
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
        
        
        allModelsResults_predictions_filter <- VH1_raster_df_template
        #
        allModelsResults_predictions_filter[!is.na(VH1_raster_df_template)] <- allModelsResults_predictions_coded[!is.na(VH1_raster_df_template)]
        allModelsResults_predictions_coded <- NA
        
        allModelsResults_predictions_filter <- as.matrix(allModelsResults_predictions_filter)
        
        result_temp <- raster(VH1_raster)
        
        nrows=VH1_raster@nrows
        ncols=VH1_raster@ncols
        
        temp1<-matrix(allModelsResults_predictions_filter,nrows,ncols,byrow=TRUE)
        allModelsResults_predictions_filter <- NA
        temp2 <- raster(temp1)
        extent(temp2) <- VH1_raster
        projection(temp2) <- projection(VH1_raster)
        raster_classify <- temp2
        
        temp1 <- NA
        temp2 <- NA
        writeRaster(raster_classify, filename=filename_result, format="GTiff", overwrite=TRUE)
        
        raster_classify <-NA
        gc()
      }
    }
  }
}