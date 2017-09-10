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

## Plot line graph of datetime against Global Active Power (kilowatts)
## Line graph so we will plot using type = "1"
## y-axis is "Global Active Power (kilowatts)"

with(data, plot(Global_active_power ~ Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))


## The graph looks pretty, We shall save it
## PNG file with a width of 480 pixels and a height of 480 pixels

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()


