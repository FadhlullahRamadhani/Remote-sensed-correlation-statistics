
rm(list=ls())
library(ggplot2)
library(ggthemes)
library(extrafont)
library(plyr)
library(scales)
library(readxl)
library(dplyr)
library(hexbin)
library(reshape2)
library(ggrepel)
library(stringr)
mainDir_results<- paste("F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/",sep="")
setwd("F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/")

file_csv <- "F:/MasseyOffice1/Research/R-Script2019/analisis_PROBA_S1/analysis_area_v3.csv"
charts.data = as.data.frame(read.csv(file_csv, header = TRUE))
charts.data$tgl <- as.Date(substr(charts.data$period,2,20),"%Y-%m-%d")
charts.data$tanggal <- format(charts.data$tgl,"%Y-%m-%d")
charts.data$kabkec <- paste0(charts.data$KABUPATEN,"/ ",charts.data$KECAMATAN)
charts.data$kabkec2 <- paste0(charts.data$KABUPATEN,"-",charts.data$KECAMATAN)

fill <- c("#40b8d0", "#b2d183")

charts.data.regency <-charts.data %>% 
  select(KABUPATEN, tanggal, BL, VEG, REPRO, RIPE, Paddy_planting, Paddy_harvested) %>%
    group_by(KABUPATEN, tanggal) %>%
      summarise(BL = sum(BL),VEG = sum(VEG),REPRO = sum(REPRO),RIPE = sum(RIPE),
                Paddy_planting = sum(Paddy_planting),Paddy_harvested = sum(Paddy_harvested))

charts.data.regency.plot <- melt(charts.data.regency)
charts.data.regency.plot[] <- lapply(charts.data.regency.plot, function(x) if(is.factor(x)) factor(x) else x)
charts.data.regency.plot$date <- as.Date(charts.data.regency.plot$tanggal)
str(charts.data.regency.plot)
p0 <- ggplot(data = charts.data.regency.plot, 
       mapping = aes(x = date, y = value, color = variable)) +
  geom_line() +
  facet_wrap(vars(KABUPATEN),  ncol=1) +
  scale_x_date()+
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank(),axis.text.x = element_text(angle = 90, hjust = 1)) 

p0

charts.data.regency1 <-charts.data %>% 
  select(KABUPATEN, tanggal, BL, VEG, REPRO, RIPE) %>%
  group_by(KABUPATEN, tanggal) %>%
  summarise(BL = sum(BL),VEG = sum(VEG),REPRO = sum(REPRO),RIPE = sum(RIPE))

charts.data.regency.plot1 <- melt(charts.data.regency1)
charts.data.regency.plot1$date <- as.Date(charts.data.regency.plot1$tanggal)

cols_Phase <- c("BL" = "#804000", "VEG" = "#66cc00","REPRO" = "#336600", "RIPE" = "#ffcc00")


p1 <- ggplot(data = charts.data.regency.plot1, 
             mapping = aes(x = date, y = value, color = variable)) +
  geom_line(size=0.75) +
  xlab("Date") +
  ylab("Area (ha)") + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_date(labels = date_format("%m-%Y"),date_breaks = "1 month") +
  facet_wrap(vars(KABUPATEN),  ncol=1) +
  theme_bw() + 
  scale_colour_manual(name="Legend", values = cols_Phase,breaks=c("BL","VEG","REPRO","RIPE"),labels = c("Bare land","Vegetative","Reproductive","Ripening")) +
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank(),axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
      panel.background = element_blank() ,legend.position = "bottom",legend.box.margin=margin(c(3,3,3,3)),
      axis.title.x = element_text(margin = unit(c(3, 0, 0, 0), "mm")))    

ggsave(filename="RS_regency1.png", plot=p1, device="png",
       height=7, width=7, units="in", dpi=600)

cols_Phase2 <- c("Paddy_planting" = "#eb3528", "VEG" = "#66cc00","Paddy_harvested" = "#e128eb", "RIPE" = "#ffcc00")

charts.data.regency2 <-charts.data %>% 
  select(KABUPATEN, tanggal, BL, VEG, RIPE, Paddy_planting, Paddy_harvested) %>%
  group_by(KABUPATEN, tanggal) %>%
  summarise(VEG = sum(VEG),RIPE = sum(RIPE),
            Paddy_planting = sum(Paddy_planting),Paddy_harvested = sum(Paddy_harvested))
charts.data.regency.plot2 <- melt(charts.data.regency2)
charts.data.regency.plot2$date <- as.Date(charts.data.regency.plot1$tanggal)

p2 <- ggplot(data = charts.data.regency.plot2, 
             mapping = aes(x = date, y = value, color = variable)) +
  geom_line(size=0.75) +
  xlab("Date") +
  ylab("Area (ha)") + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_date(labels = date_format("%m-%Y"),date_breaks = "1 month") +
  facet_wrap(vars(KABUPATEN),  ncol=1) +
  theme_bw() + 
  scale_colour_manual(name="Legend", values = cols_Phase2,breaks=c("Paddy_planting","VEG","Paddy_harvested","RIPE"),labels = c("Paddy planting","Vegetative","Paddy harvested","Ripening")) +
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank(),axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank() ,legend.position = "bottom",legend.box.margin=margin(c(3,3,3,3)),
        axis.title.x = element_text(margin = unit(c(3, 0, 0, 0), "mm")))    

p2 

ggsave(filename="RS_regency2.png", plot=p2, device="png",
       height=7, width=7, units="in", dpi=600)


charts.data_SD <- filter(charts.data, area_RS > 5000)
table(unique(charts.data_SD$kabkec))
charts.data.regency3 <-charts.data_SD %>% 
  select(kabkec, tanggal, BL, VEG, REPRO, RIPE) %>%
  group_by(kabkec, tanggal) %>%
  summarise(BL = sum(BL),VEG = sum(VEG),REPRO = sum(REPRO),RIPE = sum(RIPE))

charts.data.regency.plot3 <- melt(charts.data.regency3)
charts.data.regency.plot3$date <- as.Date(charts.data.regency.plot3$tanggal)

cols_Phase <- c("BL" = "#804000", "VEG" = "#66cc00","REPRO" = "#336600", "RIPE" = "#ffcc00")


p3 <- ggplot(data = charts.data.regency.plot3, 
             mapping = aes(x = date, y = value, color = variable)) +
  geom_line(size=0.75) +
  xlab("Date") +
  ylab("Area (ha)") + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_date(labels = date_format("%m-%Y"),date_breaks = "1 month") +
  facet_wrap(vars(kabkec),  ncol=3) +
  theme_bw() + 
  scale_colour_manual(name="Legend", values = cols_Phase,breaks=c("BL","VEG","REPRO","RIPE"),labels = c("Bare land","Vegetative","Reproductive","Ripening")) +
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank(),axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank() ,legend.position = "bottom",legend.box.margin=margin(c(3,3,3,3)),
        axis.title.x = element_text(margin = unit(c(3, 0, 0, 0), "mm")))    

p3
ggsave(filename="RS_SD1.png", plot=p3, device="png",
       height=12, width=8, units="in", dpi=600)


cols_Phase2 <- c("Paddy_planting" = "#eb3528", "VEG" = "#66cc00","Paddy_harvested" = "#e128eb", "RIPE" = "#ffcc00")

charts.data_SD <- filter(charts.data, area_RS > 5000)
charts.data.regency4 <-charts.data_SD %>% 
  select(kabkec, tanggal, VEG, RIPE, Paddy_planting, Paddy_harvested) %>%
  group_by(kabkec, tanggal) %>%
  summarise(VEG = sum(VEG),RIPE = sum(RIPE),
            Paddy_planting = sum(Paddy_planting),Paddy_harvested = sum(Paddy_harvested))
charts.data.regency.plot4 <- melt(charts.data.regency4)
charts.data.regency.plot4$date <- as.Date(charts.data.regency.plot4$tanggal)

p4 <- ggplot(data = charts.data.regency.plot4, 
             mapping = aes(x = date, y = value, color = variable)) +
  geom_line(size=0.75) +
  xlab("Date") +
  ylab("Area (ha)") + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_date(labels = date_format("%m-%Y"),date_breaks = "1 month") +
  facet_wrap(vars(kabkec),  ncol=3) +
  theme_bw() + 
  scale_colour_manual(name="Legend", values = cols_Phase2,breaks=c("Paddy_planting","VEG","Paddy_harvested","RIPE"),labels = c("Paddy planting","Vegetative","Paddy harvested","Ripening")) +
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank(),axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank() ,legend.position = "bottom",legend.box.margin=margin(c(3,3,3,3)),
        axis.title.x = element_text(margin = unit(c(3, 0, 0, 0), "mm")))    

p4 

ggsave(filename="RS_SD2.png", plot=p4, device="png",
       height=12, width=8, units="in", dpi=600)

listkabkec <- unique(charts.data$kabkec)
listkabkec2 <- unique(charts.data$kabkec2)

for (i in 1:length(listkabkec)) {
  kabkec_current <- listkabkec[i]
  kabkec2_current <- listkabkec2[i]
  charts.data_SD <- filter(charts.data, kabkec2 == kabkec2_current)
  print(kabkec2_current)
  charts.data_SD_plot1 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"VEGETATIVE-RIPENING","VEG",charts.data_SD$VEG)
  charts.data_SD_plot2 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"VEGETATIVE-RIPENING","RIPE",charts.data_SD$RIPE)
  charts.data_SD_plot3 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"RIPENING-HARVESTED","RIPE",charts.data_SD$RIPE)
  charts.data_SD_plot4 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"RIPENING-HARVESTED","Paddy_harvested",charts.data_SD$Paddy_harvested)
  charts.data_SD_plot5 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"PLANTING-HARVESTED","Paddy_planting",charts.data_SD$Paddy_planting)
  charts.data_SD_plot6 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"PLANTING-HARVESTED","Paddy_harvested",charts.data_SD$Paddy_harvested)
  charts.data_SD_plot7 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"VEGETATIVE-PLANTING","VEG",charts.data_SD$VEG)
  charts.data_SD_plot8 <- cbind(charts.data_SD$kabkec,charts.data_SD$tanggal,"VEGETATIVE-PLANTING","Paddy_planting",charts.data_SD$Paddy_planting)
  
  charts.data_SD_plot <- as.data.frame(rbind(charts.data_SD_plot1,charts.data_SD_plot2,charts.data_SD_plot3,charts.data_SD_plot4,
                               charts.data_SD_plot5,charts.data_SD_plot6,charts.data_SD_plot7,charts.data_SD_plot8),stringsAsFactors = FALSE) 
  names(charts.data_SD_plot)[1] <- "kabkec"
  names(charts.data_SD_plot)[2] <- "tanggal"
  names(charts.data_SD_plot)[3] <- "typedata"
  names(charts.data_SD_plot)[4] <- "variable"
  names(charts.data_SD_plot)[5] <- "value"
  charts.data_SD_plot$date <- as.Date(charts.data_SD_plot$tanggal)
  charts.data_SD_plot$value <- as.numeric(charts.data_SD_plot$value)

  p5 <- ggplot(data = charts.data_SD_plot, 
               mapping = aes(x = date, y = value, color = variable)) +
    geom_line(size=0.75) +
    xlab("Date") +
    ylab("Area (ha)") +
    ggtitle(paste0("Comparison of remote-sensed data with local statistics on ",str_to_title(kabkec_current))) +
    scale_y_continuous(labels = scales::comma) +
    scale_x_date(labels = date_format("%m-%Y"),date_breaks = "1 month") +
    facet_wrap(vars(typedata),  ncol=2) +
    theme_bw() + 
    scale_colour_manual(name="Legend", values = cols_Phase2,breaks=c("Paddy_planting","VEG","Paddy_harvested","RIPE"),labels = c("Paddy planting","Vegetative","Paddy harvested","Ripening")) +
    theme(legend.position="bottom", legend.direction="horizontal",
          legend.title = element_blank(),axis.text.x = element_text(angle = 90, hjust = 1)) +
    theme(plot.title = element_text(hjust = 0.5),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank() ,legend.position = "bottom",legend.box.margin=margin(c(3,3,3,3)),
          axis.title.x = element_text(margin = unit(c(3, 0, 0, 0), "mm")))    
  
  #p5 
  
  ggsave(filename=paste0("sd/RS_SD_",kabkec2_current,".png"), plot=p5, device="png",
         height=6, width=8, units="in", dpi=600)

}

