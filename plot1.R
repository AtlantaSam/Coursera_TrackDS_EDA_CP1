# Plot 1

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

# Plot 1
hist(data_HPC_2007$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save file
setwd("~/Documents/Coursera/Class 4 - Exploratory Data Analysis/Graphics")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

