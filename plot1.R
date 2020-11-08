#creating the png file
png(file="plot1.png",width=480,height = 480)

#loading the dataset
dataset <- read.csv("C:/Users/HP/Downloads/Compressed/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
head(dataset)

 #subsetting the dataset
subset<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
subset$Date<-as.Date(subset$Date)
class(subset$Date)

#plotting 
hist(subset$Global_active_power,xlab = "Global Active Power(killowats)",main = "Global Active Power",col="red")

dev.off()
