#PLOT 1

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


#Plot the data
GAP <- data$Global_active_power
png(filename = "./plot1.png", width=480, height=480)
hist(GAP, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = 'red')
dev.off() 
                   
#********************#