#reading data from source (txt file)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)

#subsetting the data for desired dates (1/2/2007 - 2/2/2007)
subdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), c(1,2,7,8,9)]

#formating date with strptime() from character to POSIXlt
dateFormat <- strptime((paste(subdata$Date, subdata$Time)), format = "%d/%m/%Y %H:%M:%S")

#opening graphics device png
png("plot3.png", width = 480, height = 480)

#plotting scatterplot with three variables
plot(dateFormat, subdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "s")
#adding second variable
lines(dateFormat, subdata$Sub_metering_2, col = "red") 
#adding third variable
lines(dateFormat, subdata$Sub_metering_3, col = "blue")
#adding legend to the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)

#closing the graphics device
dev.off()