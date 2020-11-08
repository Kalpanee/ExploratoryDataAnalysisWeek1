#creating png file
png("plot3.png",height=480,width=480)

#loading the dataset
dataset <- read.csv("C:/Users/HP/Downloads/Compressed/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subset
subset<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
subset$Date<-as.Date(subset$Date)

#concatenate date and time
dataset$datetime<-paste(dataset$Date,dataset$Time,sep=" ")

library(lubridate)

#converting it to date and time
dataset$datetime<-dmy_hms(dataset$datetime)

# subsetting
subset2<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]

#plot the muliple graph
plot(subset2$datetime,subset$Sub_metering_1,type="l",main="Energy sub metering",ylab="Energy sub metering",xlab=" ")
 points(subset2$datetime,subset2$Sub_metering_2,col="red",type="l")
 points(subset2$datetime,subset$Sub_metering_3,col="blue",type="l")
 legend("topright",lty=1,col= c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 dev.off()