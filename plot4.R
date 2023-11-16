#Plot 4 

library(dplyr)
library(datasets)

# read in file
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# subset to relevant dates
d<-data %>%
    filter(Date == "1/2/2007" | Date== "2/2/2007")
d$DateTime <- strptime(paste(d$Date,d$Time),"%d/%m/%Y %H:%M:%S")

#Convert gap to numeric
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))

#Create panel set up
par(mfrow=c(2,2))
with(d, {
    
    # Global active power
    plot(d$DateTime, d$Global_active_power,
         type="l", 
         ylab="Global Active Power (kilowatts)",xlab="",
         xaxt="n")
    wday<-as.POSIXct(round(range(d$DateTime),"days"))
    axis.POSIXct(1, at=seq(wday[1],wday[2], by="days"),format="%a")

    # Voltage
    plot(d$DateTime, d$Voltage,type="l", ylab="Voltage",xlab="datetime", xaxt="n")
    wday<-as.POSIXct(round(range(d$DateTime),"days"))
    axis.POSIXct(1, at=seq(wday[1],wday[2], by="days"),format="%a")

        #Energy submetering
    plot(d$DateTime, d$Sub_metering_1,type="l", ylab="Energy sub metering",
      xlab="", col="black", xaxt="n")
    lines(d$DateTime,d$Sub_metering_2,type="l",col="red")
    lines(d$DateTime,d$Sub_metering_3,type="l",col="blue")
    legend("topright", 
        c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty=1,
        lwd=3,
        col=c("black", "red", "blue"))
    wday<-as.POSIXct(round(range(d$DateTime),"days"))
    axis.POSIXct(1, at=seq(wday[1],wday[2], by="days"),format="%a")
    
    #Global reactive power
    plot(d$DateTime, d$Global_reactive_power,type="l", 
          ylab="Global_reactive_power", xlab="datetime", xaxt="n")
    wday<-as.POSIXct(round(range(d$DateTime),"days"))
    axis.POSIXct(1, at=seq(wday[1],wday[2], by="days"),format="%a")
 })

#export to png file and close device
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
