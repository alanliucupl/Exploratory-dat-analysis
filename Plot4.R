 etc<-read.table("/Users/liujiayu/Desktop/coursera_data science/Exploratory Data Analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

 head(etc)
 
 ## set time variable
etc_initial <- etc[etc$Date %in% c("1/2/2007","2/2/2007"),]
etc_time <-strptime(paste(etc_initial$Date, etc_initial$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
etc_final <- cbind(etc_initial, etc_time)



## Generating Plot 4

###set parameter
par(mfrow=c(2,2))

###plot 1st one
plot(etc_final$etc_time, etc_final$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power (kilowatts)")

###plot second one
plot(etc_final$etc_time, etc_final$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")


###plot third one
plot(etc_final$etc_time, etc_final$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(etc_final$etc_time, etc_final$Sub_metering_2, col="red")
lines(etc_final$etc_time, etc_final$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

###plot 4th one
plot(etc_final$etc_time, etc_final$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,'plot4.png')

dev.off()
