#Reading File with Header value and NA string
power_consumption <-  read.table("../datafile/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Set the Date formate using as.Date() and  strptime
power_consumption$Date = as.Date(strptime(power_consumption$Date, "%d/%m/%Y"))
power_consumption_filtered_dataset <- power_consumption[power_consumption$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels. 
png(filename="plot2.png", width = 480, height = 480)

Time_format <- strptime(paste(power_consumption_filtered_dataset$Date, power_consumption_filtered_dataset$Time), format="%Y-%m-%d %H:%M:%S")

plot(Time_format, 
     power_consumption_filtered_dataset$Global_active_power, 
     type="l", 
     xlab="Day",
     ylab="Global Active Power (kilowatts)")

dev.off()
