# subsetting SCC with coal values
coalRecords  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subsetSCC <- SCC[coalRecords, ]

# merging dataframes
NEISCC <- merge(NEI, subsetSCC, by="SCC")

# summing emission data per year
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from coal sources")