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

## Plot Sub_metering_1 ~ Datetime in black
## layer with Sub_metering_2 ~ Datetime in red
## layer with Sub_metering_3 ~ Datetime in blue

with(data, plot(Sub_metering_1 ~ Datetime,type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(data, lines(Sub_metering_2 ~ Datetime,type="l", col='Red',))
with(data, lines(Sub_metering_3 ~ Datetime,type="l", col='Blue',))

## Create legend position topright, show color of each graph, linetype1, linewidth2

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## The graph looks pretty, We shall save it
## PNG file with a width of 480 pixels and a height of 480 pixels

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()


