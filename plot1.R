data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

dataForPlot <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
png("plot1.png", width=480, height=480)
hist(dataForPlot$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Freqency", col="Red")
dev.off()
