

# rm(list=ls())


library(sqldf)
library(readr)

#Load only Feb 1 and 2
data_hpc <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
# write.csv(data_hpc, "test.txt")
# str(data_hpc)


# Plot 2
#Convert Date and time
DateAndTime <- paste(as.Date(data_hpc$Date, format = "%d/%m/%Y"), data_hpc$Time)
data_hpc$DateTime <- as.POSIXct(DateAndTime)


with(data_hpc, plot(Global_active_power ~ DateTime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "Plot2.png")
dev.off()





