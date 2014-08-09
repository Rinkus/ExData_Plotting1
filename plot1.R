#download and getting the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "dataset.zip")
filelist <- unzip("dataset.zip")

#read the dataset
dat <- read.table(filelist, sep = ";", nrows = 2880, skip = 66637)
datnames <- read.table(filelist, header = T, sep = ";", nrows = 1) #to get the colnames
names(dat) <- names(datnames)

#make the histogram and save it to png file
png("plot1.png")
hist(dat[,3], col = "red", main = "Global Active Power", xlab = "Global
     Active Power (kilowatts)", ylab = "Frequency")
dev.off()