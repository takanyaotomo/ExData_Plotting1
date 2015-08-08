data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subdata <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

DateTime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME","C")
png("plot2.png", width=480, height=480)
plot(DateTime,as.numeric(subdata$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()