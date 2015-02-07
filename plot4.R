
# the function draws the plot marked as 'Plot 4'
plot4 <- function () {
  
  
  prev.par <- par(bg="transparent", mfrow=c(2,2))
  prev.locale <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "English")
  
  
  plot (
    DT$Global_active_power ~ DT$Time, 
    xlab = "",
    ylab = "Global Active Power",
    type="l"  )
  
  plot(
    DT$Voltage ~ DT$Time, 
    xlab="datetime",
    ylab="Voltage",
    type="l")
  
  plot (
           DT$Sub_metering_1 ~ DT$Time, 
    xlab = "",
    ylab = "Energy sub metering",
    col  = "black",
    type = "l"  )
  
  lines(DT$Sub_metering_2 ~ DT$Time, col="red")
  lines(DT$Sub_metering_3 ~ DT$Time, col="blue")
  
  legend(
    "topright",
    legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty=c(1,1)
  )

  plot(
    DT$Global_reactive_power ~ DT$Time, 
    xlab="datetime",
    ylab="Global_reactive_power",
    type="l")
  
  par(prev.par)
  Sys.setlocale("LC_TIME", prev.locale)
}

# read the data if it's not already read
  if(!any(ls() == "DT")) {
    source("readdata.R")  
    DT <- readdata()
  }

# draw the plot onto the screen
  plot4()

# write it into a png
  png("plot4.png", width=480, height=480, units="px")
  plot4()
  dev.off()