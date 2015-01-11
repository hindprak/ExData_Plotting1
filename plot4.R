plot4<-function(){
  DT<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
  DT$DateTime<-as.POSIXct(paste(DT$Date,DT$Time), format="%d/%m/%Y %H:%M:%S")
  #par(mfrow = c(1, 2, 3, 4))
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  dev.copy(png, file="plot4.png", width=480, height=480)
  with(DT, {
  plot(DateTime, Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
  plot(DateTime, Voltage,type="l", ylab="Voltage", xlab= "datetime")
  
  plot(DateTime, Sub_metering_1,type="n", ylab="Energy sub metering", xlab= "")
  lines(DateTime, Sub_metering_1, col="grey")
  lines(DateTime, Sub_metering_2, col="blue")
  lines(DateTime, Sub_metering_3, col="red")
  legend("topright", col=c("grey","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="-", lwd=1)
  
  plot(DateTime, Global_reactive_power,type="l", ylab="Global_reactive_power", xlab= "datetime")
  })
  dev.off()
}