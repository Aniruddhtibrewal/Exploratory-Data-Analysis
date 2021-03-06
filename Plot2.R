library(lubridate)

data_name <- "./household_power_consumption.txt"
raw_data <- read.table(data_name, sep = ";", header = TRUE, stringsAsFactors = FALSE)
raw_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]

raw_data$datetime <- paste(raw_data$Date, raw_data$Time, sep = " ")
datetime <- strptime(raw_data$datetime, "%d/%m/%Y %H:%M:%S")

Global_active_power <-as.numeric(raw_data$Global_active_power)
png("plot2.png",  width = 480, height = 480 )
plot(datetime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()
