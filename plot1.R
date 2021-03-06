# For each plot you should
# 
# 1. Construct the plot and save it to a PNG file with a width of 480 pixels and
# a height of 480 pixels.
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
df$datetime <-dmy_hms(paste(df$Date, df$Time))
df$Date <- as.Date(df$datetime)
df$Time <- as.POSIXct(df$Time, format="%H:%M:%S")
df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]
breaks <- seq(0,6000,500)

png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()

