#read data from source txt file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)
#subset the data for desired dates ()
subdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),3]

png("plot1.png", width = 480, height = 480)

hist(subdata, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()