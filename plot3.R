
# the function draws the plot marked as 'Plot 3'
plot3 <- function () {
  
  prev.par <- par(bg="transparent", mfrow=c(1,1))
  prev.locale <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "English")
  
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
  
  par(prev.par)
  Sys.setlocale("LC_TIME", prev.locale)
}

# read the data if it's not already read
  if(!any(ls() == "DT")) {
    source("readdata.R")  
    DT <- readdata()
  }

# draw the plot onto the screen
  plot3()

# write it into a png
  png("plot3.png", width=480, height=480, units="px")
  plot3()
  dev.off()