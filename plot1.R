#reading data from source (txt file)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)

#subsetting the data for desired dates (1/2/2007 - 2/2/2007)
subdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),3]

#opening graphics device png
png("plot1.png", width = 480, height = 480)
#plotting histogram
hist(subdata, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#closing graphics device
dev.off()