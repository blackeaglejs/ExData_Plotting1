## This script assumes that you are already in your working directory.
## You should also have run the DownloadData.R script to get the data.
## This script reads the data into R and then subsets it. 

## Reads the data in. 
electricdata <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep=";", nrows=2075259)
electricdata$Date <- as.Date(electricdata$Date, format="%d/%m/%Y")

## Subsets the data with the date. 
edfebruary <- subset(electricdata, electricdata$Date == "2007-02-01" | electricdata$Date == "2007-02-02")

## Create the plot.
png(filename="plot1.png", width = 480, height = 480)
hist(edfebruary$Global_active_power, 
     col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()