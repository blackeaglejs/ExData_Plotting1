## This code will download the file, and unzip the data.

## Set the working directory to the forked repository. You will need to edit this to whatever your working directory is.
setwd("~/dev/datasciencecoursera/ExData_Plotting1/")

## Download the file. Warning - this will take time if you have a 
## slow internet connection. 

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="electricpowerdata.zip", method = "curl")

unzip("electricpowerdata.zip")

## We need the file name downloaded file for the next series of scripts.
## Please note that this command is dependent on the text file for the data
## being the only text file in the repository. 
filename <- list.Files("*.txt")