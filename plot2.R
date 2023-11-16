#plot2.R

library(dplyr)
library(datasets)

# read in file
d<-read.table("household_power_consumption.txt", sep=";", header=TRUE, 
    na.strings="?")

# subset to relevant dates
d<-d %>%
    filter(Date == "1/2/2007" | Date== "2/2/2007")


#Convert gap to numeric
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))

#Combine date and time columns
d$DateTime<-strptime(paste(d$Date,d$Time),"%d/%m/%Y %H:%M:%S")

#Draw plot w/lines and no tick mark labels
with(d, plot(d$DateTime, d$Global_active_power,
            type="l",
            ylab="Global Active Power (kilowatts)",xlab="",
            xaxt="n"))

#Create and apply weekday labels
wday<-as.POSIXct(round(range(d$DateTime),"days"))
axis.POSIXct(1, at=seq(wday[1],wday[2], by="days"),format="%a")

#export to png file and close device
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

