
import.houshold.power.data <- function() {
    
    # Take the Zip and process it
    if ( !file.exists("household_power_consumption.txt") ) {
        unzip("exdata-data-household_power_consumption.zip")
    }
    
    # Try to load it from file cache first
    cache.file <- "filtered_household_power_consumption.rda"
    
    if ( file.exists(cache.file) ) {
        message("Loading from cached data")
        load("filtered_household_power_consumption.rda")
        return(imported.data)
    }
    
    # Column classes for the imported data
    col.classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    
    # Start and end date for the range we care about
    start.date = as.Date("2007-02-01");
    end.date   = as.Date("2007-02-02");
    
    # Import the data with the correct column classes, separator, and na.string
    imported.data <- read.csv("household_power_consumption.txt", colClasses=col.classes, sep=";", na.strings="?")
    
    # Convert the date and time to the appropriate classes
    imported.data$Date <- as.Date(imported.data$Date,"%d/%m/%Y") 
    imported.data$Time <- as.POSIXct(paste(imported.data$Date, imported.data$Time), format="%Y-%m-%d %H:%M:%S")
    
    # Filter the data by date and return that
    imported.data <- imported.data[imported.data$Date >= start.date & imported.data$Date <= end.date,]
    
    # Save it so we don't need to reprocess every time
    save(imported.data, file=cache.file)
    
    return(imported.data)
}