plot1 <- function(){
#use setAs() to format and import the data of date from txt file as Date type in R.
setAs("character","myDate", function(from) {as.Date(from, format="%d/%m/%Y")})

#Reading File with Header value and NA string, specify the column datatypes
power_consumption <- read.csv("../datafile/household_power_consumption.txt" , sep=";" ,header=TRUE, colClasses = c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") , na.strings="?")

#filter dataset for dates 2007-02-01 , 2007-02-02 by using subsetting
power_consumption_filtered_dataset <- power_consumption[power_consumption $Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename="plot1.png", width = 480, height = 480)
hist(power_consumption_filtered_dataset$Global_active_power , freq=TRUE ,ylab="Frequency", xlab="Global Active Power (kilowatts)" , main="Global Active Power",col="red")
dev.off()
}

