# Peer Assessments /Course Project 1 - Plot 4
# This R code reads the data, constructs the Plot 4 and creates the plot4.png file

# Reading the data from household_power_consumption.txt file
hpc<-read.table("household_power_consumption.txt",header= TRUE,sep=";")

# Set language to English
Sys.setenv(LANGUAGE="en")
Sys.setlocale("LC_TIME", "English")

# Constructing the Plot 4
par(mfrow=c(2,2))
with(subset(hpc,Date=="1/2/2007" |Date=="2/2/2007" ),{
  plot(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Global_active_power), dec = ".")),type="l",xlab="",ylab="Global Active Power")
  plot(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Voltage), dec = ".")),type="l",xlab="datetime",ylab="Voltage")
  plot(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_1), dec = ".")),type="n",xlab="",ylab="Energy sub metering",col="black")
  points(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_1), dec = ".")),type="l",col="black")
  points(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_2), dec = ".")),type="l",col="red")
  points(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Sub_metering_3), dec = ".")),type="l",col="blue")
  legend("topright",cex=0.7, lty = 1,y.intersp=2,inset=c(0.3,0),bty = "n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'),as.numeric(type.convert(as.character(Global_reactive_power), dec = ".")),type="l",xlab="datetime",ylab="Global_reactive_power")
})

# Creating the plot4.png file
dev.copy(png,file="plot4.png")

# Closing de PNG device
dev.off()