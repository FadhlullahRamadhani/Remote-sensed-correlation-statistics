rm(list=ls())
library(raster)
library(rgdal)
library(readxl)
setwd("F:/MasseyOffice1/Research/R-Script2019/")

regencies <- c("WEST", "EAST")
regencies <- c("WEST")
#idkab<- 3215
model_ML <-"svmRadial10"
region <-"32"
period_MERGE_list <- c(12)
period_MERGE_str <- c("12")
# resolution <- c(30,50,100,150,300)
# resolution_str <- c("030","050","100","150","300")
resolution<-100
resolution_str<-"100"
for (res in resolution) {
  for (year in 2017:2019) {
    #for (year in 2014:2019) {
    for (j in 1:length(period_MERGE_list)){
      MERGE <- period_MERGE_list[j]
      MERGE_str <- period_MERGE_str[j]
      numberofdays <- as.Date(paste(year,"-12-31",sep="")) -as.Date(paste(year,"-01-01",sep="")) + 1
      div_number <- (numberofdays/MERGE)+1
      date.start <- array()
      class(date.start) <- "Date"
      date.end <- array()
      class(date.end) <- "Date"
      for (int_date in 1:div_number) {
        date.start[int_date] <- as.Date(paste(year,"-01-01",sep="")) + (MERGE*(int_date-1))
        date.end[int_date] <-  as.Date(paste(year,"-01-01",sep="")) + (MERGE*(int_date))-1           
      }
      date.end[div_number] <-  as.Date(paste(year,"-12-31",sep="")) 
      folder_ML_classify <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m/",collapse = "",sep = "")
      
      period_list_classify <- sort(list.dirs(folder_ML_classify,full.names = FALSE,recursive = FALSE),decreasing = FALSE)
      for (k in 1:div_number){ 
        period_date_start <- as.Date(date.start[k])
        period_date_end <- as.Date(date.end[k])
        if (is.na(period_date_end)==TRUE) {
          next
        }
        print(period_date_start)
        period_MERGE <- period_date_end
        folder_clip_MERGE <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m-MERGE-",MERGE_str,"/",collapse = "",sep = "")
        dir.create(folder_clip_MERGE, showWarnings = FALSE)
        folder_clip_MERGE <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m-MERGE-",MERGE_str,"/",period_MERGE,"/",collapse = "",sep = "")
        dir.create(folder_clip_MERGE, showWarnings = FALSE)
        folder_clip_MERGE <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m-MERGE-",MERGE_str,"/",period_MERGE,"/",model_ML,"/",collapse = "",sep = "")
        dir.create(folder_clip_MERGE, showWarnings = FALSE)
        
        filename_result_MERGE <- paste(folder_clip_MERGE,region,"-",period_MERGE,"_S1_ML_MERGE_",MERGE_str,"_",model_ML, sep="")
        filename_tif_MERGE <- paste(folder_clip_MERGE,region,"-",period_MERGE,"_S1_ML_MERGE_",MERGE_str,"_",model_ML,".tif", sep="")
        
        filename_csv_MERGE <- paste(folder_clip_MERGE,region,"-",period_MERGE,"_S1_ML_MERGE_",MERGE_str,"_",model_ML,".csv", sep="")
        
        if (file.exists(filename_tif_MERGE)) {
          next
        }
        int_k<-1
        print(paste(MERGE_str,"loading scenes"))
        input.rasters <-NA
        input_list<-NA
        for (int_classify in 1:length(period_list_classify)){
          period<- period_list_classify[int_classify]
          period_date <- as.Date(period)
          if (!(period_date>=period_date_start & period_date<=period_date_end)) {
            next
          }
          print(period)
          mainDir <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-",res,"m/",period,"/",model_ML,"/",sep="")
          if (dir.exists(mainDir)==FALSE) {
            next
          }
          setwd(mainDir)
          
          iserror=FALSE
          
          search_str <- paste(region,".*[.]tif$",sep = "")
          temp_list <- list.files(pattern=search_str)
          print(list.files(pattern=search_str))
          
          number_files <- length(temp_list)
          if (number_files==0) {
            next
          }
          if (number_files==1) {
            if (is.na(input_list)==TRUE) {
              input_list <- paste(mainDir,temp_list[1],sep="")
            } else {
              input_list[int_k] <- paste(mainDir,temp_list[1],sep="")
            }
            int_k<-int_k+1
          } else {
            for (int_file in 1:number_files) {
              input_list[int_k] <- paste(mainDir,temp_list[int_file],sep="")
              int_k<-int_k+ 1
            }
          }
        }
        if (is.na(input_list)==TRUE) {
          next
        }
        input.rasters <- lapply(input_list, raster)
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
        if (length(input.rasters)==1) {
          raster_MERGE <- input.rasters[[1]]
        } else if (length(input.rasters)==2) {
          raster_MERGE <- merge(input.rasters[[1]],input.rasters[[2]],tolerance=10)
        } else if (length(input.rasters)==3) {
          raster_MERGE <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],tolerance=10)
        } else  {
          raster_MERGE <- merge(input.rasters[[1]],input.rasters[[2]],input.rasters[[3]],input.rasters[[4]],tolerance=10)
        }
        writeRaster(raster_MERGE, filename=filename_result_MERGE, format="GTiff", overwrite=TRUE, datatype='INT1U')
        raster_df_count_MERGE <- table(na.omit(as.data.frame(raster_MERGE)))
        temp <- raster_df_count_MERGE * MERGE*MERGE / 10000
        temp2 <- as.data.frame(temp,stringsAsFactors = FALSE)
        temp2$code <- temp2$Var1
        temp2$area_ha <- temp2$Freq
        temp2$Var1 <- NULL
        temp2$Freq <- NULL
        write.csv(temp2, file = filename_csv_MERGE)
        raster_MERGE<-NA
        
        input.rasters <-NA
        gc()
      }
    }
  }
  removeTmpFiles(h=0)
}
