##creating a png file
png("plot4.png",480,480)

#loading the dataset
dataset <- read.csv("C:/Users/HP/Downloads/Compressed/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subset<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
subset$Date<-as.Date(subset$Date)

par(mfrow=c(2,2))

dataset$datetime<-paste(dataset$Date,dataset$Time,sep=" ")

library(lubridate)

dataset$datetime<-dmy_hms(dataset$datetime)

#subset
subset2<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
plot(subset2$datetime,subset2$Global_active_power,xlab=" ",ylab="Global Active Power(killowatts)",type="l")

plot(subset2$datetime,subset2$Voltage,type="l",xlab = "datetime",ylab = "voltage")

plot(subset2$datetime,subset$Sub_metering_1,type="l",xlab=" ",ylab = "energy sub metering",main="Energy sub metering")
points(subset2$datetime,subset2$Sub_metering_2,col="red",type="l")
points(subset2$datetime,subset$Sub_metering_3,col="blue",type="l")
legend("topright",lty = 1,col= c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(subset2$datetime,subset$Global_reactive_power,xlab = "datetime",ylab="Global_reactive _power",type="l")

dev.off()