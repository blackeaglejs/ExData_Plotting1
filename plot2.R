## This script assumes that you are already in your working directory.
## This script reads the data into R and then subsets it, then creates the plot. 

## Reads the data in. 
electricdata <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep=";", nrows=2075259)
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

## Subsets the data with the date. 
edfebruary <- subset(electricdata, electricdata$Date == "2007-02-01" | electricdata$Date == "2007-02-02")

## Combine the date and time into a single variable. 
edfebruary$combinedDT <- with(edfebruary, as.POSIXct(paste(Date,Time)), format="%Y-%m-%d %T")

## Create the plot.
png(filename="plot2.png", width = 480, height = 480)
with(edfebruary, plot(Global_active_power ~ combinedDT,
                      xlab="",
                      ylab="Global Active Power (kilowatts)",
                      type="l"))
dev.off()