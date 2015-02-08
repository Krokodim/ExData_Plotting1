

library(data.table)

DT <- data.table()

readdata <- function (filename="household_power_consumption.txt") {
  
  # read the data as character data.table 
    DT.raw <- fread(
      input            = filename, 
      stringsAsFactors =  FALSE,
      colClasses       = "character",
      sep              = ";"
    )
  
  # subset to only the required rows ...
    DT <- DT.raw[Date == "1/2/2007" | Date == "2/2/2007"]
  
  # ... and remove the original dataset from the memory
    rm(DT.raw)
  
  # replace "?" cells with NA (looks strange but works fine!)
    is.na(DT) <- DT == "?" 
  
  
  # convert the data types
    DT$Time <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")
    DT$Date <- as.Date(DT$Date,  format="%d/%m/%Y")
  
  # cols 3:9 are numeric, so we can do it in a cycle
    for (col in 3:9) set(DT, j=col, value=as.numeric(DT[[col]]))
  
  # return the resultset
    return(DT)
}
