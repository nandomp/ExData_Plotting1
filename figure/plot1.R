library(dplyr)
library(lubridate)

###Load de Data
data <- read.table("household_power_consumption.txt", header=T, nrows=10, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')
classes <- sapply(data, class)
data <- tbl_df(read.table("household_power_consumption.txt", header=T, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"',colClasses = classes))

#Subset data from the dates 2007-02-01 and 2007-02-02
data$Date <- dmy(data$Date)
subData<- filter(data, Date<=ymd("2007-02-02"),Date>=ymd("2007-02-01"))





###Plot 1###

hist(subData$Global_active_power, col="red", xlim=c(0,6), main="Global Active Power", xlab="Global Active Power (kilowats)", ylab="Frequency", xaxt = "n")
axis(1, at=c(0,2,4,6), labels=c(0,2,4,6))

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()





