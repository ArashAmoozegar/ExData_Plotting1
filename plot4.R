# Reading the source file
## This step will take some time because of the size of the raw database.
setwd("D:/R/Exploratory Data Analysis/Assignment_1/")
file_path <- "./household_power_consumption.txt"
power_dataset <- read.table(file_path, stringsAsFactors = FALSE, header = TRUE, sep = ";")

# Checking the dataset and verifying that it has 2,075,259 observations and 9 variables.
str(power_dataset)

# Subsetting the dataset and keeping only observations between 2007-02-01 and 2007-02-02
power_dataset_sub1 <- power_dataset[power_dataset$Date %in% c("1/2/2007","2/2/2007"),]

# Checking the subset dataset and verify the range of Date variable.
unique(power_dataset_sub1$Date)

# Using strptime function to convert Date and Time variables to R standard
Date_Time_Combination <- strptime(paste(power_dataset_sub1$Date, power_dataset_sub1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Creating Plot 4 and saving to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# Top left plot
plot(Date_Time_Combination, as.numeric(power_dataset_sub1$Global_active_power), ylab = "Global Active Power", type = "l", xlab = "")
# Top right plot
plot(Date_Time_Combination, as.numeric(power_dataset_sub1$Voltage), xlab = "datetime", ylab = "Voltage", type = "l")
# Bottom left plot
plot(Date_Time_Combination, as.numeric(power_dataset_sub1$Sub_metering_1), ylab = "Energy sub metering", type = "l", xlab = "", col = "black")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
lines(Date_Time_Combination, as.numeric(power_dataset_sub1$Sub_metering_2), type = "l", col = "red")
lines(Date_Time_Combination, as.numeric(power_dataset_sub1$Sub_metering_3), type = "l", col = "blue")
# Bottom right plot
plot(Date_Time_Combination, as.numeric(power_dataset_sub1$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()