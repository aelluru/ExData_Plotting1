#Load the data into a data frame
PowerConsumption <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
head(PowerConsumption)
class(PowerConsumption)
#Subset data
OneDay<-PowerConsumption[PowerConsumption$Date=="1/2/2007" | PowerConsumption$Date=="2/2/2007",]
?hist
class(as.numeric(OneDay$Global_active_power))
dev.new()
dev.cur()
dev.new()
#Create a hist with labels
hist(as.numeric(OneDay$Global_active_power), xlab="Global Active Power (Kilowatts)", ylab = "Frequency", main = "Gloabl Active Power", col = "red")
#Copy plot to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
## Close the PNG device!
dev.off() 
