library("sqldf")

setwd("/Users/IDNinvestors2/Desktop/Data Science - Exploratory Data Analysis")

filename <- ("household_power_consumption.txt")

query <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
df <- read.csv2.sql(filename, query)

# 4 charts on one page
par(mfrow=c(2,2))

# top left, Plot 2, line chart
df1 <- data.frame(df$Date, df$Time, df$Global_active_power, df$Voltage, df$Global_reactive_power, df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3)

df1$df.Date <- as.character(df1$df.Date)

df1$df.Time <- as.character(df1$df.Time)

DateTime <- as.POSIXct(strptime(paste(df1$df.Date,df1$df.Time), format='%d/%m/%Y %H:%M:%S'))

df2 <- cbind(df1,DateTime)

plot(df2$DateTime, df2$df.Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")

# top right

plot(df2$DateTime, df2$df.Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3, 3 lines on one chart

plot(df2$DateTime, df2$df.Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df2$DateTime, df2$df.Sub_metering_2, type="l", col="red")
lines(df2$DateTime, df2$df.Sub_metering_3, type="l", col="blue")

legend(x="topright", 1, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1),lwd=c(1,1,1),col=c("black","red", "blue"))

# bottom right

plot(df2$DateTime, df2$df.Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, filename="plot4.png", height=480, width=480, bg="white")
dev.off()