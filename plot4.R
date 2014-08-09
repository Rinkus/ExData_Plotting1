#download and getting the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "dataset.zip")
filelist <- unzip("dataset.zip")

#read the dataset
dat <- read.table(filelist, sep = ";", nrows = 2880, skip = 66637)
datnames <- read.table(filelist, header = T, sep = ";", nrows = 1) #to get the column names
names(dat) <- names(datnames)
dat$datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

#set graphic setting
png("plot4.png")       #save file
par(mfcol = c(2,2))    #graph diagram
par(mar = c(4,4,1,1))  #margin

#topleft graph
plot(dat[,10], dat[,3], type = "l", lwd = 1, xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#bottomleft graph
plot(dat[,10], dat[,7], type = "l", lwd = 1, xlab = "",
     ylab = "Energy sub metering")
lines(dat[,10], dat[,8], col = "red")
lines(dat[,10], dat[,9], col= "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = names(dat[, c(7, 8, 9)]))

#topright graph
plot(dat[,10], dat[,5], type = "l", lwd = "1",
     xlab = "datetime", ylab = "voltage")

#bottomright graph
plot(dat[,10], dat[,4], type = "l", lwd = "1", xlab = "datetime",
     ylab = "names(dat[,4]")
dev.off()