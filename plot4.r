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

## Making plots to png-file
png(file = "plot4.png")

par(mfrow = c(2,2))
with(data, {

##plot1
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##plot2
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##plot3
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot4
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
		
})		
dev.off()
## days of the week (Thu, Fri, Sat) on the x-axis automatically displayed in russian language	 