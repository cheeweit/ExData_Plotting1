library(data.table)

## Getting full dataset
dt<-fread("C:/Users/cheeweit/Desktop/Data Science/household_power_consumption.txt", na.strings="?")

## Converting dates
dt$strDate <- as.Date(dt$Date,"%d/%m/%Y")

## Filtering data
dt.filter<-dt[dt$strDate=="2007-02-01" | dt$strDate=="2007-02-02",]

dt.filter$Global_active_power<-as.numeric(dt.filter$Global_active_power)

## Constructing plot & save
png(filename="plot1.png", width=480, height=480)

hist(dt.filter$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.off()

#data$Date <- as.Date(data$Date, format="%d/%m/%y")
#data$Time <- strptime(data$Time, format="%H:%M:%S")