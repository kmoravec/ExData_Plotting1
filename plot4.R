#read data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
foo <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
rm(data)

#convert dates
foo$FullTime <- paste(foo$Date, foo$Time)
foo$formattedDate <- strptime(foo$FullTime, format = "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2, 2))
with(foo, {
  #plot 2
  plot(formattedDate, Global_active_power, 
       main = "", 
       type = "l",
       xlab = "", 
       ylab = "Global Active Power (kilowatts)" ) 
  #plot 3
  plot(formattedDate, foo$Sub_metering_1, 
        main = "", 
        type = "l",
        xlab = "", 
        ylab = "Energy sub metering"
       ) 
  lines(formattedDate, foo$Sub_metering_2, 
        col = "red")
  lines(formattedDate, foo$Sub_metering_3, 
        col = "blue")
  legend("topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1), # gives the legend appropriate symbols (lines)
         col = c("black", "red" ,"blue"),
         bty = "n")
  #plot 
plot(formattedDate, Voltage, 
     main = "", 
     type = "l",
     xlab = "", 
     ylab = "Voltage" ) 
  #plot
plot(formattedDate, Global_reactive_power, 
     main = "", 
     type = "l",
     xlab = "", 
     ylab = "Global_reactive_power" ) 
})

#write to png 480 x 480
dev.copy(png, file = "plot4.png") 
dev.off()