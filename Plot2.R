library(dplyr)
library(data.table)

EPC <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#str(EPC)
EPC_Feb <- filter(EPC, Date=="1/2/2007"|Date=="2/2/2007")
#str(EPC_Feb)

EPC_Feb$Date <- as.Date(EPC_Feb$Date, format="%d/%m/%Y")
EPC_Feb$Time <- strptime(EPC_Feb$Time, format="%H:%M:%S")
EPC_Feb[1:1440,"Time"] <- format(EPC_Feb[1:1440,"Time"],"2007-02-01 %H:%M:%S")
EPC_Feb[1441:2880,"Time"] <- format(EPC_Feb[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

globalActivePower <- as.numeric(EPC_Feb$Global_active_power)
png("plot2.png", width=480, height=480)
plot(EPC_Feb$Time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
title(main="Global Active Power Vs Time")
dev.off()

