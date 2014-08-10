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

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
