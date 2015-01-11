plot3<-function(){
  DT<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
  DT$DateTime<-as.POSIXct(paste(DT$Date,DT$Time), format="%d/%m/%Y %H:%M:%S")
  par(mfrow = c(1, 1))
  plot(DT$DateTime,DT$Sub_metering_1,type="n", ylab="Energy sub metering", xlab= "")
  lines(DT$DateTime, DT$Sub_metering_1, col="grey")
  lines(DT$DateTime, DT$Sub_metering_2, col="blue")
  lines(DT$DateTime, DT$Sub_metering_3, col="red")
  legend("topright", col=c("grey","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="-", lwd=1)
  dev.copy(png, file="plot3.png")
  dev.off()
}