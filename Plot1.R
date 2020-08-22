library(dplyr)
library(data.table)

EPC <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#str(EPC)
EPC_Feb <- filter(EPC, Date=="1/2/2007"|Date=="2/2/2007")
#str(EPC_Feb)

globalActivePower <- as.numeric(EPC_Feb$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()