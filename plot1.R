source("readdata.R")  

# the function draws the plot marked as 'Plot 1'
plot1 <- function () {
  
  prev.par <- par(bg="transparent", mfrow=c(1,1))
  prev.locale <- Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "English")
  
  # draw the histogram
  hist(
    DT$Global_active_power, 
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)", 
    axes =  FALSE,
    col  = "red"
  )
  
  #adjust the axis
  axis(1,c(0,2,4,6))
  axis(2,c(0,200,400,600,800,1000,1200))
 
  par(prev.par)
  Sys.setlocale("LC_TIME", prev.locale)
}

# read the data if it's not already read
if(!any(ls() == "DT")) {
  source("readdata.R")  
  DT <- readdata()
}

# draw the plot onto the screen
  plot1()

# write it into a png
  png("plot1.png", width=480, height=480, units="px")
  plot1()
  dev.off()