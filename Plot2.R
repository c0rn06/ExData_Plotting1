##read in an table and subset out dates to use
ptable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

## subset out the two days we are looking for
ptabledata <-  subset(ptable, Date == "1/2/2007" | Date == "2/2/2007")

##open .png file
png("plot2.png", width = 480, height = 480)

##concat Date and Time into DateTime
ptabledata$DateTime <- strptime(paste(ptabledata$Date,ptabledata$Time),"%d/%m/%Y %H:%M:%S")

## draw line of global active power
plot(ptabledata$DateTime,
     ptabledata$Global_active_power, 
     type = "l",
     ylab = "Global Active Power(kilowatts)",
     xlab = NA)

##close png file
dev.off()