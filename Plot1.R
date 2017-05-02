##read in an table and subset out dates to use
ptable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

## subset out the two days we are looking for
ptabledata <-  subset(ptable, Date == "1/2/2007" | Date == "2/2/2007")

##open .png file
png("plot1.png", width = 480, height = 480)

## draw red histogram of global active power with an x label
hist(ptabledata$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

##close png file
dev.off()