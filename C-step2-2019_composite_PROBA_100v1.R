rm(list=ls())
library(raster)
library(rgdal)
library(readxl)


regencies <- c("WEST", "EAST")
#regencies <- c("EAST", "WEST")
#regencies <- c("WEST")
#idkab<- 3215
model_ML <-"svmRadial06"

period_composite_list <- c(12,16,32)
period_composite_str <- c("12","16","32")
for (year in 2014:2019) {
  
  
  for (i in 1:length(regencies)){
    region <- regencies[i]
    
    for (j in 1:length(period_composite_list)){
      composite <- period_composite_list[j]
      composite_str <- period_composite_str[j]
      numberofdays <- as.Date(paste(year,"-12-31",sep="")) -as.Date(paste(year,"-01-01",sep="")) + 1
      div_number <- (numberofdays/composite)+1
      date.start <- array()
      class(date.start) <- "Date"
      date.end <- array()
      class(date.end) <- "Date"
      for (int_date in 1:div_number) {
        date.start[int_date] <- as.Date(paste(year,"-01-01",sep="")) + (composite*(int_date-1))
        date.end[int_date] <-  as.Date(paste(year,"-01-01",sep="")) + (composite*(int_date))-1           
      }
      date.end[div_number] <-  as.Date(paste(year,"-12-31",sep="")) 
      folder_ML_classify_fmask <- paste("F:/R-Script-DriveF/ML-PROBA-100/CLASSIFY-PADDY-MASK",collapse = "",sep = "")
      period_list_classify <- sort(list.dirs(folder_ML_classify_fmask,full.names = FALSE,recursive = FALSE),decreasing = FALSE)
      for (k in 1:div_number){ 
        period_date_start <- as.Date(date.start[k])
        period_date_end <- as.Date(date.end[k])
        if (is.na(period_date_end)==TRUE) {
          next
        }
        print(period_date_start)
        period_composite <- period_date_end
        folder_clip_COMPOSITE <- paste("F:/R-Script-DriveF/ML-PROBA-100/CLASSIFY-MASK-COMPOSITE-",composite_str,"/",collapse = "",sep = "")
        dir.create(folder_clip_COMPOSITE, showWarnings = FALSE)
        folder_clip_COMPOSITE <- paste("F:/R-Script-DriveF/ML-PROBA-100/CLASSIFY-MASK-COMPOSITE-",composite_str,"/",period_composite,"/",collapse = "",sep = "")
        dir.create(folder_clip_COMPOSITE, showWarnings = FALSE)
        folder_clip_COMPOSITE <- paste("F:/R-Script-DriveF/ML-PROBA-100/CLASSIFY-MASK-COMPOSITE-",composite_str,"/",period_composite,"/",model_ML,"/",collapse = "",sep = "")
        dir.create(folder_clip_COMPOSITE, showWarnings = FALSE)
        filename_result_COMPOSITE <- paste(folder_clip_COMPOSITE,region,"-",period_composite,"_PROBA-100_ML_COMPOSITE_utm_",composite_str,"_",model_ML, sep="")
        filename_csv_COMPOSITE <- paste(folder_clip_COMPOSITE,region,"-",period_composite,"_PROBA-100_ML_stats_region_COMPOSITE_utm","_",composite_str,"_",model_ML,".csv", sep="")
        filename_result_time_COMPOSITE <- paste(folder_clip_COMPOSITE,region,"-",period_composite,"_PROBA-100_ML_TIME_utm","_",composite_str,"_",model_ML, sep="")
        filename_csv_time_COMPOSITE <- paste(folder_clip_COMPOSITE,region,"-",period_composite,"_PROBA-100_ML_stats_region_TIME_utm","_",composite_str,"_",model_ML,".csv", sep="")
        
        if (file.exists(filename_csv_time_COMPOSITE)) {
          next
        }
        int_k<-1
        print(paste(composite_str,"loading scenes"))
        input.rasters <-NA
        for (int_classify in 1:length(period_list_classify)){
          period<- period_list_classify[int_classify]
          period_date <- as.Date(period)
          if (!(period_date>=period_date_start & period_date<=period_date_end)) {
            next
          }
          
          mainDir <- paste("F:/R-Script-DriveF/ML-PROBA-100/CLASSIFY-PADDY-MASK/",period,"/",model_ML,"/",sep="")
          if (dir.exists(mainDir)==FALSE) {
            next
          }
          setwd(mainDir)
          
          iserror=FALSE
          
          search_str <- paste(region,".*[.]tif$",sep = "")
          if (length(list.files(pattern=search_str))>0) {
            if (int_k<2) {
              input.rasters <- lapply(list.files(pattern=search_str), raster)
              period_list <- period_date
              int_k<-int_k+1  
            } else {
              input.rasters[int_k] <- lapply(list.files(pattern=search_str), raster)
              period_list[int_k] <- period_date
              int_k<-int_k+1  
            }
            print(list.files(pattern=search_str))
            period_last <- period_date
          }
          
        }
        if (exists("input.rasters")==FALSE) {
          next
        }
        
        input.rasters<- Filter(Negate(is.null), input.rasters)
        if (ncell(input.rasters)<1) {
          next
        }
        if (length(input.rasters)==0) {
          next
        }
        if (is.na(input.rasters)==TRUE) {
          next
        }
        no_raster <- ncell(input.rasters)
        if (no_raster==1) {
          raster_COMPOSITE <- input.rasters[[1]]
          raster_TIME <- raster_COMPOSITE
          raster_TIME[raster_TIME>=0] <- as.integer(strftime(period_date, format = "%j"))
        } else if (no_raster<1) {
          next
        } else {
          for (int_raster in no_raster:2) {
            print(paste(period_list[int_raster],period_list[int_raster-1]))
            if (int_raster==no_raster) {
              raster_end <- input.rasters[[int_raster]]
              raster_doy_end <- raster_end
              raster_doy_end[raster_doy_end>=0] <- as.integer(strftime(period_list[int_raster], format = "%j"))
            } else {
              raster_end <- raster_COMPOSITE
              raster_doy_end <- raster_TIME
            }
            
            raster_prev <- input.rasters[[int_raster-1]]
            raster_doy_prev <- raster_prev
            raster_doy_prev[raster_doy_prev>=0] <- as.integer(strftime(period_list[int_raster-1], format = "%j"))
            
            rast_stack1 <- stack(raster_end,raster_prev)
            fun_raster1 <- function(x) {
              if (is.na(x[1])==FALSE) {
                if (x[1]>4) {
                  if (is.na(x[2])==FALSE) { 
                    if (x[2]<=4) {
                      result <- x[2]
                    } else {
                      result <- x[1]
                    } 
                  } else {
                    result <- x[3]
                  }
                } else {
                  result <- x[1]
                }
              } else {
                result <- NA
              }
              return(result)
            }
            raster_COMPOSITE <- calc(rast_stack1, fun_raster1)
            
            rast_stack_time <- stack(raster_end,raster_prev,raster_doy_end,raster_doy_prev)
            fun_raster_time <- function(x) {
              if (is.na(x[1])==FALSE) {
                if (x[1]>4) {
                  #print(paste(x[1],x[2],x[3],x[4]))
                  if (is.na(x[2])==FALSE) { 
                    if (x[2]<=4) {
                      result <- x[4]
                    } else {
                      result <- x[3]
                    }
                  } else {
                    result <- x[3]
                  }
                } else {
                  result <- x[3]
                }
              } else {
                result <- NA
              }
              return(result)
            }
            raster_TIME <- calc(rast_stack_time, fun_raster_time)
          }
        }
        
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
        
        writeRaster(raster_TIME, filename=filename_result_time_COMPOSITE, format="GTiff", overwrite=TRUE)
        raster_df_count_TIME <- table(na.omit(as.data.frame(raster_TIME)))
        temp <- raster_df_count_TIME * 100*100 / 10000
        temp2 <- as.data.frame(temp,stringsAsFactors = FALSE)
        temp2$code <- temp2$Var1
        temp2$area_ha <- temp2$Freq
        temp2$Var1 <- NULL
        temp2$Freq <- NULL
        write.csv(temp2, file = filename_csv_time_COMPOSITE)
        raster_TIME<-NA
        input.rasters <-NA
        gc()
        
      }
    }
    removeTmpFiles(h=0)
  }
}
