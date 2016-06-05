 etc<-read.table("/Users/liujiayu/Desktop/coursera_data science/Exploratory Data Analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

 head(etc)
 
 ## set time variable
etc_initial <- etc[etc$Date %in% c("1/2/2007","2/2/2007"),]
etc_time <-strptime(paste(etc_initial$Date, etc_initial$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
etc_final <- cbind(etc_initial, etc_time)


## Generating Plot 3
plot(etc_final$etc_time, etc_final$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(etc_final$etc_time, etc_final$Sub_metering_2, col="red")
lines(etc_final$etc_time, etc_final$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

dev.copy(png,'plot3.png')

dev.off()