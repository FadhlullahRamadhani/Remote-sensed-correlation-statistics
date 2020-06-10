
rm(list=ls())

setwd("C:/MasseyOffice1/Research/R-Script/")
#'B4','B3','B2','B5'

mainDir_BANDS <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS",sep="")
mainDir_BAT <- paste("F:/R-Script-DriveF/S1-ML-2019/",sep="")
mainDir_SHP_PADDY <- paste("F:/R-Script-DriveF/S1-ML-2019/shp/paddy_utm",sep="")

regencies <- c(3212,3213,3215)


operations<- c("MEAN")
bands <- c("VH")

resolution <- c(100)
for (res in resolution) {
  print(res)
  temp <-"import arcpy, arcinfo\r\nimport time\r\nimport os\r\nimport math\r\nfrom datetime import datetime\r\n"
  temp <- paste(temp, "arcpy.CheckOutExtension(\"spatial\")", "\r\n",sep="")
  
  for (region in regencies) {
    print(region)
    
    for (operation in operations) {
      for (band in bands) {
        
        mainDir_BANDS_AGG <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS-LEE-PADDY-AGG-",res,"",sep="")
        dir.create(mainDir_BANDS_AGG, showWarnings = FALSE)
        mainDir_BANDS_AGG <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS-LEE-PADDY-AGG-",res,"/",band,"-",operation,sep="")
        dir.create(mainDir_BANDS_AGG, showWarnings = FALSE)
        folder_to <- paste("F:/R-Script-DriveF/S1-ML-2019/BANDS-LEE-PADDY-AGG-",res,"/",band,"-",operation,"/",region,sep="")
        dir.create(folder_to, showWarnings = FALSE)
        
        folder_ori <-  paste("F:/R-Script-DriveF/S1-ML-2019/BANDS-LEE-PADDY/",region,sep="")
        setwd(file.path(folder_ori))
        search_str <- paste("*",region,".*[.]tif$",sep = "")
        files <- sort(list.files(pattern=search_str),decreasing = FALSE)
        
        band_shp <- paste(mainDir_SHP_PADDY, "/paddy_",region,".shp",sep="")  
        band_shp <- gsub("/","\\\\\\",band_shp)
        temp <- paste(temp, "S1_paddy_",region," = \"",band_shp, "\"\r\n",sep="")
        
        if (length(files)<1) {
          next
        }
        for (band in files) {
          file_to <- paste("PADDY_",band,sep="")
          name_band_to <- paste(folder_to,"/",file_to,sep = "")
          if (file.exists(name_band_to)==FALSE) {
            #print(paste(region,name_band_to,sep="-"))
            tif_ori <- paste(folder_ori, "/",band,sep="")  
            tif_ori <- gsub("/","\\\\\\",tif_ori)
            band_tif  <- gsub("\\.","_",band)
            band_tif  <- gsub("-","_",band_tif)
            band_tif  <- gsub(".tif","_tif",band_tif)
            temp <- paste(temp,"from_",band_tif," = \"",tif_ori, "\"\r\n",sep="")
            tif_to <- paste(folder_to, "/",file_to,sep="")  
            tif_to <- gsub("/","\\\\\\",tif_to)
            temp <- paste(temp,"to_", band_tif," = \"",tif_to, "\"\r\n",sep="")
            temp <- paste(temp,"print datetime.now().strftime('%Y-%m-%d %H:%M:%S') + ' PADDYBANDS2AGG creating ->  ' + '", band,"'\r\n",sep="")
            temp <- paste(temp, "arcpy.gp.ExtractByMask_sa(","from_",band_tif,", ","S1_paddy_", region ,", ","to_", band_tif ,")", "\r\n",sep="")      
            
          }
        }
      }
    }
  }
  temp <- gsub("\\", "\\\\", temp, fixed = TRUE)
  filename <- paste(mainDir_BAT, "/","runBAND_2AGG_paddy_LEE_",res,".py",sep="")
  write(temp,file = filename)
}


