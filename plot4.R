# load data
hpc <- read.csv("./household_power_consumption.txt", sep=";")

# filter by date
consumption <- hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'), ]

# format columns
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
consumption$Voltage <- as.numeric(as.character(consumption$Voltage))
consumption$Global_reactive_power <- as.numeric(as.character(consumption$Global_reactive_power))
consumption$Sub_metering_1 <- as.numeric(as.character(consumption$Sub_metering_1))
consumption$Sub_metering_2 <- as.numeric(as.character(consumption$Sub_metering_2))
consumption$Sub_metering_3 <- as.numeric(as.character(consumption$Sub_metering_3))
consumption$Datetime <- strptime(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")

# plot histogram to png
png("plot4.png")

par (mfrow = c (2, 2), mar = c (4, 4, 2, 1))

plot(consumption$Datetime, consumption$Global_active_power, 
     type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(consumption$Datetime, consumption$Voltage, 
     type="l", xlab = "datetime",
     ylab = "Voltage")

plot(consumption$Datetime, consumption$Sub_metering_1, 
     type="l", xlab = "",
     ylab = "Energy sub metering")
lines(consumption$Datetime, consumption$Sub_metering_2, col = "red")
lines(consumption$Datetime, consumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n")

plot(consumption$Datetime, consumption$Global_reactive_power, 
     type="l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()

