plot1<-function(){
  DT<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
  par(mfrow = c(1, 1))
  hist(DT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}