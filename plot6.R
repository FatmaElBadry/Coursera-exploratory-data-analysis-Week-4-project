los <- subset(NEI, fips == "06037")

# subsetting SCC with vehicle values
vehicleRecords  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleRecords, ]

# merging dataframes, adding city variable
dataBalt <- merge(daraForBaltimore, subsetSCC, by="SCC")
dataBalt$city <- "Baltimore City"
dataLos <- merge(los, subsetSCC, by="SCC")
dataLos$city <- "Los Angeles County"
data <- rbind(dataBalt, dataLos)

# summing emission data per year per type
data <- aggregate(Emissions ~ year + city, data, sum)

# plotting
g <- ggplot(data, aes(year, Emissions, color = city))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")