
rm(list=ls())

setwd("C:/MasseyOffice1/Research/R-Script2019/")
#'B4','B3','B2','B5'

mainDir_BANDS <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS",sep="")
mainDir_BAT <- paste("F:/R-Script-DriveF/S1-ML-2019/",sep="")
mainDir_SHP_major <- paste("F:/R-Script-DriveF/S1-ML-2019/shp/paddy_utm",sep="")

regencies <- c("WEST", "EAST")

#idkab<- 3215
model_ML <-"svmRadial10"

period_composite_list <- c(12)
period_composite_str <- c("12")
region <-"32"

for (j in 1:length(period_composite_list)) {
  composite <- period_composite_list[j]
  composite_str <- period_composite_str[j]
  temp <-"import arcpy, arcinfo\r\nfrom arcpy import env\r\nfrom arcpy.sa import *\r\nimport time\r\nimport os\r\nimport math\r\nfrom datetime import datetime\r\n"
  temp <- paste(temp, "arcpy.CheckOutExtension(\"spatial\")", "\r\n",sep="")
  band_shp <- paste(mainDir_SHP_major, "/paddy_",region,".shp",sep="")  
  band_shp <- gsub("/","\\\\\\",band_shp)
  temp <- paste(temp, "S3_major_",region," = \"",band_shp, "\"\r\n",sep="")
  
  folder_ML_classify_fmask <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-100m-MERGE-12/",collapse = "",sep = "")
  
  period_list_classify <- sort(list.dirs(folder_ML_classify_fmask,full.names = FALSE,recursive = FALSE),decreasing = FALSE)
  
  for (int_classify in 1:length(period_list_classify)){
    period<- period_list_classify[int_classify]
    if (period=="NA") {
      next
    }
    period_date <- as.Date(period)
    folder_to <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-100m-MERGE-MAJOR-12/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    folder_to <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-100m-MERGE-MAJOR-12/",period,"/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    folder_to <- paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-100m-MERGE-MAJOR-12/",period,"/",model_ML,"/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    
    folder_ori <-  paste("F:/R-Script-DriveF/S1-ML-2019/CLASSIFY-100m-MERGE-12/",period,"/",model_ML,collapse = "",sep = "")
    setwd(file.path(folder_ori))
    file_from <- paste(region,"-",period,"_S1_ML_MERGE_",composite_str,"_",model_ML,".tif", sep="")

    if (file.exists(file_from)==FALSE) {
      next
    }
    file_to <- paste(folder_to,region,"-",period,"_S1_ML_MAJOR_MERGE_",composite_str,"_",model_ML,".tif", sep="")
    file_to_name <- paste(region,"-",period,"_S1_ML_MAJOR_MERGE_",composite_str,"_",model_ML,".tif", sep="")
    
    if (file.exists(file_to)==FALSE) {
      #print(paste(region,name_band_to,sep="-"))
      tif_ori <- paste(folder_ori, "/",file_from,sep="")  
      tif_ori <- gsub("/","\\\\\\",tif_ori)
      band_tif  <- gsub("\\.","_",file_from)
      band_tif  <- gsub("-","_",band_tif)
      band_tif  <- gsub(".tif","_tif",band_tif)
      band_tif_name_from <- paste("from_",band_tif," = \"",tif_ori, "\"\r\n",sep="")
      band_tif_name_from_name <- paste("from_",band_tif,sep="")
      temp <- paste(temp,band_tif_name_from,sep="")
      tif_to <- paste(file_to,sep="")  
      tif_to <- gsub("/","\\\\\\",tif_to)
      to_tif  <- gsub("\\.","_",file_to_name)
      to_tif  <- gsub("-","_",to_tif)
      to_tif  <- gsub(".tif","_tif",to_tif)
      band_tif_name_to <- paste("to_",to_tif," = \"",tif_to, "\"\r\n",sep="")
      band_tif_name_to_name <- paste("to_",to_tif,sep="")
      temp <- paste(temp,band_tif_name_to,sep="")
      temp <- paste(temp,"outMajFilt = MajorityFilter(",band_tif_name_from_name,", \"EIGHT\", \"MAJORITY\")\r\n",sep="")
      temp <- paste(temp,"print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '", file_from,"'\r\n",sep="")
      temp <- paste(temp,"outMajFilt.save(",band_tif_name_to_name,")\r\n",sep="")

    }
  }
  temp <- gsub("\\", "\\\\", temp, fixed = TRUE)
  filename <- paste(mainDir_BAT, "/","runBAND_S3_major_",composite_str,"_",region,".py",sep="")
  write(temp,file = filename)
}

