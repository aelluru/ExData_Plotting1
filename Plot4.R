#Load the data into a data frame
PowerConsumption <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
head(PowerConsumption)
class(PowerConsumption)
#Subset data
OneDay<-PowerConsumption[PowerConsumption$Date=="1/2/2007" | PowerConsumption$Date=="2/2/2007",]

class(as.numeric(OneDay$Global_active_power))
#Convert date to dd/mm/yyyy format
OneDay <- as.Date(OneDay$Date,format="%d/%m/%Y")
#Create a new column in dataframe by pasting date with time
OneDay$DateTime<-strptime(paste(OneDay$Date,OneDay$Time),"%d/%m/%Y %H:%M:%S")


dev.new()
dev.cur()
dev.new()

#create a 2 by 2 plots and draw them
par(mfrow= c(2,2))
plot(OneDay$DateTime,OneDay$Global_active_power, xlab ="", ylab="Global Active Power", type="l")
plot(OneDay$DateTime,OneDay$Voltage, xlab ="datetime", ylab="Voltage", type="l")
plot(OneDay$DateTime,OneDay$Sub_metering_1,xlab ="", ylab = "Energy sub metering", 
     type ="l",col = 'black')
lines(OneDay$DateTime,OneDay$Sub_metering_2, col="red")
lines(OneDay$DateTime,OneDay$Sub_metering_3, col="blue")
#Add Legend with reduced font size
legend("topright", col = c("black", "red", "blue"), lty= 1, inset = .05, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(OneDay$DateTime,OneDay$Global_reactive_power, xlab ="datetime", ylab="Global_reactive_power", type="l")

#Copy to a png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
## Close the PNG device!
dev.off() 
