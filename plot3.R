#PLOT 3

#Set the working directory
setwd("C:/Users/karlman/Desktop/DOST PCIEERD/PCIEERDdatascience")
#Create a directory if it does not exist
if(!file.exists("data")){
  dir.create("data")
} 
#Download the file
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./exdata_data_household_power_consumption.zip")
#Unzip the downloaded file
unzip("./exdata_data_household_power_consumption.zip")


#Load data into R: 01/02/2007 to 02/02/2007 only
datafile <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings = "?")
data <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),] 


#Convert date and time variables to Date/Time classes 
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Plot the data
png(filename="./plot3.png", width=480, height=480)
plot(DateTime, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(DateTime, data$Sub_metering_2, col="red")
lines(DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()


#**********************#