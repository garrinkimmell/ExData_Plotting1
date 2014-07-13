
data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE);                 
data["Date"] <- lapply(data["Date"], function(d) as.Date(d, "%d/%m/%Y"))
# data$fixed <- strptime(data$Date, data$Time, "%d/%m/%Y %H:%M%S")
  
targets <- as.Date(c('2007-02-01', '2007-02-02'), "%Y-%m-%d")

interesting <- data[data$Date %in% targets,]
interesting$Global_active_power <- sapply(interesting$Global_active_power, as.numeric)

# Generate Plot 1
png("figure/plot1.png")
hist(interesting$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()