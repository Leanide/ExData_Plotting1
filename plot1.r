setwd("C:/rprogramming/household")

## Getting and subsetting data
dataset <- read.table("household_power_consumption.txt",
                       header = TRUE, sep = ";", na.strings = "?")
					   
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")	
data <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")

## Making plot to png-file
png(file = "plot1.png")
hist(data$Global_active_power, col = "red", breaks = 12,
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()	 