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
png(filename="plot3.png", width=480, height=480, units="px")
with(part, {
  plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(x=Sub_metering_2, col="red")
  lines(x=Sub_metering_3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(part)/2), nrow(part)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

