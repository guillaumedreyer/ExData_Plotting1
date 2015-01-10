### Load the data from the source file "household_power_consumption.txt".
DATA <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep =';')

### Collect the data for the two dates February 1rst and 2nd, 2007.
data <- rbind(DATA[DATA[1]=='1/2/2007',], 
              DATA[DATA[1]=='2/2/2007',])

### Histogram displaying frequency for the values of the "Global_active_power" variable.
hist(as.numeric(as.character(data$Global_active_power)), 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency', 
     col='red', cex.lab=0.75, cex.axis=0.75)