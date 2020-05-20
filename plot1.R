

# rm(list=ls())
# getwd()

library(sqldf)
library(readr)

#Load File
data_hpc <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
# write.csv(data_hpc, "test.txt")
# str(data_hpc)

# Plot 1 
hist(data_hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file = "Plot1.png")
dev.off()




