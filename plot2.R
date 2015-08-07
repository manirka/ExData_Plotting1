# load data
hpc <- read.csv("./household_power_consumption.txt", sep=";")

# filter by date
consumption <- hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'), ]

# format columns
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
consumption$Datetime <- strptime(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")

# plot histogram to png
png("plot2.png")

plot(consumption$Datetime, consumption$Global_active_power, 
     type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

