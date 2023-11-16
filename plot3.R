#Plot 3 - Energy sub metering

library(dplyr)
library(datasets)

# read in file
#data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# subset to relevant dates
#d<-data %>%
#    filter(Date == "1/2/2007" | Date== "2/2/2007")
d$DateTime <- strptime(paste(d$Date,d$Time),"%d/%m/%Y %H:%M:%S")
#d<-data.frame(d$Sub_metering_1, d$Sub_metering_2, d$Sub_metering_3, d$DateTime)

#Create plot with 3 separate lines and legend
plot(d$DateTime, d$Sub_metering_1,type="l",
              ylab="Energy sub metering",
              xlab="", col="black")
lines(d$DateTime,d$Sub_metering_2,type="l",col="red")
lines(d$DateTime,d$Sub_metering_3,type="l",col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,
       lwd=2.5,
       col=c("black", "red", "blue")) 


#export to png file and close device
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
