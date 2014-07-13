
data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE);                 
data["Fixed_Date"] <- lapply(data["Date"], function(d) as.Date(d, "%d/%m/%Y"))
# data$fixed <- strptime(data$Date, data$Time, "%d/%m/%Y %H:%M%S")



targets <- as.Date(c('2007-02-01', '2007-02-02'), "%Y-%m-%d")


interesting <- data[data$Fixed_Date %in% targets,]
interesting$Global_active_power <- sapply(interesting$Global_active_power, as.numeric)


interesting$PTime <- strptime(paste(interesting$Date, interesting$Time), "%d/%m/%Y %H:%M:%S")

# Generate Plot 2
png("figure/plot2.png")
with(interesting, { plot(PTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")})
dev.off()
