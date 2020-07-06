
library(data.table)

## Read file
## Leer archivo
DT <- data.table::fread(input = "household_power_consumption.txt"
                        , na.strings="?")

## Combine date and time
## Combinar la fecha y el tiempo
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


## Filter Dates for 2007-02-01 and 2007-02-02
## Filtrar fechas para 2007-02-01 y 2007-02-02 
DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

## Create png
## Crear png
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

## Plot 1
plot(DT[, dateTime], DT[, Global_active_power], type = "l",
     xlab="", ylab="Global Active Power")

## Plot 2
plot(DT[, dateTime], DT[,Voltage], type = "l",
     xlab="datetime", ylab="Voltage")

# Plot 3
plot(DT[, dateTime], DT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(DT[, dateTime], DT[, Sub_metering_2], col="red")
lines(DT[, dateTime], DT[, Sub_metering_3],col="blue")
legend(
        "topright", col=c("black","red","blue"),
        c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1),
        lwd = c(2,2),
        bty="n",
        cex=.5
)

# Plot 4
plot(DT[, dateTime], DT[,Global_reactive_power], type="l",
     xlab="datetime", ylab="Global_reactive_power")


## Close png
## Cerrar png
dev.off()











