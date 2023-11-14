#plot2.R

#library(dplyr)
#library(datasets)

# read in file
#d<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# subset to relevant dates
#d<-d %>%
#    filter(Date == "1/2/2007" | Date== "2/2/2007")

#Create new date-time column, combining first two columns
#d$DateTime<-strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

#Convert date column to date format
#d[['Date']]<-as.Date(d[['Date']], format="%d/%m/%Y")



with(d, plot(DateTime, Global_active_power, 
             xlab="",
             ylab="Global Active Power (kilowatts)", 
             type="l"))


