# For simplicity I put data loading in a seperate file
# since it is shared by all graphs

source("import.R")

# Load the data

data <- import.houshold.power.data()

# Open a PNG graphics device with the proper width/height and background

png(file="plot3.png", width=504, height=504, bg="transparent")

# Draw the line graph with the correct labels, colors, and legend

plot(data$Time, data$Sub_metering_1,
     ylab="Energy sub metering", xlab="",
     type = "l")

lines(data$Time, data$Sub_metering_2, col="red")

lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1)

# Don't forget to close the device

dev.off()