plot3 <- function(){

  library(lubridate)

  ## Read data for 2 day period between 1st and 2nd Feb 2007
  d <- read.table("household_power_consumption.txt",colClasses = classes, header = FALSE, sep = ";", stringsAsFactors = FALSE, nrows = 2880,skip = 66637)
  colnames(d) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  d$Time <- dmy_hms(paste(d$Date,d$Time))
  
  ## Create plot and output to png device
  png(filename = "plot3.png")
  plot(d$Time,d$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
  lines(d$Time,d$Sub_metering_2,type = "l",col="red")
  lines(d$Time,d$Sub_metering_3,type = "l",col="blue")
  legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1))

  dev.off()
  
}
