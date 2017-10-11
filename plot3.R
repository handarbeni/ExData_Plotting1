### Read Raw Data
df_household_power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df_household_power_consumption$Date <- as.Date(df_household_power_consumption$Date, format = '%d/%m/%Y')
df_household_power_consumption$Datetime <- strptime(paste(df_household_power_consumption$Date, df_household_power_consumption$Time), format = '%Y-%m-%d %H:%M:%S')
str(df_household_power_consumption)

### Subset needed data
df_household_power_consumption_selected <- subset(df_household_power_consumption, Date > '2007-01-31' & Date < '2007-02-03')

### Create histogram for global active power column
png("plot3.png", width = 480, height = 480, units = "px")
with(df_household_power_consumption_selected, plot(Datetime, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering"))
with(df_household_power_consumption_selected, lines(Datetime, Sub_metering_2, type = "l", col="red"))
with(df_household_power_consumption_selected, lines(Datetime, Sub_metering_3, type = "l", col="blue"))
with(df_household_power_consumption_selected, legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, lwd = 1))
dev.off()
