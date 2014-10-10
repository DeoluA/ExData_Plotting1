initial <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=100)
classes <- sapply(initial, class)

##get the data, only fetching rows on required dates
sData <- subset(read.table("exdata-data-household_power_consumption/household_power_consumption.txt", colClasses = classes, comment.char="", header=TRUE, sep=";", na.strings="?"), (Date == "1/2/2007" | Date == "2/2/2007"))

##Convert 'Date' and 'Time' variables from factors to 'Date' and 'Time' formats respectively
sData$Date<-as.Date(sData$Date, format = "%d/%m/%Y")
sData$Time<-strptime(paste(sData$Date,sData$Time), "%Y-%m-%d %H:%M:%S", tz="UTC")

##################
##make required plots

par(mfrow=c(2,2),"bg"="white")
with(sData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(sData, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(sData, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(sData, lines(Time, Sub_metering_2, col = "red"))
with(sData, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, lwd=0.5, bty="n", cex=0.5)
with(sData, plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

##Copy to PNG
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()