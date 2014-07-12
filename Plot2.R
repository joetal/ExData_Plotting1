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
png(filename="plot2.png", width=480, height=480, units="px")
plot(part$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(part)/2), nrow(part)), labels=c("Thu", "Fri", "Sat"))
dev.off()

