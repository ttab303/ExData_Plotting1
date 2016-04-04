

data <- read.csv("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

util  <- subset(data, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(data)

hist(util$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
