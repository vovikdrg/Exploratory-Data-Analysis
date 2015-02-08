data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
dataForPlot <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
dataForPlot$Datetime <- as.POSIXct(paste(dataForPlot$Date, dataForPlot$Time))

png("plot2.png", width=480, height=480)
plot(dataForPlot$Global_active_power~datetime, type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")
dev.off()