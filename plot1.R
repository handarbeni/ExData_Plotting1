### Read Raw Data
df_household_power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df_household_power_consumption$Date <- as.Date(df_household_power_consumption$Date, format = '%d/%m/%Y')
df_household_power_consumption$Datetime <- strptime(paste(df_household_power_consumption$Date, df_household_power_consumption$Time), format = '%Y-%m-%d %H:%M:%S')
str(df_household_power_consumption)

### Subset needed data
df_household_power_consumption_selected <- subset(df_household_power_consumption, Date > '2007-01-31' & Date < '2007-02-03')

### Create histogram for global active power column
png("plot1.png", width = 480, height = 480, units = "px")
hist(df_household_power_consumption_selected$Global_active_power, main = "Global Active Power", col = "red", xlab="Global Active Power (kilowatts)")
dev.off()