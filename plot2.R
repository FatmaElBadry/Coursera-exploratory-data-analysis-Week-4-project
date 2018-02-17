# reading and subsetting data
daraForBaltimore <- subset(NEI, fips == "24510")

# summing emissions per year
totalEmissions <- tapply(daraForBaltimore$Emissions, daraForBaltimore$year, sum)

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year in Baltimore")