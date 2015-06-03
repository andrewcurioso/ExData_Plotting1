# For simplicity I put data loading in a seperate file
# since it is shared by all graphs

source("import.R")

# Load the data

data <- import.houshold.power.data()

# Open a PNG graphics device with the proper width/height and background

png(file="plot2.png", width=504, height=504, bg="transparent")

# Draw the line graph with the correct labels

plot(data$Time, data$Global_active_power,
     ylab="Global Active Power (kilowatts)", xlab="",
     type = "l")

# Don't forget to close the device

dev.off()