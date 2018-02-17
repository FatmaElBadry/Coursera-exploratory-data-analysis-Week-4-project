# subsetting SCC with vehicle values
vehicleRecords  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleRecords, ]

# merging dataframes
NEISCC <- merge(daraForBaltimore, subsetSCC, by="SCC")

# summing emission data per year per type
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from motor sources in Baltimore")