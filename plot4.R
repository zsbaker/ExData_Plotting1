

# rm(list=ls())


library(sqldf)
library(readr)

#Load only Feb 1 and 2
data_hpc <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
# write.csv(data_hpc, "test.txt")
# str(data_hpc)

#Convert Date and time
DateAndTime <- paste(as.Date(data_hpc$Date, format = "%d/%m/%Y"), data_hpc$Time)
data_hpc$DateTime <- as.POSIXct(DateAndTime)

par(mfrow = c(2,2))

#Topleft - Plot 2
with(data_hpc, plot(Global_active_power ~ DateTime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#Topleft - Plot New
with(data_hpc, plot(Voltage ~ DateTime, type="l", xlab = "datetime", ylab = "Voltage"))


#bottom left -  Plot 3
with(data_hpc, plot(DateTime, Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub metering"))
with(subset(data_hpc, Sub_metering_1 > -2), points(DateTime, Sub_metering_1, col = "black", type = "l"))
with(subset(data_hpc, Sub_metering_2 > -2), points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(subset(data_hpc, Sub_metering_3 > -2), points(DateTime, Sub_metering_3, col = "blue", type = "l"))
op <- par(cex = 0.65)
legend("topright", bty = "n", lwd = 2, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Plot 4
op <- par(cex = 0.75)
with(data_hpc, plot(Global_reactive_power ~ DateTime, type="l", xlab = "datetime"))


dev.copy(png, file = "Plot4.png")
dev.off()
