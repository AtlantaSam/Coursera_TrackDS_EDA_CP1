



# Plot 4

# Per instructions, the code to pull data is included, but I did this task by
#   creating a "get data" program first...

data_HPC_full <- read.csv("~/Documents/data/coursera/download/household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                          nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset by the dates provided
data_HPC_full$Date <- as.Date(data_HPC_full$Date, format="%d/%m/%Y")
data_HPC_2007 <- subset(data_HPC_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove the big data file
rm(data_HPC_full)

# Create a datetime variable
DateTime <- paste(as.Date(data_HPC_2007$Date), data_HPC_2007$Time)
data_HPC_2007$Datetime <- as.POSIXct(DateTime)


## Plot 4

setwd("~/Documents/Coursera/Class 4 - Exploratory Data Analysis/Graphics")
png(file="plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_HPC_2007, {
  plot(Global_active_power~Datetime, type="l", xlab="",
       ylab="Global Active Power (kilowatts)", cex=0.2)
  plot(Voltage~Datetime, type="l", xlab="",
       ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, type="l", xlab="",
       ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)
  plot(Global_reactive_power~Datetime, type="l", xlab="",
       ylab="Global Rective Power (kilowatts)")
})

dev.off()