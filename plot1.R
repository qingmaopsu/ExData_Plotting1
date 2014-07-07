setwd("~/Desktop/Coursera/Exploratory data analysis Spring2014 JHU/project 1")

#estimate dataset size
data_part <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", nrows = 50)
data_size_part <- object.size(data_part)
total_memory <- data_size_part /50 * 2075259
print (total_memory, units = "MB")
rm(data_part)

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

#make plot 1 with base plotting in png
png(file = "plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red")
dev.off()
