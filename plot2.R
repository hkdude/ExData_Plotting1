library("sqldf")

setwd("/Users/IDNinvestors2/Desktop/Data Science - Exploratory Data Analysis")

filename <- ("household_power_consumption.txt")

query <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
df <- read.csv2.sql(filename, query)

# Plot 2, line chart
df1 <- data.frame(df$Date, df$Time, df$Global_active_power)

# df1$df.Date <- as.Date(as.character(df1$df.Date), "%d/%m/%Y")

df1$df.Date <- as.character(df1$df.Date)

df1$df.Time <- as.character(df1$df.Time)

DateTime <- as.POSIXct(strptime(paste(df1$df.Date,df1$df.Time), format='%d/%m/%Y %H:%M:%S'))

df2 <- cbind(df1,DateTime)

plot(df2$DateTime, df2$df.Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")

dev.copy(png, filename="plot2.png", height=480, width=480, bg="white")
dev.off()
