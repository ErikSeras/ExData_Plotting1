
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
png("plot2.png", width=480, height=480)

## Plot 2
plot(
        x = DT[,dateTime],
        y = DT[,Global_active_power],
        type = "l", xlab = "",
        ylab = "Global Active Power (kilowatts)"
)

## Close png
## Cerrar png
dev.off()

