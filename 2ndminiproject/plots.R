
## CMSC 197 
## Second Mini-Project

## Mark Andrew Geloryao
## BS in Statistics III


## Problem 2


# setting the working directory
setwd("C:/Users/Acer/Desktop/UPV/21-22 FS/cmsc 197 -1/MP2/specdata2") 



p <- read.table("household_power_consumption.txt", sep=";" ,header=TRUE, na=c("?"))

  p$Date<-as.Date(p$Date, format="%d/%m/%Y")
  pData <- p[p$Date=="2007-02-02"|p$Date=="2007-02-01",]

  pData$Time <- paste(pData$Date, pData$Time, sep=" ")
  pData$Time<-strptime(pData$Time, format="%Y-%m-%d %H:%M:%S")

  pData$Global_active_power<-as.numeric(pData$Global_active_power)
  pData$Global_reactive_power<-as.numeric(pData$Global_reactive_power)
  
  

#Plot 1 
  
  # shows a histogram showing the frequency of Global Active Power
  hist(pData$Global_active_power, 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", main= "Global Active Power", 
     col="red", bg = "white")

  # the creation of the PNG file
  dev.copy(png,"plot1.png",
         width = 480, 
         height = 480, )
  dev.off()


#Plot 2
  
  # shows the changes of the Global active power basing on datetime
  plot(pData$Time, pData$Global_active_power, 
       ylab="Global Active Power (kilowatts)", xlab=" ", 
       type="l", bg = "white")

  # the creation of the PNG file
  dev.copy(png,"plot2.png",
         width = 480, 
         height = 480, )
  dev.off()

  
#Plot 3
  
  # shows the energy sub metering depending on datetime
  pData$Sub_metering_1<-as.numeric(pData$Sub_metering_1)
  pData$Sub_metering_2<-as.numeric(pData$Sub_metering_2)
  pData$Sub_metering_3<-as.numeric(pData$Sub_metering_3)
  
  plot(pData$Time, pData$Sub_metering_1,
       ylab="Energy sub metering", xlab=" ", 
       type="l", col="black")
  
    lines(pData$Time, pData$Sub_metering_2, 
          type="l", col="red")
    
    lines(pData$Time, pData$Sub_metering_3, 
          type="l", col="blue")
  
  legend("topright", 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","red","blue"), lty=1)

  # the creation of the PNG file
  dev.copy(png,"plot3.png",
         width = 480, 
         height = 480, )
  dev.off()

  
#Plot 4 
  
  # combination of various plots
  par(mfrow=c(2,2))
  
  with(pData,{
    
    # plot in the Top Left
    # shows the Global Active Power according to datetime
    plot(Time, pData$Global_active_power, 
         ylab="Global Active Power (kilowatts)", xlab=" ", type="l")
    
    # plot in the Top Right
    # shows the Voltage with accordance to datetime
    plot(Time, Voltage, xlab="datetime", type="l")
    
    # plot in the Bottom Left
    # shows the sub metering of energy according to datetime
    plot(Time, Sub_metering_1, type="l", 
         ylab="Energy sub metering", xlab=" ", col="black")
      
      lines(Time, Sub_metering_2, type="l", col="red")
      lines(Time, Sub_metering_3, type="l", col="blue")
      
      legend("topright",
             col = c("black",
                     "red",
                     "blue"),
             legend = c("Sub_metering_1",
                        "Sub_metering_2",
                        "Sub_metering_3"),
             lty = 1,
             bty = "n", xjust=1, x.intersp = 0.5, y.intersp = 0.5, cex=0.75, merge = TRUE
             )
  
  
    # plot in the Bottom Right
    # shows the changes of the Global reactive power with accordance to datetime
    plot(Time, Global_reactive_power, 
         xlab="datetime", type="l")
  })
  
    # the creation of the PNG file
    dev.copy(png,"plot4.png",
           width = 480, 
           height = 480, )
    dev.off()
