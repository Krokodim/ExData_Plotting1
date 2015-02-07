
# the function draws the plot marked as 'Plot 2'
plot2 <- function () {
  
  prev.par <- par(bg="transparent", mfrow=c(1,1))
  prev.locale <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "English")
  
  plot (
    DT$Global_active_power ~ DT$Time, 
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
    type="l"  )
  
  par(prev.par)
  Sys.setlocale("LC_TIME", prev.locale)
}

# read the data if it's not already read
  if(!any(ls() == "DT")) {
    source("readdata.R")  
    DT <- readdata()
  }

# draw the plot onto the screen
  plot2()

# write it into a png
  png("plot2.png", width=480, height=480, units="px")
  plot2()
  dev.off()