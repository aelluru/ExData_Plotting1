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
OneDay$DateEime<-strptime(paste(OneDay$Date,OneDay$Time),"%d/%m/%Y %H:%M:%S")
dev.new()
#Set the plot margin
par(mar=c(5,5,2,2))
plot(OneDay$DateEime,OneDay$Global_active_power,xlab ="", ylab = "Global Active Power (kilowatts)", type ="l")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
## Close the PNG device!
dev.off() 
