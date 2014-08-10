## Downloading data
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destino <- "household_power_consumption.zip"

download.file(url,destino)

sourcefile <- unz(destino, "household_power_consumption.txt")

data <- read.table(sourcefile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Subsetting the data
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

## Converting dates
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Loading date in memory
DataFile <- "data.csv"

write.csv(data, DataFile)

## Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()
