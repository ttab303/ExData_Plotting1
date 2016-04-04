
data <- read.csv("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

util  <- subset(data, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(data)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(util, plot(Global_active_power ~ Datetime, ylab="Global Active Power", type="l", xlab=""))

with(util, plot(Voltage ~ Datetime, ylab="Voltage", type="l", xlab="datetime"))

with(util, plot(Sub_metering_1 ~ Datetime, ylab="Engergy sub metering", xlab="", type="l"))
with(util, lines(Sub_metering_2 ~ Datetime, col="Red"))

with(util, lines(Sub_metering_3 ~ Datetime, col="Blue"))
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=1, cex = 0.6)

with(util, plot(Global_reactive_power ~ Datetime, type="l", ylab="Global Reactive Power", xlab="datetime"))
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
