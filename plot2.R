data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)
#subset the data for desired dates ()
subdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), c(1,2,3)]

dateFormat <- strptime((paste(subdata$Date, subdata$Time)), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(dateFormat, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "s")

dev.off()