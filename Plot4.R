power.data=read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Formatting Date and taking interval from 2007-02-01 to 2007-02-02
power.data$Date=as.Date(power.data$Date,format="%d/%m/%Y")
part=subset(power.data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
temp=paste(as.character(sub$Date),as.character(sub$Time),sep=" ")
time=strptime(temp,format="%Y-%m-%d %H:%M")
part$Time=time
for (i in 3:9)
{
  part[,i]=as.numeric(as.character(part[,i]))
}

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(part, {
  plot(Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2,col='Red')
  lines(Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

