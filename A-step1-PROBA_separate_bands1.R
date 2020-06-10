
rm(list=ls())
library(raster)
library(sp)
library(rgdal)

setwd("C:/MasseyOffice1/Research/R-Script/")
#'B4','B3','B2','B5'


regencies <- c("WEST", "EAST")
#regencies <- c("EAST", "WEST")
for (region in regencies) {
  mainDir <- paste("F:/RS_images/PROBA-TOC-BANDS-100m-utm/",sep="")
  setwd(file.path(mainDir))
  search_str <- paste("*",region,".*[.]tif$",sep = "")
  files <- list.files(pattern=search_str)
  if (length(files)<5) {
    next
  }
  for (i in 1:length(files)){
    sizes <- file.size(files[i])/(1000*1000)
    if (sizes<1) {
      next
    }
  

    
    filename_original <-files[i]
    date_images <- as.Date(substr(filename_original,31,38),format = "%Y%m%d")
    # if (!(date_images>as.Date("2018-05-31") & date_images<as.Date("2018-10-01"))) {
    #   next
    # }
    # 
    folder <-paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS/",sep="")
    dir.create(folder, showWarnings = FALSE)
    folder_RED <-paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS/RED/",sep="")
    dir.create(folder_RED, showWarnings = FALSE)
    folder_NIR <-paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS/NIR/",sep="")
    dir.create(folder_NIR, showWarnings = FALSE)
    folder_BLUE <-paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS/BLUE/",sep="")
    dir.create(folder_BLUE, showWarnings = FALSE)
    folder_SWIR <-paste("F:/R-Script-DriveF/ML-PROBA-100/BANDS/SWIR/",sep="")
    dir.create(folder_SWIR, showWarnings = FALSE)
    list_ok <- c("RED","NIR","BLUE","SWIR","NDVI","SM")
    
    filename <-paste(folder_SWIR,"SWIR_",filename_original, sep="")
    
    if (file.exists(filename)) {
      next
    }
    print(format(Sys.time(), "%a %b %d %X %Y"))
    print(paste(region,filename_original,sep="-"))
    
    Band_RED <- raster(filename_original,band=1)
    filename <-paste(folder_RED,"RED_",filename_original, sep="")
    writeRaster(Band_RED, filename=filename, format="GTiff", overwrite=TRUE)
    
    Band_NIR <- raster(filename_original,band=2)
    filename <-paste(folder_NIR,"NIR_",filename_original, sep="")
    writeRaster(Band_NIR, filename=filename, format="GTiff", overwrite=TRUE)
    
    Band_BLUE <- raster(filename_original,band=3)
    filename <-paste(folder_BLUE,"BLUE_",filename_original, sep="")
    writeRaster(Band_BLUE, filename=filename, format="GTiff", overwrite=TRUE) 
    
    Band_SWIR <- raster(filename_original,band=4)
    filename <-paste(folder_SWIR,"SWIR_",filename_original, sep="")
    writeRaster(Band_SWIR, filename=filename, format="GTiff", overwrite=TRUE) 
    
  }
}

rm(list=ls())
gc()
memory.size(max=F)
Sys.sleep(30)
rm(list=ls())
gc()
memory.size(max=F)