data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
dataForPlot <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dataForPlot$Datetime <- as.POSIXct(paste(dataForPlot$Date, dataForPlot$Time))

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(dataForPlot, {
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kw)", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage (v)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kw)", xlab="")
    lines(Sub_metering_2~Datetime,col='red')
    lines(Sub_metering_3~Datetime,col='blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kw)",xlab="")
})

dev.off()