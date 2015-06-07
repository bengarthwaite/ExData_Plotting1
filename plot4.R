plot4 <- function() {
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
par(mfrow = c(2, 2))
with(hpc,
        plot(datetime, Global_active_power
             ,type = "l"
             ,xlab = ""
             ,ylab = "Global Active Power (kilowatts)"
        )
)
with(hpc,
     plot(datetime, Voltage
          ,type = "l"
     )
)
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
with(hpc,
     plot(datetime, Global_reactive_power
          ,type = "l"
     )
)

## Create as file
png(file = "plot4.png") 
par(mfrow = c(2, 2))
with(hpc,
     plot(datetime, Global_active_power
          ,type = "l"
          ,xlab = ""
          ,ylab = "Global Active Power (kilowatts)"
     )
)
with(hpc,
     plot(datetime, Voltage
          ,type = "l"
     )
)
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
with(hpc,
     plot(datetime, Global_reactive_power
          ,type = "l"
     )
)
dev.off()
}
