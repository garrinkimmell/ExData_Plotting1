
data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE);                 
data["Fixed_Date"] <- lapply(data["Date"], function(d) as.Date(d, "%d/%m/%Y"))
# data$fixed <- strptime(data$Date, data$Time, "%d/%m/%Y %H:%M%S")



targets <- as.Date(c('2007-02-01', '2007-02-02'), "%Y-%m-%d")


interesting <- data[data$Fixed_Date %in% targets,]
interesting$Global_active_power <- sapply(interesting$Global_active_power, as.numeric)


interesting$PTime <- strptime(paste(interesting$Date, interesting$Time), "%d/%m/%Y %H:%M:%S")

# Generate Plot 3
png("figure/plot3.png")
with(interesting, { plot(PTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")})
lines(interesting$PTime, interesting$Sub_metering_2, type="l", col="red")
lines(interesting$PTime, interesting$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c("black","red", "blue"), lwd=c(1,1,1))
dev.off()
