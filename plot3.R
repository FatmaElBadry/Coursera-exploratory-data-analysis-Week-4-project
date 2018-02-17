library(ggplot2)

# summing emission data per year per type
data <- aggregate(Emissions ~ year + type, daraForBaltimore, sum)

# plotting
g <- ggplot(data, aes(year, Emissions, color = type))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions per type in Baltimore")