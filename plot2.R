#creating the png file
png("plot2.png",width = 480,height=480)

#loading the dataset
dataset <- read.csv("C:/Users/HP/Downloads/Compressed/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#creating a subset
subset<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
subset$Date<-as.Date(subset$Date)

#concatenate date and time
dataset$datetime<-paste(dataset$Date,dataset$Time,sep=" ")

library(lubridate)

#converting it to date and time
dataset$datetime<-dmy_hms(dataset$datetime)

# subsetting
subset2<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
plot(subset2$datetime,subset2$Global_active_power,xlab=" ",ylab="Global Active Power(killowatts)",type="l")
 dev.off()
