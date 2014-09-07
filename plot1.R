##load required libraries if need be
library(data.table)

##get text
txt<-file("exdata-data-household_power_consumption/household_power_consumption.txt","r");

##read.table into our sample data 'sData', using grep function to only fetch required rows on required dates
sData<-read.table(text = grep("^[1,2]/2/2007|^Date",readLines(txt),value=TRUE), header=TRUE, sep=";", na.strings="?")

##Special thanks to Rene Shiou-Ling Wang (https://class.coursera.org/exdata-006/forum/profile?user_id=1917427) for this
##suggestion!

##plot for Global Active Power on those days
hist(sData$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

##Copy to PNG
dev.copy(png, file="plot1.png")
dev.off()
