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


### Values of the "Sub_metering_1", "Sub_metering_2" and "Sub_metering_3"--variables.
y1 <- as.numeric(as.character(data$Sub_metering_1))
y2 <- as.numeric(as.character(data$Sub_metering_2))
y3 <- as.numeric(as.character(data$Sub_metering_3))


### Graphs.
plot(c(x,x,x),c(y1,y2,y3), 
     type ='n',
     xlab ='', 
     ylab = 'Energy sub metering',cex.lab=0.75, cex.axis=0.75)

points(x,y1,type='l')
points(x,y2,col='red',type='l')
points(x,y3,col='blue',type='l')

legend('topright',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),
       lty=1, pt.cex=1, cex=0.75)


