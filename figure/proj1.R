library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", header=T, nrows=10, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')
classes <- sapply(tab, class)
data <- tbl_df(read.table("household_power_consumption.txt", header=T, sep =";", na.strings="?",stringsAsFactors=F, comment.char="", quote='\"',colClasses = c))


data$Data <- dmy(data$Date)
subData<- filter(data, Date<=ymd("2007-02-02"),Date>=ymd("2007-02-01"))

