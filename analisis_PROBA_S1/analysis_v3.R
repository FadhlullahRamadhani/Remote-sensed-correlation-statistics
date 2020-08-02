rm(list=ls())
library(readxl)
library(xlsx)
library(beepr)

crops <- read_excel("F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/merge.xlsx")
crops$period1 <- crops$`THN-BLN`
recap <- read_excel("F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/recap.xlsx")

recap_merge <- recap
recap_merge$total <- recap_merge$area_ha_1+ recap_merge$area_ha_2+ recap_merge$area_ha_3 +	recap_merge$area_ha_4	
recap_merge$period1 <- substr(recap$period,2,8)
recap_merge$PROVINSI <- NA
recap_merge$KABUPATEN <- NA
recap_merge$KECAMATAN <- NA
recap_merge$TAHUN <- NA
recap_merge$BULAN <- NA
recap_merge$Paddy_planting <- NA
recap_merge$Paddy_harvested <- NA

for (i in 1:nrow(recap_merge)) { 
  for (j in 1:nrow(crops)) { 
  if (recap_merge$period1[i]==crops$period1[j] & recap_merge$subdistrict[i]==crops$subdistrict[j]) {
    recap_merge$PROVINSI[i] <- crops$PROVINSI[j]
    recap_merge$KABUPATEN[i] <- crops$KABUPATEN[j]
    recap_merge$KECAMATAN[i] <- crops$KECAMATAN[j]
    recap_merge$TAHUN[i] <- crops$TAHUN[j]
    recap_merge$BULAN[i] <- crops$BULAN[j]
    recap_merge$Paddy_planting[i] <- crops$Paddy_planting_area[j]
    recap_merge$Paddy_harvested[i] <- crops$Paddy_harvested_area[j]
  }
  }
}

area_xlsx <- read_excel("F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/area_luas_baku.xlsx")

recap_merge$luas_baku_ha <- NA
recap_merge$area_RS <- NA
for (i in 1:nrow(recap_merge)) { 
  for (j in 1:nrow(area_xlsx)) { 
    if (recap_merge$subdistrict[i]==area_xlsx$id_kecamatan[j] ) {
      recap_merge$luas_baku_ha[i] <- area_xlsx$luas_baku_ha[j]
      recap_merge$area_RS[i] <- area_xlsx$area_RS[j]
    }
  }
}
beep(sound = 10)

recap_merge$area_factor <- recap_merge$area_RS/recap_merge$luas_baku_ha
recap_merge$no <- NULL

names(recap_merge)[names(recap_merge) == "area_ha_1"] <- "BL"
names(recap_merge)[names(recap_merge) == "area_ha_2"] <- "VEG"
names(recap_merge)[names(recap_merge) == "area_ha_3"] <- "REPRO"
names(recap_merge)[names(recap_merge) == "area_ha_4"] <- "RIPE"
recap_merge1 <- recap_merge[,c("PROVINSI","KABUPATEN","KECAMATAN","subdistrict","region","TAHUN","BULAN",
                              "period1","period","BL","VEG","REPRO","RIPE","total","Paddy_planting",
                              "Paddy_harvested","luas_baku_ha","area_RS","area_factor")]

write.csv(recap_merge1, file = "F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/analysis_full_v3.csv")

recap_merge1 <- recap_merge1[recap_merge1$TAHUN %in% c("2017","2018"),]
recap_merge1 <- recap_merge1[!recap_merge1$period1 %in% c("2018-08","2018-09","2018-10","2018-11","2018-12"),]

write.csv(recap_merge1, file = "F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/analysis_area_v3.csv")
beep(sound = 4)

