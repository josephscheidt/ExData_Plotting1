##This script requires the dataset be present in the working directory.

##read in data

datafile <- "household_power_consumption.txt"
powerData <- read.table(datafile, skip = 66637, nrows = 2880, sep = ";")
names(powerData) <- unname(unlist(read.table(datafile, nrows = 1, sep = ";")))

powerData$timestamp <- strptime(with(powerData, paste(Date, Time)),
                                format = "%d/%m/%Y %H:%M:%S")

##construct plot2 as png file (width and height of 480 are default)

png(file = "plot2.png")
with(powerData, plot(timestamp, Global_active_power, type = "n", xlab = "", 
                     ylab = "Global Active Power (kilowatts)"))
with(powerData, lines(timestamp, Global_active_power))
dev.off()
