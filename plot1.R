# Peer Assessments /Course Project 1 - Plot 1
# This R code reads the data, constructs the Plot 1 and creates the plot1.png file

# Reading the data from household_power_consumption.txt file
hpc<-read.table("household_power_consumption.txt",header= TRUE,sep=";")

# Constructing the Plot 1
with(subset(hpc,Date=="1/2/2007" |Date=="2/2/2007" ),hist(as.numeric(type.convert(as.character(Global_active_power), dec = ".")),col="red",main="Global Active Power",xlab= "Global Active Power (kilowatts)"))

# Creating the plot1.png file
dev.copy(png,file="plot1.png")

# Closing de PNG device
dev.off()