# Read the file into R  
# subset the data to include only rows with dates:  2007-02-01 and 2007-02-02.
file_Name<- "household_power_consumption.txt"
read_Data <- read.table(file_Name,sep =";", header=TRUE , stringsAsFactors=FALSE , dec=".", na.strings = "?")

# setting data set
data_Set <- subset(read_Data, read_Data$Date %in% c("1/2/2007","2/2/2007"))

# setting variables 
date_time <- strptime(paste(data_Set$Date, data_Set$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1<- as.numeric(data_Set$Sub_metering_1)
Sub_metering_2<- as.numeric(data_Set$Sub_metering_2)
Sub_metering_3<-as.numeric(data_Set$Sub_metering_3)

# launch a graphics device
png(file = "plot3.png", width = 480, height = 480 ,  units = "px")

# setting up plot region 
plot(date_time, data_Set$Sub_metering_1, xlab=" ", ylab ="Energy sub metering" , type= "n")

# adding points based on sub_metering
points(date_time, Sub_metering_1, type = "l")
points(date_time, Sub_metering_2, type = "l", col = "red")
points(date_time, Sub_metering_3, type = "l", col = "blue")

# adding legend
legend("topright",lty=1 , col= c("black", "red", "blue"),c(colnames(metering)) )

# close graphics device 
dev.off()