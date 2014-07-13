
data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE);                 
data["Fixed_Date"] <- lapply(data["Date"], function(d) as.Date(d, "%d/%m/%Y"))
# data$fixed <- strptime(data$Date, data$Time, "%d/%m/%Y %H:%M%S")



targets <- as.Date(c('2007-02-01', '2007-02-02'), "%Y-%m-%d")


interesting <- data[data$Fixed_Date %in% targets,]
interesting$Global_active_power <- sapply(interesting$Global_active_power, as.numeric)


interesting$PTime <- strptime(paste(interesting$Date, interesting$Time), "%d/%m/%Y %H:%M:%S")

# Generate Plot 4
png("figure/plot4.png")
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
# Plot Top Left
with(interesting, { plot(PTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")})

# Plot Top Right
with(interesting, plot(PTime, Voltage, type="l", xlab="datetime"))


# Plot Bottom Left
with(interesting, { plot(PTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")})
lines(interesting$PTime, interesting$Sub_metering_2, type="l", col="red")
lines(interesting$PTime, interesting$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c("black","red", "blue"), lwd=c(1,1,1), box.lwd=0)

# Plot Bottom Right
with(interesting, { plot(PTime, Global_reactive_power, xlab="datetime", type="l")})


dev.off()



