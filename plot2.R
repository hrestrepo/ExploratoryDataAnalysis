
par(mfrow=c(1,1))
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="transparent")
plot(x = data$DateTime, y = data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()