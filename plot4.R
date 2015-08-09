## This script assumes that you are already in your working directory.
## This script reads the data into R and then subsets it, then creates the plot. 

## Reads the data in. 
electricdata <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep=";", nrows=2075259)
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

## Subsets the data with the date. 
edfebruary <- subset(electricdata, electricdata$Date == "2007-02-01" | electricdata$Date == "2007-02-02")

## Combine the date and time into a single variable. 
edfebruary$datetime <- with(edfebruary, as.POSIXct(paste(Date,Time)), format="%Y-%m-%d %T")

## Create the plots.
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(edfebruary,
     {
           plot(Global_active_power ~ datetime,xlab = "",ylab = "Global Active Power",type = "l")
           plot(Voltage ~ datetime, type="l")
           plot(Sub_metering_1 ~ datetime,xlab = "",ylab = "Energy sub metering",type = "l")
           lines(Sub_metering_2 ~ datetime, type = "l", col = "red")
           lines(Sub_metering_3 ~ datetime, type = "l", col = "blue")
           legend("topright", col=c("black","red","blue"),lty=1, bty = "n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
           plot(Global_reactive_power~datetime,type="l")
     })
dev.off()