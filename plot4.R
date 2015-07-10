data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66637,nrows=2880,
                   col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                               "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

data$Date_time <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width=480,height=480,units="px",bg="transparent")
par(mfrow=c(2,2))
plot(data$Date_time,data$Global_active_power,type = "l",xlab="",ylab="Global Active Power")
plot(data$Date_time,data$Voltage,type = "l",xlab="datetime",ylab="Voltage")
plot(data$Date_time,data$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
lines(data$Date_time,data$Sub_metering_2,col="red")
lines(data$Date_time,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
plot(data$Date_time,data$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")
dev.off()