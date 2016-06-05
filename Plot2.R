 etc<-read.table("/Users/liujiayu/Desktop/coursera_data science/Exploratory Data Analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

 head(etc)
 
## set time variable
etc_initial <- etc[etc$Date %in% c("1/2/2007","2/2/2007"),]
etc_time <-strptime(paste(etc_initial$Date, etc_initial$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
etc_final <- cbind(etc_initial, etc_time)

 
## Generating Plot 2
plot(etc_final$etc_time, etc_final$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,'plot2.png')

dev.off()