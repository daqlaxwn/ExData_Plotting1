tmp<-read.table(file="household_power_consumption.txt",header=TRUE,sep = ";",stringsAsFactors=FALSE,
                na.strings="?")
tmp1<-tmp[tmp$Date=="1/2/2007"|tmp$Date=="2/2/2007",]
rm(tmp)
tmp1$Date<-as.Date(tmp1$Date,"%d/%m/%Y")
tmp1$Time1<-strptime(paste(tmp1[,1],tmp1[,2]),"%Y-%m-%d %H:%M:%S")
png(filename="plot3.png",width=480,height=480,units="px")
with(tmp1,{
    plot(Time1,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
    lines(Time1,Sub_metering_2,col="red")
    lines(Time1,Sub_metering_3,col="blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty=c(1,1,1))
})
dev.off()