#Load the data into a data frame
PowerConsumption <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
head(PowerConsumption)
class(PowerConsumption)
#Subset one day's worth of data
OneDay<-PowerConsumption[PowerConsumption$Date=="1/2/2007" | PowerConsumption$Date=="2/2/2007",]

class(as.numeric(OneDay$Global_active_power))
#Convert date to dd/mm/yyyy format
OneDay <- as.Date(OneDay$Date,format="%d/%m/%Y")
#Create a new column in dataframe by pasting date with time
OneDay$DateTime<-strptime(paste(OneDay$Date,OneDay$Time),"%d/%m/%Y %H:%M:%S")
par(mar=c(4,4,2,2))
  plot(OneDay$DateTime,OneDay$Sub_metering_1,xlab ="", ylab = "Energy sub metering", 
     type ="l",col = 'black')
  lines(OneDay$DateTime,OneDay$Sub_metering_2, col="red")
  lines(OneDay$DateTime,OneDay$Sub_metering_3, col="blue")
  #Add Legend with reduced font size
legend("topright", col = c("black", "red", "blue"), lty= 1, inset = .05, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , cex = 0.6)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
## Close the PNG device!
dev.off() 
