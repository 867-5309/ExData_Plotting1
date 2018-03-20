#reading data from source (txt file)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)

#subsetting the data for desired dates (1/2/2007 - 2/2/2007)
subdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), c(1,2,3)]

#formating date with strptime() from character to POSIXlt
dateFormat <- strptime((paste(subdata$Date, subdata$Time)), format = "%d/%m/%Y %H:%M:%S")

#opening graphics device png
png("plot2.png", width = 480, height = 480)
#plotting data with scatterplot
plot(dateFormat, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "s")
#closing the graphics device
dev.off()