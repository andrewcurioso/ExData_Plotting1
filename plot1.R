# For simplicity I put data loading in a seperate file
# since it is shared by all graphs

source("import.R")

# Load the data

data <- import.houshold.power.data()

# Open a PNG graphics device with the proper width/height and background

png(file="plot1.png", width=504, height=504, bg="transparent")

# Draw the histogram with the correct labels and color

hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col="red")

# Don't forget to close the device

dev.off()