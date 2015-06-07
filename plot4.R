
el <- read.csv("household_power_consumption.txt", sep=";", as.is = TRUE)

dates <- el$Date
dates <- as.Date(dates, format="%d/%m/%Y")
times <- paste(as.character(el$Date), as.character(el$Time))
times <- strptime(times, format="%d/%m/%Y %H:%M:%S")
times_selected <- times[(dates <= "2007-02-02" & dates >= "2007-02-01")]

s1 <- as.numeric(el$Sub_metering_1)[(dates <= "2007-02-02" & dates >= "2007-02-01")]
s2 <- as.numeric(el$Sub_metering_2)[(dates <= "2007-02-02" & dates >= "2007-02-01")]
s3 <- as.numeric(el$Sub_metering_3)[(dates <= "2007-02-02" & dates >= "2007-02-01")]

gap <- as.numeric(el$Global_active_power)[(dates <= "2007-02-02" & dates >= "2007-02-01")]
v <- as.numeric(el$Voltage)[(dates <= "2007-02-02" & dates >= "2007-02-01")]
grp <- as.numeric(el$Global_reactive_power)[(dates <= "2007-02-02" & dates >= "2007-02-01")]


par(mfrow = c(2,2))

##Plot 1
plot (times_selected, gap, type = "l", ylab = "Global Active Power", xlab = "")

##Plot 2
plot (times_selected, v, type = "l", ylab = "Voltage", xlab = "datetime")

##Plot 3
plot (times_selected, s1, type = "l", ylab = "Energy sub metering", xlab = "")
lines (times_selected, s2, type = "l", col = "red")
lines (times_selected, s3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), col = c("black", "red", "blue"), lty = c(1,1,1))

##Plot 4
plot (times_selected, grp, type = "l", ylab = "Global_reactive_Power", xlab = "datetime")

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px") 
dev.off() 