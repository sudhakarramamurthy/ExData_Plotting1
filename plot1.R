#Reading File with Header value and NA string, specify the column datatypes
power_consumption <- read.csv("../datafile/household_power_consumption.txt" , sep=";" ,header=TRUE, na.strings="?")

#convert the Date column to Date format
power_consumption$Date = as.Date(strptime(power_consumption$Date, "%d/%m/%Y"))
#filter dataset for dates 2007-02-01 , 2007-02-02 by using subsetting
power_consumption_filtered_dataset <- power_consumption[power_consumption$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename="plot1.png", width = 480, height = 480)
hist(power_consumption_filtered_dataset$Global_active_power , freq=TRUE ,ylab="Frequency", xlab="Global Active Power (kilowatts)" , main="Global Active Power",col="red")
dev.off()
