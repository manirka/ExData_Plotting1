# load data
hpc <- read.csv("./household_power_consumption.txt", sep=";")

# filter by date
consumption <- hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'), ]

# format columns
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))

# plot histogram to png
png("plot1.png")

hist(consumption$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0, 1200),
     main = "Global Active Power",
     col = "red")

dev.off()

