#read data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
foo <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]
rm(data)

#convert dates
foo$FullTime <- paste(foo$Date, foo$Time)
foo$formattedDate <- strptime(foo$FullTime, format = "%d/%m/%Y %H:%M:%S")

#make plot using the base plotting system
with(foo, plot(formattedDate, Global_active_power, main = "", type = "l",xlab = "", ylab = "Global Active Power (kilowatts)" ))

#write to png 480 x 480
dev.copy(png, file = "plot2.png") 
dev.off()