library(lubridate)

data_name <- "./household_power_consumption.txt"
raw_data <- read.table(data_name, sep = ";", header = TRUE, stringsAsFactors = FALSE)
raw_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]

raw_data$datetime <- paste(raw_data$Date, raw_data$Time, sep = " ")
datetime <- strptime(raw_data$datetime, "%d/%m/%Y %H:%M:%S")

Global_active_power <-as.numeric(raw_data$Global_active_power)
Sub_meeting1 <- as.numeric(raw_data$Sub_metering_1)
Sub_meeting2 <- as.numeric(raw_data$Sub_metering_2)
Sub_meeting3 <- as.numeric(raw_data$Sub_metering_3)



png("plot3.png",  width = 480, height = 480 )
plot(datetime, Sub_meeting1, type = "l",xlab = "", ylab = "Energy Sub meeting", col = "black")
lines(datetime,Sub_meeting2,type = "l",xlab = "", ylab = "Energy Sub meeting", col= "red")
lines(datetime,Sub_meeting3,type = "l",xlab = "", ylab = "Energy Sub meeting", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"))

dev.off()
