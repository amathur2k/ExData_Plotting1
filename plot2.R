el <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)
dates <- el$Date
dates <- as.Date(dates, format="%d/%m/%Y")
times <- paste(as.character(el$Date), as.character(el$Time))
times <- strptime(times, format="%d/%m/%Y %H:%M:%S")

gap <- as.numeric(el$Global_active_power)[(dates <= "2007-02-02" & dates >= "2007-02-01")]
times_selected <- times[(dates <= "2007-02-02" & dates >= "2007-02-01")]

plot (times_selected, gap, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") 
dev.off() 