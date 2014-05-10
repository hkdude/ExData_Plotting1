library("sqldf")

setwd("/Users/IDNinvestors2/Desktop/Data Science - Exploratory Data Analysis")

filename <- ("household_power_consumption.txt")

query <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
df <- read.csv2.sql(filename, query)

# Plot 1, bar chart
g_a_p <- df$Global_active_power

hist(g_a_p, main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, filename="plot1.png", height=480, width=480, bg="white")
dev.off()