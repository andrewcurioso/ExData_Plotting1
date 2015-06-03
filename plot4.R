# For simplicity I put data loading in a seperate file
# since it is shared by all graphs

source("import.R")

# Load the data

data <- import.houshold.power.data()

# Open a PNG graphics device with the proper width/height and background    

png(file="plot4.png", width=504, height=504, bg="transparent")

# Set the columns and rows

par(mfcol = c(2,2))

# Plot the upper left quadrant

plot(data$Time, data$Global_active_power,
     ylab="Global Active Power", xlab="",
     type = "l")

# Plot the lower left quadrant

plot(data$Time, data$Sub_metering_1,
     ylab="Energy sub metering", xlab="",
     type = "l")

lines(data$Time, data$Sub_metering_2, col="red")

lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1, bty="n")

# Plot the upper right quadrant

plot(data$Time, data$Voltage,
     ylab="Voltage", xlab="datetime",
     type = "l")

# Plot the lower right quadrant

plot(data$Time, data$Global_reactive_power,
     ylab="Global_reactive_power", xlab="datetime",
     type = "l")

# Don't forget to close the device

dev.off()
