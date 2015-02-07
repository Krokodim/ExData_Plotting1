# This function draws the plot marked as 'Plot 2'

# Please note that the data reading routine 
# is generic for all the plots and thus placed 
# into a separate file "readdata.R"

plot2 <- function () {
  
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
  
  plot (
    DT$Global_active_power ~ DT$Time, 
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
    type="l"  )
  
  # restore the graphics params
  par(prev.par)
  
  # restore the locale
  v <- Sys.setlocale("LC_TIME", prev.locale)
}

# draw the plot onto the screen
  plot2()

# open a png file
  png("plot2.png", width=480, height=480, units="px")

# draw the plot into the file
  plot2()

# close the file
  dev.off()