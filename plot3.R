# Peer Assessments /Course Project 1 - Plot 3
# This R code reads the data, constructs the Plot 3 and creates the plot3.png file

# Reading the data from household_power_consumption.txt file
hpc<-read.table("household_power_consumption.txt",header= TRUE,sep=";")

# Set language to English
Sys.setenv(LANGUAGE="en")
Sys.setlocale("LC_TIME", "English")

# Constructing the Plot 3
with(subset(hpc,Date=="1/2/2007" |Date=="2/2/2007" ),{
  plot(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_1), dec = ".")),type="n",xlab="",ylab="Energy sub metering",col="black")
  points(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_1), dec = ".")),type="l",col="black")
  points(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_2), dec = ".")),type="l",col="red")
  points(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_3), dec = ".")),type="l",col="blue")
  legend("topright", lty = 1,y.intersp=1.5,col=c("black","red","blue"),legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
})

# Creating the plot3.png file
dev.copy(png,file="plot3.png")

# Closing de PNG device
dev.off()