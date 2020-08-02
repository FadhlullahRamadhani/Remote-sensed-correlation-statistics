
rm(list=ls())
library(tseries)
library(dynlm)
library(sandwich)
setwd("F:/MasseyOffice1/Research/R-Script2019/")

Find_Max_CCF<- function(a,b,minvalue,maxvalue)
{
  d <- ccf(a, b, plot = FALSE)
  cor = d$acf[,,1]
  lag = d$lag[,,1]
  res = data.frame(cor,lag)
  res <- res[res$lag <= 0,]
  res <- res[res$lag >= maxvalue,]
  res <- res[res$lag <= minvalue,]
  res_max = res[which.max(res$cor),]
  return(res_max)
} 



file_csv <- "F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/analysis_area_v3.csv"
dat = as.data.frame(read.csv(file_csv, header = TRUE))

data_clear <- dat[dat$period != "'2017-12-31",]
data_admin <- data_clear[c(2:5)]
data_admin <- unique(data_admin)

data_admin$VEG.REPRO.corr <- NA
data_admin$VEG.REPRO.lag <- NA

data_admin$VEG.RIPE.corr <- NA
data_admin$VEG.RIPE.lag <- NA

data_admin$REPRO.RIPE.corr <- NA
data_admin$REPRO.RIPE.lag <- NA

data_admin$VEG.planting.corr <- NA
data_admin$VEG.planting.lag <- NA

data_admin$VEG.harvested.corr <- NA
data_admin$VEG.harvested.lag <- NA

data_admin$REPRO.harvested.corr <- NA
data_admin$REPRO.harvested.lag <- NA

data_admin$RIPE.harvested.corr <- NA
data_admin$RIPE.harvested.lag <- NA

data_admin$planting.harvested.corr <- NA
data_admin$planting.harvested.lag <- NA




for (i in 1:dim(data_admin)[1]) {
  id_kec <- data_admin$subdistrict[i]
  data_clear_kecamatan <- data_clear[data_clear$subdistrict == id_kec,]
  VEG_list <- data_clear_kecamatan$VEG
  REPRO_list <- data_clear_kecamatan$REPRO
  RIPE_list <- data_clear_kecamatan$RIPE
  Paddy_planting_list <- data_clear_kecamatan$Paddy_planting
  Paddy_harvested_list <- data_clear_kecamatan$Paddy_harvested
  a <- Find_Max_CCF(VEG_list, REPRO_list,-3,-5)
  data_admin$VEG.REPRO.corr[i] <- a[1]$cor
  data_admin$VEG.REPRO.lag[i] <- a[2]$lag

  a <- Find_Max_CCF(VEG_list, RIPE_list,-6,-8)
  data_admin$VEG.RIPE.corr[i] <- a[1]$cor
  data_admin$VEG.RIPE.lag[i] <- a[2]$lag
  
  a <- Find_Max_CCF(REPRO_list, RIPE_list,0,-4)
  data_admin$REPRO.RIPE.corr[i] <- a[1]$cor
  data_admin$REPRO.RIPE.lag[i] <- a[2]$lag
  
  a <- Find_Max_CCF(Paddy_planting_list, Paddy_harvested_list,-5,-9)
  data_admin$planting.harvested.corr[i] <- a[1]$cor
  data_admin$planting.harvested.lag[i] <- a[2]$lag
  
  a <- Find_Max_CCF(VEG_list, Paddy_planting_list,0,-4)
  data_admin$VEG.planting.corr[i] <- a[1]$cor
  data_admin$VEG.planting.lag[i] <- a[2]$lag
  
  a <- Find_Max_CCF(VEG_list, Paddy_harvested_list,-5,-9)
  data_admin$VEG.harvested.corr[i] <- a[1]$cor
  data_admin$VEG.harvested.lag[i] <- a[2]$lag
 
  
  a <- Find_Max_CCF(REPRO_list, Paddy_harvested_list,-2,-5)
  data_admin$REPRO.harvested.corr[i] <- a[1]$cor
  data_admin$REPRO.harvested.lag[i] <- a[2]$lag
  
  
  a <- Find_Max_CCF(RIPE_list, Paddy_harvested_list,0,-3)
  data_admin$RIPE.harvested.corr[i] <- a[1]$cor
  data_admin$RIPE.harvested.lag[i] <- a[2]$lag
  
  
}

write.csv(data_admin, file = "F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/analysis_corr_v7.csv")


