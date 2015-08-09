library(data.table)
library(lubridate)

## Getting full dataset
dt<-fread("C:/Users/cheeweit/Desktop/Data Science/household_power_consumption.txt", na.strings="?")

## Converting dates
dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")

## Filtering data
dt.filter<-dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]

dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)

dt.filter$DateTime <- as.POSIXct(paste(dt.filter$Date, dt.filter$Time, sep=" "), 
                                 format="%Y-%m-%d %H:%M:%S")

## Constructing plot & save
png(filename="plot2.png", width=480, height=480)

plot(dt.filter$DateTime, dt.filter$Global_active_power, typ='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

#data$Date <- as.Date(data$Date, format="%d/%m/%y")
#data$Time <- strptime(data$Time, format="%H:%M:%S")
