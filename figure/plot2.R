#----------------------------------------------------------------------------
# This is the R code for making the plot #2 belonging to the course project in Coursera "Exploratory Data Analysis"
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
#plotting a line plot on screen
plot(exdata2007Feb$datetime, exdata2007Feb$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', lty='solid', type='l')
#
# printing the line plot to a PNG file
png(filename='plot2.png', width=480, height=480)
plot(exdata2007Feb$datetime, exdata2007Feb$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', lty='solid', type='l')
dev.off()
