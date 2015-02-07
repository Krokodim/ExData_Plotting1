
# the function draws the plot maked as 'Plot 2'
plot2 <- function () {
  
  pp <- par(bg="transparent", mfrow=c(1,1))
  Sys.setlocale("LC_TIME", "English")
  
  plot (
    DT$Global_active_power ~ DT$Time, 
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
    type="l"  )
  
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