initial <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100)

classes <- sapply(initial, class)

##get the data, only fetching rows on required dates
sData <- subset(read.table("exdata-data-household_power_consumption/household_power_consumption.txt", colClasses = classes, comment.char="", header=TRUE, sep=";", na.strings="?"), (Date == "1/2/2007" | Date == "2/2/2007"))

##Convert 'Date' and 'Time' variables from factors to 'Date' and 'Time' formats respectively
sData$Date<-as.Date(sData$Date, format = "%d/%m/%Y")
sData$Time<-strptime(paste(sData$Date,sData$Time), "%Y-%m-%d %H:%M:%S", tz="UTC")

##################
##plot for Global Active Power against Time on those days
with(sData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

##Copy to PNG
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()