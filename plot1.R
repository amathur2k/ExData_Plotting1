el <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)
dates <- el$Date
dates <- as.Date(dates, format="%d/%m/%Y")
gap <- as.numeric(el$Global_active_power)[(dates <= "2007-02-02" & dates >= "2007-02-01")]
hist(gap, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") 
dev.off() 