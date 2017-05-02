##read in an table and subset out dates to use
ptable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

## subset out the two days we are looking for
ptabledata <-  subset(ptable, Date == "1/2/2007" | Date == "2/2/2007")

##open .png file
png("plot3.png", width = 480, height = 480)

##concat Date and Time into DateTime
ptabledata$DateTime <- strptime(paste(ptabledata$Date,ptabledata$Time),"%d/%m/%Y %H:%M:%S")

## draw lines for each meter
plot(ptabledata$DateTime,
     ptabledata$Sub_metering_1, 
     type = "l",
     ylab = "Energy sub metering",
     xlab = NA)
lines(ptabledata$DateTime,
      ptabledata$Sub_metering_2, 
      type = "l",
      col = "red")
lines(ptabledata$DateTime,
      ptabledata$Sub_metering_3, 
      type = "l",
      col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1), 
       col = c("black", "red", "blue"))

##close png file
dev.off()