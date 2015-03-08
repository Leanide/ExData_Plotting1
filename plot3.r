setwd("C:/rprogramming/household")

## Getting data
dataset <- read.table("household_power_consumption.txt",
                       header = TRUE, sep = ";", na.strings = "?")

## Subsetting data and convert Date-Time					   
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
data <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")
dates <- as.character(data$Date)
times <- as.character(data$Time)
x <- paste(dates, times, "MSK")
data$Time <- as.POSIXlt(x, "GMT")

## Making plot to png-file
png(file = "plot3.png")

plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
		
dev.off()
## days of the week (Thu, Fri, Sat) on the x-axis automatically displayed in russian language	 