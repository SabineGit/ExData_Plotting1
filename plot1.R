plot1 <- function() { 
  library(dplyr)
  #read in all used data
  Data <- read.csv(file="C:/Users/Sabine/Downloads/household_power_consumption.txt",  sep = ";", stringsAsFactors=FALSE)
  
  Data$Date<- as.Date(Data$Date, "%d/%m/%Y")
  Data$Time<-strptime(Data$Time, "%H:%M:%S")
  Data$Global_active_power<-as.numeric(Data$Global_active_power)
  
  Data1 <-subset(Data, (Date < "2007-02-03"  ) )
  Data2 <-subset(Data1,(Date > "2007-01-31"  ) )
  
  png(file= "plot1.png")
  hist(Data2$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)",breaks=15)
  dev.off()
}