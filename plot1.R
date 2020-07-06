
library(data.table)

## Read file
## Leer archivo
DT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")


## Change the date format
## Cambiar el formato de fecha
DT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


## Filter Dates for 2007-02-01 and 2007-02-02
## Filtrar fechas para 2007-02-01 y 2007-02-02
DT <- DT[(Date >= "2007-02-01") & (Date < "2007-02-03")]
## Another way
## Otra forma
## DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")

## Create png
## Crear png
png("plot1.png", width=480, height=480)

## Plot 1
hist(DT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Close png
## Cerrar png
dev.off()