data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)
#subset the data for desired dates ()
subdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), c(1,2,7,8,9)]

dateFormat <- strptime((paste(subdata$Date, subdata$Time)), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(dateFormat, subdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "s")
lines(dateFormat, subdata$Sub_metering_2, col = "red") 
lines(dateFormat, subdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)

dev.off()