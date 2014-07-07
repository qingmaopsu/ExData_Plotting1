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

#make plot 2 with base plotting
png(file = "plot2.png")
plot(data$Time, data$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")

dev.off()