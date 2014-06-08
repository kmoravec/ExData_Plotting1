#read data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
foo <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
rm(data)

#convert dates
foo$FullTime <- paste(foo$Date, foo$Time)
foo$formattedDate <- strptime(foo$FullTime, format = "%d/%m/%Y %H:%M:%S")

#make plot using the base plotting system
with(foo, {
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
     })

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       
       #lwd=c(2.5,2.5),
       col = c("black", "red" ,"blue"))

#write to png 480 x 480
dev.copy(png, file = "plot3.png") 
dev.off()