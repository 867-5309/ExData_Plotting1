#reading data from source (txt file)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)

#subsetting the data for desired dates (1/2/2007 - 2/2/2007)
subdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

#formating date with strptime() from character to POSIXlt
dateFormat <- strptime((paste(subdata$Date, subdata$Time)), format = "%d/%m/%Y %H:%M:%S")

#opening graphics device png
png("plot4.png", width = 480, height = 480)

#setting the parameters for plotting; 2 rows and 2 columns
par(mfcol = c(2,2))

#first plot (top left)
plot(dateFormat, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "s")

#second plot (bottom left)
plot(dateFormat, subdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "s")
lines(dateFormat, subdata$Sub_metering_2, col = "red") 
lines(dateFormat, subdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, bty = "n")

#third plot (top right)
plot(dateFormat, subdata$Voltage, xlab = "datetime", ylab = "Voltage", type = "s")

#fourth plot (bottom right)
plot(dateFormat, subdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "s")

#closing the graphics device
dev.off()