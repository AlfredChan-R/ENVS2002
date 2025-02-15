library(fortunes)
fortune(375)
getwd()
setwd("C:/Users/ENVS2002/data/chapter2")
getwd()

library(readr)
annualmean_river_hk_2021<-read_csv("annualmean_rivers_hk_2021.csv")
View(annualmean_river_hk_2021)
river_data<-annualmean_river_hk_2021
str(river_data)
subset_river1<-river_data[,1]
subset_river2<-river_data[1,]
subset_river3<-river_data[,-1]
subset_river4<-river_data[-1,]
subset_river5<-river_data[,1:3]
subset_riverDO<-river_data[,c("river","DO")]

deepbay_rivers<-subset(river_data, zone == "Deep Bay")
db_th_rivers<-subset(river_data, zone == "Deep Bay"|zone == "Tolo Harbour")
mean(river_data$DO)
mean(river_data$DO,na.rm=T)
library(Rmisc)
library(lattice)
library(plyr)
summarized_rivers<-summarySE(data=river_data,measurevar="DO")
summarized_rivers_zone<-summarySE(data=river_data,measurevar="DO",groupvars="zone")
plot(river_data$DO, river_data$ecoli)
boxplot(river_data$DO~river_data$zone)
library(ggplot2)
p<-ggplot(summarized_rivers_zone, aes(x=zone, y=DO))+
    geom_bar(stat="identity")+
    geom_errorbar(aes(ymin=DO-se, ymax=DO+se))
p
