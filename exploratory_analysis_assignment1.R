#------------------------------------------------------------------------------#
#                        DAMIEN DOS SANTOS LUIS                                #
#               EXPLORATORY ANALYSIS COURSE ON COURSERA                        #
#                             ASSIGNMENT 1                                     #
#                               27-02-17                                       #
#------------------------------------------------------------------------------#


setwd(dir = "C:\\Users\\dds\\Documents\\Cours\\Coursera\\DS_specialization\\4-exploratory_analysis\\Week1\\assignments")


files <- list.files()
data <- read.table(file = files[2], sep = ";", header = TRUE, na.strings = "?", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
str(data)
summary(data)

# Convert data types : handling dates
data["Date"] <- as.Date(data$Date, format = "%e/%m/%Y")
data2 <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data2["timestamp"] <- as.POSIXct(strptime(paste0(data2$Date, " ", data2$Time), format = "%F %T"))


# Plotting the first plot
png(filename = "Rplot1.png", width = 480, height = 480, units = "px")
hist(data2$Global_active_power, xlab = "Global Active Power (KiloWatts)", ylab = "Frequency",
     main = "Global Active Power", col = "red")
dev.off()

# Plotting the second plot
library(lubridate)
png(filename = "Rplot2.png", width = 480, height = 480, units = "px")
with(data2, plot(Global_active_power ~ timestamp, type = "l", xlab = "",
                 ylab = "Global Active Power (KiloWatts)"))
axis(side = 1, at = wday(data2$Date, label=TRUE))
dev.off()

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
legend("topright", pch = "-", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# graph 4
with(data2, plot(Global_reactive_power ~ timestamp, type = "l", xlab = "datetime",
                 ylab = "Global_reactive_power"))
#axis(side = 1, at = wday(data2$Date, label=TRUE))

dev.off()











