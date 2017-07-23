plot2 <- function() { 
  library(dplyr)
  #read in all used data
  Data <- read.csv(file="C:/Users/Sabine/Downloads/household_power_consumption.txt",  sep = ";", stringsAsFactors=FALSE)

  #get rows with dates/times needed
  t<-as.POSIXct(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")
  Data1<-cbind(Data,t)
  Data2 <-subset(Data1,(t < "2007-02-03"  ) )
  Data3 <-subset(Data2,(t > "2007-02-01"  ) )
  Data3$Global_active_power<-as.numeric(Data3$Global_active_power)
  
  #plot in file
  png(file= "plot2.png")
  plot(Data3$t,Data3$Global_active_power, type="l",lty= 1, xlab= "", ylab= "Global Active Power (kilowatts)")
  dev.off()
}