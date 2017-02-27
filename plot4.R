#------------------------------------------------------------------------------#
#                        DAMIEN DOS SANTOS LUIS                                #
#               EXPLORATORY ANALYSIS COURSE ON COURSERA                        #
#                         ASSIGNMENT 1 - plot 4                                #
#                               27-02-17                                       #
#------------------------------------------------------------------------------#

# To execute, first load the script into R as follow : source("plot4.R")
# Then, launch the function to create and save the plot as png : plot4()

plot4 <- function() {
        data <- read.table(file = 'household_power_consumption.txt', sep = ";", header = TRUE, na.strings = "?", 
                           colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
        
        # Convert data types : handling dates
        data["Date"] <- as.Date(data$Date, format = "%e/%m/%Y")
        data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
        data2["timestamp"] <- as.POSIXct(strptime(paste0(data2$Date, " ", data2$Time), format = "%F %T"))
        
        # Plotting the fourth plot
        png(filename = "Rplot4.png", width = 480, height = 480, units = "px")
        par(mfrow = c(2, 2))
        #graph 1
        with(data2, plot(Global_active_power ~ timestamp, type = "l", xlab = "",
                         ylab = "Global Active Power"))
        
        # graph 2
        with(data2, plot(Voltage ~ timestamp, type = "l", xlab = "datetime",
                         ylab = "Voltage"))
        
        # graph 3
        with(data2, {
                plot(Sub_metering_1 ~ timestamp, type = "l", xlab = "", ylab = "Energy sub metering")
                lines(Sub_metering_2 ~ timestamp, col = "Red")
                lines(Sub_metering_3 ~ timestamp, col = "Blue")
        })
        legend("topright", lty = 1, col = c("black", "blue", "red"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        
        # graph 4
        with(data2, plot(Global_reactive_power ~ timestamp, type = "l", xlab = "datetime",
                         ylab = "Global_reactive_power"))
        #axis(side = 1, at = wday(data2$Date, label=TRUE))
        
        dev.off()
        
}