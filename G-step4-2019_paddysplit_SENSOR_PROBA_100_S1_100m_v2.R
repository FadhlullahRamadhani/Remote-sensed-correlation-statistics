
rm(list=ls())

setwd("C:/MasseyOffice1/Research/R-Script/")
#'B4','B3','B2','B5'
 
mainDir_BANDS <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/BANDS",sep="")
mainDir_BAT <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/",sep="")
mainDir_SHP_PADDY <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/shp/paddy_utm",sep="")

regencies <- c("WEST", "EAST")

#idkab<- 3215
model_ML <-"svmRadial0610"

period_composite_list <- 12
period_composite_str <- 12
region <-"WEST"

for (j in 1:length(period_composite_list)) {
  composite <- period_composite_list[j]
  composite_str <- period_composite_str[j]
  temp <-"import arcpy, arcinfo\r\nimport time\r\nimport os\r\nimport math\r\nfrom datetime import datetime\r\n"
  temp <- paste(temp, "arcpy.CheckOutExtension(\"spatial\")", "\r\n",sep="")
  band_shp <- paste(mainDir_SHP_PADDY, "/paddy_",region,".shp",sep="")  
  band_shp <- gsub("/","\\\\\\",band_shp)
  temp <- paste(temp, "PROBA_S1_paddy_",region," = \"",band_shp, "\"\r\n",sep="")
  
  folder_ML_classify_fmask <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m/",collapse = "",sep = "")
  
  period_list_classify <- sort(list.dirs(folder_ML_classify_fmask,full.names = FALSE,recursive = FALSE),decreasing = FALSE)
  
  for (int_classify in 1:length(period_list_classify)){
    period<- period_list_classify[int_classify]
    if (period=="NA") {
      next
    }
    period_date <- as.Date(period)
    folder_to <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m-PADDY/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    folder_to <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m-PADDY/",period,"/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    folder_to <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m-PADDY/",period,"/",model_ML,"/",collapse = "",sep = "")
    dir.create(folder_to, showWarnings = FALSE)
    
    folder_ori <-  paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-SENSOR-",composite_str,"-25m/",period,"/",model_ML,collapse = "",sep = "")
    setwd(file.path(folder_ori))
    file_from <- paste(region,"-",period,"_PROBA_S1_ML_utm_SENSOR_25m_",composite_str,"_",model_ML,".tif", sep="")

    if (file.exists(file_from)==FALSE) {
      next
    }
    file_to <- paste(folder_to, "/","PADDY_", region,"-",period,"_PROBA_S1_ML_utm_SENSOR_25m_",composite_str,"_",model_ML,".tif", sep="")
    
    if (file.exists(file_to)==FALSE) {
      #print(paste(region,name_band_to,sep="-"))
      tif_ori <- paste(folder_ori, "/",file_from,sep="")  
      tif_ori <- gsub("/","\\\\\\",tif_ori)
      band_tif  <- gsub("\\.","_",file_from)
      band_tif  <- gsub("-","_",band_tif)
      band_tif  <- gsub(".tif","_tif",band_tif)
      temp <- paste(temp,"from_",band_tif," = \"",tif_ori, "\"\r\n",sep="")
      tif_to <- paste(file_to,sep="")  
      tif_to <- gsub("/","\\\\\\",tif_to)
      temp <- paste(temp,"to_", band_tif," = \"",tif_to, "\"\r\n",sep="")
      temp <- paste(temp,"print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2 creating ->  ' + '", file_from,"'\r\n",sep="")
      temp <- paste(temp, "arcpy.gp.ExtractByMask_sa(","from_",band_tif,", ","PROBA_S1_paddy_", region ,", ","to_", band_tif ,")", "\r\n",sep="")      
      
      
    }
  }
  temp <- gsub("\\", "\\\\", temp, fixed = TRUE)
  filename <- paste(mainDir_BAT, "/","runBAND_PROBA_S1_paddy_SENSOR_",composite_str,"_",region,".py",sep="")
  write(temp,file = filename)
}

