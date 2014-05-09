# Peer Assessments /Course Project 1 - Plot 2
# This R code reads the data, constructs the Plot 2 and creates the plot2.png file

# Reading the data from household_power_consumption.txt file
hpc<-read.table("household_power_consumption.txt",header= TRUE,sep=";")

# Constructing the Plot 2
with(subset(hpc,Date=="1/2/2007" |Date=="2/2/2007" ),plot(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Global_active_power), dec = ".")),type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Creating the plot2.png file
dev.copy(png,file="plot2.png")

# Closing de PNG device
dev.off()
