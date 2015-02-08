data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
dataForPlot <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dataForPlot$Datetime <- as.POSIXct(paste(dataForPlot$Date, dataForPlot$Time))

png("plot3.png", width=480, height=480)

with(dataForPlot, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kw)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), 
       lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()