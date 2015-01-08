###########################################################
# PLOT 2
###########################################################
# Set working directory (please change it before running this script)
setwd("Z:/Coursera/Data Science/04 - Exploratory Data Analysis/Week 1/Assignment 1")

# Reading data and keeping data those are required 
data <- read.csv2("household_power_consumption.txt",stringsAsFactors=F,na.strings="?")
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Converting data types
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Plotting plot2
plot(data$Global_active_power ~ data$DateTime,type="l",xlab="",ylab="Global Active Power (kilowatts)")
# Save to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
