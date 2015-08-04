library(dplyr)
library(lubridate)

###Load de Data
data <- read.table("household_power_consumption.txt", header=T, nrows=10, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')
classes <- sapply(data, class)
data <- tbl_df(read.table("household_power_consumption.txt", header=T, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"',colClasses = classes))

#Subset data from the dates 2007-02-01 and 2007-02-02
data$Date <- dmy(data$Date)
subData<- filter(data, Date<=ymd("2007-02-02"),Date>=ymd("2007-02-01"))






###???Plot 2###

## Converting dates
subData$Datetime <- ymd_hms(paste(subData$Date, subData$Time))

plot(subData$Datetime, subData$Global_active_power, type="l", xlab ="", ylab="Global Active Power (Kilowatts)")


## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

