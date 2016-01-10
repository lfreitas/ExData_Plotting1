# For each plot you should
# 
# 1. Construct the plot and save it to a PNG file with a width of 480 pidfels and
# a height of 480 pidfels.
# 2. Name each of the plot files as plot1.png, plot2.png, etc.
# 3. Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the 
# corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your 
# code file should include code for reading the data so that the plot can be 
# fully reproduced. You must also include the code that creates the PNG file.
# 4. Add the PNG file and R code file to the top-level folder of your git 
# repository (no need for separate sub-folders)
#
# When you are finished with the assignment, push your git repository to GitHub
# so that the GitHub version of your repository is up to date. There should be 
# four PNG files and four R code files, a total of eight files in the top-level 
# folder of the repo.

library(lubridate)

setwd("C:/Users/luiz/Google Drive/Coursera/exploratorydataanalysis")

df <- read.delim("household_power_consumption.txt", 
                 sep = ";",
                 header = T)
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$datetime <-dmy_hms(paste(df$Date, df$Time))
df$Date <- as.Date(df$datetime)
df$Time <- as.POSIXct(df$Time, format="%H:%M:%S")
df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

png("plot3.png", width = 480, height = 480)
plot(df$Sub_metering_1, 
     type = "l",
     xaxt = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(df$Sub_metering_2, 
     type = "l",
     xaxt = "n",
     col = "red")
lines(df$Sub_metering_3, 
     type = "l",
     xaxt = "n",
     col = "blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1),
       col = c("black", "red", "blue"))
axis(1, at = c(0,1440, 2880), labels = c("Thurs", "Fri", "Sat"))
dev.off()