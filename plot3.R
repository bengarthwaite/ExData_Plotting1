plot3 <- function() {
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
     plot(datetime, Sub_metering_1
     ,type = "l"
     ,xlab = ""
     ,ylab = "Energy sub metering"
     )
)
with(hpc, points(datetime, Sub_metering_2, col = "red",type = "l"))
with(hpc, points(datetime, Sub_metering_3, col = "blue",type = "l"))
legend("topright"
       ,lty = 1
       ,col = c("black","red","blue")
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )

## Create as file
png(file = "plot3.png") 
with(hpc, 
     plot(datetime, Sub_metering_1
          ,type = "l"
          ,xlab = ""
          ,ylab = "Energy sub metering"
     )
)
with(hpc, points(datetime, Sub_metering_2, col = "red",type = "l"))
with(hpc, points(datetime, Sub_metering_3, col = "blue",type = "l"))
legend("topright"
       ,lty = 1
       ,col = c("black","red","blue")
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.off()
}
