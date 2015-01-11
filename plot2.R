plot2<-function(){
  DT<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
  DT$DateTime<-as.POSIXct(paste(DT$Date,DT$Time), format="%d/%m/%Y %H:%M:%S")
  par(mfrow = c(1, 1))
  plot(DT$DateTime,DT$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
  dev.copy(png, file="plot2.png")
  dev.off()
}