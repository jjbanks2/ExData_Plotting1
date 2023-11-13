#Plot 1 - Global Active Power

library(dplyr)
library(datasets)

# read in file
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# subset to relevant dates
data<-data %>%
    filter(Date == "1/2/2007" | Date== "2/2/2007")

#draw hist to screen
hist(data$Global_active_power, xlab='Global Active Power (kilowatts)', 
     ylab='Frequency', main="Global Active Power", col=2)

#export to png file and close device
dev.copy(png, file="plot1.png")
dev.off()
