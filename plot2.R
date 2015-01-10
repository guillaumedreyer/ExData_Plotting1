### Load the data from the source file "household_power_consumption.txt".
DATA <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep =';')


### Collect the data for the two dates February 1rst and 2nd, 2007.
data <- rbind(DATA[DATA[1]=='1/2/2007',], 
              DATA[DATA[1]=='2/2/2007',])


### Sequence of date-times corresponding to each measurement.
size <- nrow(data)
x <- seq(as.POSIXct(paste(as.Date(data$Date[1],format='%d/%m/%Y'),
                          data$Time[1])),
         as.POSIXct(paste(as.Date(data$Date[size],
        format='%d/%m/%Y'),data$Time[size])),by = "min")


### Values of the "Global_active_power"--variable.
y <- as.numeric(as.character(data$Global_active_power))


### Graph.
plot(x,y,type="l", 
     xlab ='', 
     ylab = 'Global Active Power (kilowatts)',
     cex.lab=0.75, cex.axis=0.75)




