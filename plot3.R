# plot3.R - Coursera exploratory data analysis - Project 1
# https://github.com/rdpeng/ExData_Plotting1

setwd("~/Desktop/20150400_ExplDataAnalysis/projects/project1/ExData_Plotting1/")

# load data from file and convert columns to proper classes
#   create DateTime POSIXlt column
fd <- read.table("../household_power_consumption.txt", header=T, sep=";",
		 colClasses=c(rep("character", 2), rep("numeric", 7)),
		 na.strings="?")

fd$DateTime <- paste(fd$Date, fd$Time)
fd$DateTime <- strptime(fd$DateTime, "%d/%m/%Y %H:%M:%S")

fd$Date <- as.Date(fd$Date, "%d/%m/%Y")

# subset to 2007-02-01/2007-02-02 rows
fd.sub <- subset(fd, Date=="2007-02-01" | Date=="2007-02-02")


# plot
png("plot3.png")
plot(fd.sub$DateTime, fd.sub$Sub_metering_1, type="l", main="",
     xlab="", ylab="Energy sub metering")
lines(fd.sub$DateTime, fd.sub$Sub_metering_2, type="l", col="red")
lines(fd.sub$DateTime, fd.sub$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
dev.off()





