#Reading File with Header value and NA string
power_consumption <-  read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Set the Date formate using as.Date() and  strptime
power_consumption$Date = as.Date(strptime(power_consumption$Date, "%d/%m/%Y"))
power_consumption_filtered_dataset <- power_consumption[power_consumption$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels. 
png(filename="plot4.png", width = 480, height = 480)

Time_format <- strptime(paste(power_consumption_filtered_dataset$Date, power_consumption_filtered_dataset$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
plot(Time_format, 
     power_consumption_filtered_dataset$Global_active_power, 
     type="l", 
     xlab="Day",
     ylab="Global Active Power")
plot(Time_format, 
     power_consumption_filtered_dataset$Voltage, 
     type="l", 
     xlab="datetime",
     ylab="Voltage")
plot(Time_format, 
     power_consumption_filtered_dataset$Sub_metering_1,
     col="black",
     type="l", 
     xlab="Day",
     ylab="Global Active Power (kilowatts)")
lines(Time_format, power_consumption_filtered_dataset$Sub_metering_2, col="red")
lines(Time_format, power_consumption_filtered_dataset$Sub_metering_3, col="blue")
legend(x="topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
plot(Time_format, 
     power_consumption_filtered_dataset$Global_reactive_power, 
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
