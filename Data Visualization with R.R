# Assignment for ggplot2

# Import the ggplot2, ggthemes and data.table libraries

library(ggplot2)
library(data.table)
library(ggthemes)

# Load the csv file 'Economist_Assignment_Data.csv'

df <- fread('Economist_Assignment_Data.csv', drop=1)

# Check the head of df

print(head(df))

# Use ggplot() + geom_point() to create a scatter plot object called pl

pl <- ggplot(df, aes(x=CPI, y=HDI, color=Region)) + geom_point(size=4, shape=1)

# Add a trend line

pl2 <- pl + geom_smooth(aes(group=1), method='lm', formula=y~log(x), se=FALSE, color='red')

# Add labels

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
"Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
"India", "Italy", "China", "South Africa", "Spane",
"Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
"United States", "Germany", "Britain", "Barbados", "Norway",
"Japan", "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", data = subset(df, Country %in% pointsToLabel), check_overlap = TRUE)

# Add theme_bw()

pl4 <- pl3 + theme_bw()

# Add scale_x_continuous() and scale_y_continuous()

pl5 <- pl4 + scale_x_continuous(name='Corruption Perceptions Index, 2011 (10=Least corrupt)', limits=c(.9, 10.5), breaks=1:10)

pl6 <- pl5 + scale_y_continuous(name = 'Human Development Index, 2011 (1=Best)', limits = c(0.2, 1.0))

# Add a title

pl7 <- pl6 + ggtitle('Corruption and Human Development')

# Add theme_economist_white()

pl8 <- pl7 + theme_economist_white()

print(pl8)
