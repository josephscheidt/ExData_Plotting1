##This script requires the dataset be present in the working directory.

##read in data

datafile <- "household_power_consumption.txt"
powerData <- read.table(datafile, skip = 66637, nrows = 2880, sep = ";")
names(powerData) <- unname(unlist(read.table(datafile, nrows = 1, sep = ";")))

powerData$timestamp <- strptime(with(powerData, paste(Date, Time)),
                                format = "%d/%m/%Y %H:%M:%S")


##construct plot4 as png file (width and height of 480 are default)

png(file = "plot4.png")
##set parameters for 2x2 array of plots
par(mfrow = c(2,2))

##first plot
with(powerData, plot(timestamp, Global_active_power, type = "n", xlab = "", 
                     ylab = "Global Active Power"))
with(powerData, lines(timestamp, Global_active_power))

##second plot
with(powerData, plot(timestamp, Voltage, type = "n", xlab = "datetime",
                     ylab = "Voltage"))
with(powerData, lines(timestamp, Voltage))

##third plot
with(powerData, plot(timestamp, Sub_metering_1, type = "n", xlab = "", 
                     ylab = "Energy sub metering"))
with(powerData, lines(timestamp, Sub_metering_1))
with(powerData, lines(timestamp, Sub_metering_2, col = "red"))
with(powerData, lines(timestamp, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##fourth plot
with(powerData, plot(timestamp, Global_reactive_power, type = "n", 
                     xlab = "datetime"))
with(powerData, lines(timestamp, Global_reactive_power))
dev.off()
