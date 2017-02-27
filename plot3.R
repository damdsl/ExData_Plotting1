#------------------------------------------------------------------------------#
#                        DAMIEN DOS SANTOS LUIS                                #
#               EXPLORATORY ANALYSIS COURSE ON COURSERA                        #
#                         ASSIGNMENT 1 - plot 3                                #
#                               27-02-17                                       #
#------------------------------------------------------------------------------#

# To execute, first load the script into R as follow : source("plot3.R")
# Then, launch the function to create and save the plot as png : plot3()

plot3 <- function() {
        data <- read.table(file = 'household_power_consumption.txt', sep = ";", header = TRUE, na.strings = "?", 
                           colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
        
        # Convert data types : handling dates
        data["Date"] <- as.Date(data$Date, format = "%e/%m/%Y")
        data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
        data2["timestamp"] <- as.POSIXct(strptime(paste0(data2$Date, " ", data2$Time), format = "%F %T"))
        
        # Plotting the third plot
        png(filename = "Rplot3.png", width = 480, height = 480, units = "px")
        with(data2, {
                plot(Sub_metering_1 ~ timestamp, type = "l", xlab = "", ylab = "Energy sub metering")
                lines(Sub_metering_2 ~ timestamp, col = "Red")
                lines(Sub_metering_3 ~ timestamp, col = "Blue")
        })
        axis(side = 1, at = wday(data2$Date, label=TRUE))
        legend("topright", pch = 1, col = c("black", "blue", "red"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        
}