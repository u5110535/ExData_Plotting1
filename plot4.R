# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot,
# Your code file should include code for reading the data so that the plot can be fully reproduced.

## Load the data that was save in project "coursera" folder

data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## Convert the Date and Time variables to Date/Time classes in R using the as.Date() functions.

data$Date <-as.Date(data$Date, format="%d/%m/%Y")

## We will only be using data from the dates 2007-02-01 and 2007-02-02.

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates and times

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## plot we want 4 graph 2X2, 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## First plot from plot2.R
## Second plot Volatage against Datetime
## Third plot from plot3.R
## Forth plot global reactive power against Datetime

with(data, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

## The graph produced from Rstudion has problem.
## The legend in graph3 was not in the right position.
## So I read the forum and one of the students said to use R instead and it works just fine.
## So I copy all the codes and paste in R. I get perfect graph.
## Save in PNG file with a width of 480 pixels and a height of 480 pixels

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off() 
