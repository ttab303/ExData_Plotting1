
data <- read.csv("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

util  <- subset(data, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(data)

datetime <- paste(as.Date(util$Date), util$Time)
util$Datetime <- as.POSIXct(datetime)

with(util,plot(Sub_metering_1 ~ Datetime, ylab="Energy sub metering", xlab="", type="l"))

with(util,lines(Sub_metering_2~Datetime,col="Red"))

with(util,lines(Sub_metering_3 ~ Datetime, col="Blue"))
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=1, cex = 0.6)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
