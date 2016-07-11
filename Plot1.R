library(lubridate)

data_name <- "./household_power_consumption.txt"
raw_data <- read.table(data_name, sep = ";", header = TRUE, stringsAsFactors = FALSE)
raw_data <- raw_data[(raw_data$Date %in% c("1/2/2007","2/2/2007")),]

Global_active_power <-as.numeric(raw_data$Global_active_power)
png("plot1.png",  width = 480, height = 480 )
hist(Global_active_power,main = " Global Active Power",  xlab = "Global Active Power (KiloWatts)", ylab = "Frequency")
dev.off()
