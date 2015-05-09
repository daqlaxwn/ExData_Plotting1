tmp<-read.table(file="household_power_consumption.txt",header=TRUE,sep = ";",stringsAsFactors=FALSE,
                na.strings="?")
tmp1<-tmp[tmp$Date=="1/2/2007"|tmp$Date=="2/2/2007",]
rm(tmp)
tmp1$Date<-as.Date(tmp1$Date,"%d/%m/%Y")
tmp1$Time1<-strptime(paste(tmp1[,1],tmp1[,2]),"%Y-%m-%d %H:%M:%S")
png(filename="plot1.png",width=480,height=480,units="px")
with(tmp1,hist(Global_active_power,main="Global Active Power",
               xlab="Global Acitve Power (kilowatts)",col="red"))
dev.off()