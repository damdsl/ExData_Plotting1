#------------------------------------------------------------------------------#
#                        DAMIEN DOS SANTOS LUIS                                #
#               EXPLORATORY ANALYSIS COURSE ON COURSERA                        #
#                         ASSIGNMENT 1 - plot 2                                #
#                               27-02-17                                       #
#------------------------------------------------------------------------------#

# To execute, first load the script into R as follow : source("plot2.R")
# Then, launch the function to create and save the plot as png : plot2()

plot2 <- function() {
        data <- read.table(file = 'household_power_consumption.txt', sep = ";", header = TRUE, na.strings = "?", 
                           colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

        # Convert data types : handling dates
        data["Date"] <- as.Date(data$Date, format = "%e/%m/%Y")
        data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
        data2["timestamp"] <- as.POSIXct(strptime(paste0(data2$Date, " ", data2$Time), format = "%F %T"))
        
        # Plotting the second plot
        library(lubridate)
        png(filename = "Rplot2.png", width = 480, height = 480, units = "px")
        with(data2, plot(Global_active_power ~ timestamp, type = "l", xlab = "",
                         ylab = "Global Active Power (KiloWatts)"))
        axis(side = 1, at = wday(data2$Date, label=TRUE))
        dev.off()

}