# This function draws the plot marked as 'Plot 1'

# Please note that the data reading routine 
# is generic for all the plots and thus placed 
# into a separate file "readdata.R"

plot1 <- function () {
  
  # read the data if it's not already read
  if(!any(ls(.GlobalEnv) == "DT")) {
    source("readdata.R")  
    DT <- readdata()
  }
  
  # adjust the graphic parameters
  prev.par <- par(
    bg="transparent", # as it is in the 'figure' folder
    mfrow=c(1,1)      # a single plot
  )
  
  # remember the current locale
  prev.locale <- Sys.getlocale("LC_TIME")
  
  # set the locale to En 
  v <- Sys.setlocale("LC_TIME", "English")
  
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
 
  # restore the graphics params
  par(prev.par)
  
  # restore the locale
  v <- Sys.setlocale("LC_TIME", prev.locale)
}


# draw the plot onto the screen
  plot1()

# open a png file
  png("plot1.png", width=480, height=480, units="px")

# draw the plot into the file
  plot1()

# close the file
  dev.off()