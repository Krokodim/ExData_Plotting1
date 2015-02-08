# This function draws the plot marked as 'Plot 4'
# (actually a set of plots)

# Please note that the data reading routine 
# is generic for all the plots and thus placed 
# into a separate file "readdata.R"

plot4 <- function () {
  
  # read the data if it's not already read
  if(!any(ls(.GlobalEnv) == "DT")) {
    source("readdata.R")  
    DT <- readdata()
  }
  
  # adjust the graphic parameters
  prev.par <- par(
    bg="transparent", # as it is in the 'figure' folder
    mfrow=c(2,2)      # 2x2 set of plots
  )
  
  # remember the current locale
  prev.locale <- Sys.getlocale("LC_TIME")
  
  # set the locale to En 
  v <- Sys.setlocale("LC_TIME", "English")
  
  # top-left plot
  plot (
    DT$Global_active_power ~ DT$Time, 
    xlab = "",
    ylab = "Global Active Power",
    type = "l"  )
  
  # top-right plot
  plot(
    DT$Voltage ~ DT$Time, 
    xlab = "datetime",
    ylab = "Voltage",
    type = "l")
  
  # bottom-left plot
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
    col    = c("black", "red", "blue"),
    lty    = 1, bty = "n"
  )

  # bottom-right plot
  plot(
    DT$Global_reactive_power ~ DT$Time, 
    xlab = "datetime",
    ylab = "Global_reactive_power",
    type = "l")
  
  # restore the graphics params
  par(prev.par)
  
  # restore the locale
  v <- Sys.setlocale("LC_TIME", prev.locale)
}


# draw the plot onto the screen
  plot4()

# open a png file
  png("plot4.png", width=480, height=480, units="px")

# draw the plot into the file
  plot4()

# close the file
  dev.off()