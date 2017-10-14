# Read the file into R  
# subset the data to include only rows with dates:  2007-02-01 and 2007-02-02.
file_Name<- "household_power_consumption.txt"
read_Data <- read.table(file_Name,sep =";", header=TRUE , stringsAsFactors=FALSE , dec=".", na.strings = "?")

# serring data set
data_Set <- subset(read_Data, read_Data$Date %in% c("1/2/2007","2/2/2007"))

# setting variables
Global_active_power<- as.numeric(data_Set$Global_active_power)

# launch a graphics device
png(file = "plot1.png", width = 480, height = 480 ,  units = "px")

# Call a plotting function to make a plot 
hist(Global_active_power, main = "Global Active Power",  xlab = "Global Active Power (killowatts)" , col = "red")

# close graphics device 
dev.off()