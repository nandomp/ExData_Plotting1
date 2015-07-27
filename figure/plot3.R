library(dplyr)
library(lubridate)

###Load de Data
data <- read.table("household_power_consumption.txt", header=T, nrows=10, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')
classes <- sapply(data, class)
data <- tbl_df(read.table("household_power_consumption.txt", header=T, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"',colClasses = classes))

#Subset data from the dates 2007-02-01 and 2007-02-02
data$Date <- dmy(data$Date)
subData<- filter(data, Date<=ymd("2007-02-02"),Date>=ymd("2007-02-01"))




###Plot 3###

plot(subData$Datetime, subData$Sub_metering_1, type="l", xlab ="", ylab="Energy sub metering")
lines(subData$Datetime, subData$Sub_metering_2, type="l", xlab ="", ylab="Energy sub metering", col = "red")
lines(subData$Datetime, subData$Sub_metering_3, type="l", xlab ="", ylab="Energy sub metering", col ="blue")
legend("topright", lty=c(1,1) ,col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
       
       

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



