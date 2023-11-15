#plot2.R

library(dplyr)
library(datasets)

# read in file
d<-read.table("household_power_consumption.txt", sep=";", header=TRUE, 
 na.strings="?")

# subset to relevant dates
d<-d %>%
    filter(Date == "1/2/2007" | Date== "2/2/2007")


d$DateTime <- strptime(paste(d$Date,d$Time),"%d/%m/%Y %H:%M:%S")

#Convert date column to date format
#d[['Date']]<-as.Date(d[['Date']], format="%d/%m/%Y")

with(d, plot(d$DateTime, d$Global_active_power,type="l",
      ylab="Global Active Power (kilowatts)",xlab=""))

#export to png file and close device
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()