# Read the file into R  
# subset the data to include only rows with dates:  2007-02-01 and 2007-02-02.
file_Name<- "household_power_consumption.txt"
read_Data <- read.table(file_Name,sep =";", header=TRUE , stringsAsFactors=FALSE , dec=".", na.strings = "?")


# setting data set
data_Set <- subset(read_Data, read_Data$Date %in% c("1/2/2007","2/2/2007"))

# setting variables
date_time <- strptime(paste(data_Set$Date, data_Set$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power<- as.numeric(data_Set$Global_active_power)
Sub_metering_1<- as.numeric(data_Set$Sub_metering_1)
Sub_metering_2<- as.numeric(data_Set$Sub_metering_2)
Sub_metering_3<-as.numeric(data_Set$Sub_metering_3)
Voltage<-as.numeric(data_Set$Voltage)
Global_reactive_power<-(data_Set$Global_reactive_power)


# launch a graphics device
png(file = "plot4.png", width = 480, height = 480 ,  units = "px")

par(mfrow = c(2,2) , mar = c(4,4,2,1) , oma= c(0,2,2,0))

# adding plot
plot(date_time, Global_active_power , xlab=" ", ylab = "Global Active Power (killowatts)" , type="l")


# adding plot

plot(date_time, Voltage,xlab= "datetime", ylab= "Voltage", type= "l")


# adding plot
plot(date_time, Sub_metering_1, xlab=" ", ylab ="Energy sub metering" , type= "n")
points(date_time, Sub_metering_1, type = "l")
points(date_time, Sub_metering_2, type = "l", col = "red")
points(date_time, Sub_metering_3, type = "l", col = "blue")
legend("topright",lty=1 , col= c("black", "red", "blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

# adding plot
plot(date_time, Global_reactive_power, ylab="Global_reactive_power", xlab= "datatime" , type= "l")

# close graphics device 
dev.off()