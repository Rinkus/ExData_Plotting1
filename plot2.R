#download and getting the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "dataset.zip")
filelist <- unzip("dataset.zip")

#read the dataset
dat <- read.table(filelist, sep = ";", nrows = 2880, skip = 66637)
datnames <- read.table(filelist, header = T, sep = ";", nrows = 1) #to get the column names
names(dat) <- names(datnames)
dat$datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

#make the plot and save it to png file
png("plot2.png")
plot(dat[,10], dat[,3], type = "l", lwd = 1, xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()