#----------------------------------------------------------------------------
# This is the R code for making the plot #4 belonging to the course project in Coursera "Exploratory Data Analysis"
#
#Note: You must place the raw data text file (household_power_consumption.txt) into your current work directory in R. If you do not do this, the following code will not work.
#
#----------------------------------------------------------------------------
#
# defining the path to the current work directory. The unzipped raw data file "household_power_consumption.txt" must be located in this working directory
path <- getwd()
#
# creating a new data frame "power" by reading the raw data into R
power <- read.csv(paste(path, '/', 'household_power_consumption.txt', sep=''), sep=";", stringsAsFactors=FALSE, na.strings="?")
#
# converting the original strings in the "Date" and "Time" columns into a single vector with POSIXct time format
datetime <- strptime(paste(power[,1], power[,2]), format='%d/%m/%Y %H:%M:%S')
#
# creating a new data frame by appending the "datetime" column vector to the original data file named "power"
exdata <- data.frame(datetime, power)
#
#extracting a data subset of a two days period, i.e from 2007-02-01 00:00:01 CET to 2007-02-02 23:59:59 CET
exdata2007Feb <- exdata[exdata$datetime >= '2007-02-01 00:00:01 CET' & exdata$datetime <= '2007-02-02 23:59:59 CET', ]
#
#plotting 4 different line plots in a 2x2 matrix on screen
par(mfrow=c(2, 2), mar=c(4.1, 4.1, 4.1, 2.1))
with(exdata2007Feb, {
  plot(exdata2007Feb$datetime, exdata2007Feb$Global_active_power, xlab='', ylab='Global Active Power', lty='solid', type='l')
  plot(exdata2007Feb$datetime, exdata2007Feb$Voltage, xlab='datetime', ylab='Voltage', lty='solid', type='l')
  plot(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_1, xlab='', ylab='Energy sub metering', lty='solid', type='n')
  points(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_1, type='l')
  points(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_2, type='l', col='red')
  points(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_3, type='l', col='blue')
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty='solid', col=c('black', 'red', 'blue'), bty='n')
  plot(exdata2007Feb$datetime, exdata2007Feb$Global_reactive_power, ylim=c(0, 0.5), xlab='datetime', ylab='Global_reactive_power', lty='solid', type='l', yaxp=c(0, 0.5, 5))
})
#
# printing 4 different line plots in a 2x2 matrix to a PNG file
png(filename='plot4.png', width=480, height=480)
par(mfrow=c(2, 2), mar=c(4.1, 4.1, 4.1, 2.1))
with(exdata2007Feb, {
  plot(exdata2007Feb$datetime, exdata2007Feb$Global_active_power, xlab='', ylab='Global Active Power', lty='solid', type='l')
  plot(exdata2007Feb$datetime, exdata2007Feb$Voltage, xlab='datetime', ylab='Voltage', lty='solid', type='l')
  plot(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_1, xlab='', ylab='Energy sub metering', lty='solid', type='n')
  points(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_1, type='l')
  points(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_2, type='l', col='red')
  points(exdata2007Feb$datetime, exdata2007Feb$Sub_metering_3, type='l', col='blue')
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty='solid', col=c('black', 'red', 'blue'), bty='n')
  plot(exdata2007Feb$datetime, exdata2007Feb$Global_reactive_power, ylim=c(0, 0.5), xlab='datetime', ylab='Global_reactive_power', lty='solid', type='l', yaxp=c(0, 0.5, 5))
})
dev.off()