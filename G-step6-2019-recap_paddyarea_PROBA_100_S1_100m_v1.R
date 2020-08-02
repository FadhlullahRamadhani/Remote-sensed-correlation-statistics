
rm(list=ls())

setwd("F:/MasseyOffice1/Research/R-Script2019/")
#
# 
results <- data.frame(
  sensor=character(),
  model=character(),
  period=character(),
  region=character(),
  subdistrict=character(),
  area_ha_1=double(),
  area_ha_2=double(),
  area_ha_3=double(),
  area_ha_4=double(),
  stringsAsFactors = FALSE
)




mainDir_results_S1 <- paste("F:/R-Script-DriveF/ML-PROBA-100-S1-100/CLASSIFY-COMPOSITE-12-25m-PADDY-SUBDISTRICT/",collapse = "",sep = "")

model_ML <- "svmRadial0610"
library(readxl)


idkab <- "WEST"


for (j in 1:length(idkab)){
  region <- idkab[j]
  print(region)
  search_str <- paste("*",region,".*[.]csv$",sep = "")
  files_list <- sort(list.files(pattern=search_str,path = mainDir_results_S1,full.names = TRUE),decreasing = FALSE)
  files_list_short <- sort(list.files(pattern=search_str,path = mainDir_results_S1),decreasing = FALSE)
  date_list <- as.Date(substr(files_list_short,15,24),format = "%Y-%m-%d")
  
  for (i in 1:length(files_list)) {
    period <- date_list[i]
    print(paste("PROBA-S1","|",region,"|",period,sep=""))
    file_csv <- files_list[i]
    
    # #print(file_csv)
    dat = as.data.frame(read.csv(file_csv, header = TRUE))
    subdistrict <- unique(dat$subdistrict)
    if (length(subdistrict)>0){
      for (j in 1:length(subdistrict)){
        temp <- dat[dat$subdistrict==subdistrict[j],]
        area_ha_1 <- 0
        area_ha_2 <- 0
        area_ha_3 <- 0
        area_ha_4 <- 0
        area_ha_5 <- 0
        area_ha_200 <- 0
        area_ha_300 <- 0
        area_ha_400 <- 0
        area_ha_others <- 0
        for (k in 1:dim(temp)[1]){
          if (temp$code[k]==1) {
            area_ha_1 <- area_ha_1 + temp$area_ha[k]
          } else if (temp$code[k]==2 | temp$code[k]==60) {
            area_ha_2 <- area_ha_2 + temp$area_ha[k]
          } else if (temp$code[k]==3) {
            area_ha_3 <- area_ha_3 + temp$area_ha[k]
          } else if (temp$code[k]==4) {
            area_ha_4 <- area_ha_4 + temp$area_ha[k]
          } else if (temp$code[k]==5) {
            area_ha_5 <- area_ha_5 + temp$area_ha[k]
          } else if (temp$code[k]==200) {
            area_ha_200 <- area_ha_200 + temp$area_ha[k]
          } else if (temp$code[k]==300) {
            area_ha_300 <- area_ha_300 + temp$area_ha[k]
          } else if (temp$code[k]==400) {
            area_ha_400 <- area_ha_400 + temp$area_ha[k]
          } else {
            area_ha_others <- area_ha_others + temp$area_ha[k]
          }
        }
        results[nrow(results) + 1, ] <- c(
          as.character("S1_PROBA"),
          as.character(model_ML),
          as.character(paste("'",period,sep = "")),
          as.character(substr(subdistrict[j],1,4)),
          as.integer(subdistrict[j]),
          as.double(area_ha_1),
          as.double(area_ha_2),
          as.double(area_ha_3),
          as.double(area_ha_4),
          as.double(area_ha_5),
          as.double(area_ha_200),
          as.double(area_ha_300),
          as.double(area_ha_400),
          as.double(area_ha_others)
        )
        
      }
    } else {
      print(paste("TIDAK ADA",file_csv,sep=""))
    }
  }
}



mainDir_results<- paste("F:/MasseyOffice1/Research/R-Script2019/",sep="")

filename_csv_paddy_subdistrict <- paste(mainDir_results,"recap_stats_S1_PROBA_v1.csv", sep="")
write.csv(results, file = filename_csv_paddy_subdistrict)
