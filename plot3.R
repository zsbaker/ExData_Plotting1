

# rm(list=ls())


library(sqldf)
library(readr)

#Load only Feb 1 and 2
data_hpc <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
# write.csv(data_hpc, "test.txt")
# str(data_hpc)


# Plot 3
#Convert Date and time
DateAndTime <- paste(as.Date(data_hpc$Date, format = "%d/%m/%Y"), data_hpc$Time)
data_hpc$DateTime <- as.POSIXct(DateAndTime)



with(data_hpc, plot(DateTime, Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub metering"))

with(subset(data_hpc, Sub_metering_1 > -2), points(DateTime, Sub_metering_1, col = "black", type = "l"))
with(subset(data_hpc, Sub_metering_2 > -2), points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(subset(data_hpc, Sub_metering_3 > -2), points(DateTime, Sub_metering_3, col = "blue", type = "l"))


legend("topright", lwd = 2, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "Plot3.png")
dev.off()


