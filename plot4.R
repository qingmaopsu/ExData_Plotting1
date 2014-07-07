setwd("~/Desktop/Coursera/Exploratory data analysis Spring2014 JHU/project 1")
#read only the row numbers within date range of 2007-02-01 and 2007-02-02
#read the column names
variable_names <- names(read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", nrow = 1))

data <- read.table(file = "household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)),skip = 65000, nrow = 7000, col.names = variable_names)

#convert the date and time 
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <-as.Date(data$Date, "%d/%m/%Y")

#select only data from the dates of 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date <="2007-02-02")

#make plot 4 with base plotting
png(file="plot4.png")
par(mfrow = c(2,2))
#making 1st panel
plot(data$Time, data$Global_active_power, type = "l", xlab="", ylab = "Global Active Power")

#making 2nd panel
plot(data$Time, data$Voltage, type = "l", xlab="datetime", ylab = "Voltage")

#making 3rd panel
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1,col = c("black","red","blue"),bty ="n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#making 4th panel
plot(data$Time, data$Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_reactive_power")


dev.off()
#return the original setting
par(mfrow=c(1,1))