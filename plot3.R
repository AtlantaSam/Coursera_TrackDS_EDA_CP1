# Plot 3

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

##########################################################################

# Plot 3
setwd("~/Documents/Coursera/Class 4 - Exploratory Data Analysis/Graphics")
png(file="xplot3.png", height=480, width=480)
with(data_HPC_2007, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.9)
dev.off()

