data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subdata <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

DateTime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME","C")
png("plot3.png", width=480, height=480)
plot(DateTime, as.numeric(subdata$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(DateTime, as.numeric(subdata$Sub_metering_2), col="red")
lines(DateTime, as.numeric(subdata$Sub_metering_3), col="blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()