library(dplyr)
library(lubridate)

###Load de Data
data <- read.table("household_power_consumption.txt", header=T, nrows=10, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')
classes <- sapply(data, class)
data <- tbl_df(read.table("household_power_consumption.txt", header=T, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"',colClasses = classes))

#Subset data from the dates 2007-02-01 and 2007-02-02
data$Date <- dmy(data$Date)
subData<- filter(data, Date<=ymd("2007-02-02"),Date>=ymd("2007-02-01"))




###???Plot 4###

par(mfrow=c(2,2))
#1,1
subData$Datetime <- ymd_hms(paste(subData$Date, subData$Time))
plot(subData$Datetime, subData$Global_active_power, type="l", xlab ="", ylab="Global Active Power")

#1,2
plot(subData$Datetime, subData$Voltage, type="l", xlab ="datetime", ylab="Voltage")


#2,1
plot(subData$Datetime, subData$Sub_metering_1, type="l", xlab ="", ylab="Energy sub metering")
lines(subData$Datetime, subData$Sub_metering_2, type="l", xlab ="", ylab="Energy sub metering", col = "red")
lines(subData$Datetime, subData$Sub_metering_3, type="l", xlab ="", ylab="Energy sub metering", col ="blue")
legend("topright", lty=c(1,1) ,col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n",cex=0.6)

       
#2,2
plot(subData$Datetime, subData$Global_reactive_power, type="l", xlab ="datetime", ylab="Global_reactive_power")


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()



