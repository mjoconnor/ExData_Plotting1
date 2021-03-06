data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66637,nrows=2880,
                   col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                               "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

data$Date_time <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480,units="px",bg="transparent")
plot(data$Date_time,data$Global_active_power,type = "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()