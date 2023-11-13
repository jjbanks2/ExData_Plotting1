#Plot 1 - Global Active Power
library(dplyr)

#data<-read.table("household_power_consumption.txt", sep=";", na.strings="?")


#not working, still in char class
#data[['V2']]<-as.POSIXlt(data[['V2']], format="%H:%M:%S")
#data[['V2']]<-format(as.POSIXlt(data[['V2']]), format="%H:%M:%S")

#Convert date column to date format
data[['V1']]<-as.Date(data[['V1']], format="%d/%m/%Y")
d1<-data %>%
    filter(data$V1 == "2007-02-01" | data$V1=="2007-02-02")
colnames(d1)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global-intensity", "Sub-metering_1",
                 "Sub_metering_2", "Sub_metering_3")
