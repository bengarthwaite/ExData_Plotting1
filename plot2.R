plot2 <- function() {
## Read main data set
hpc <- read.csv("~/Coursework/data/household_power_consumption.txt", sep=";", na.strings="?")

## Add a Datetime column
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
##hpc <- cbind(datetime = strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"),hpc)
## Convert Date column to Date datatype
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")

## Subset just required dates
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date < "2007-02-03",]

##View(hpc)

## Create Plot
with(hpc, 
     plot(datetime, Global_active_power
     ,type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)"
     )
)

## Create as file
png(file = "plot2.png") 
with(hpc, 
     plot(datetime, Global_active_power
          ,type = "l"
          ,xlab = ""
          ,ylab = "Global Active Power (kilowatts)"
     )
)
dev.off()
}
