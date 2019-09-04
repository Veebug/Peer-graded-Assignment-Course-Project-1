#reading the data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
#naming the columns
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#subsetting the dataset
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
#transform date and time into data type of objects 
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#plotting the data
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
#annotating the graph
title(main="Global Active Power Vs Time")