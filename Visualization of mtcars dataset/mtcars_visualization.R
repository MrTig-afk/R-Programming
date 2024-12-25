# Install necessary packages
install.packages(
  c("arrow", "babynames", "curl", "duckdb", "gapminder",
    "ggrepel", "ggridges", "ggthemes", "hexbin", "janitor", "Lahman",
    "leaflet", "maps", "nycflights13", "openxlsx", "palmerpenguins",
    "repurrrsive", "tidymodels", "writexl")
)

View(mtcars)
?mtcars
#mpg= Miles per Gallon
#cyl= Number of Cylinders
#wt= Weight
#gear= Number of Forward gears
# I will be visualising and inferring from the following features
library(ggplot2)
library(tidyverse)
ggplot(data=mtcars, mapping= aes(x=mpg, y= cyl))

#plotting mpg vs number of cylinders with color being engine (categorical variable)
ggplot(data= mtcars, mapping = aes(x=mpg, y=cyl), color=vs)+ geom_point()
ggplot(data= mtcars, mapping = aes(x=mpg, y=cyl))+ geom_point(mapping = aes(color=vs))
ggplot(data= mtcars, mapping = aes(x=mpg, y=cyl))+ geom_point(mapping = aes(x=mpg, y=cyl,color=vs))

# Since it is automatically assigning a gradient to the categorical variable, I will be using scale_color_discrete() method
ggplot(data=mtcars, mapping= aes(x=mpg, y=cyl, color= factor(vs))) + geom_point() + scale_color_discrete()
ggplot(data=mtcars, mapping= aes(x=mpg, y=cyl, color= factor(vs))) + geom_point() + scale_color_discrete()+
  labs(
    title = "Miles per Gallon vs Number of Cylinders",
    xlab= "Miles per Gallon (mpg)",
    ylab= "Number of Cylinders (cyl)"
  )

# 0 = V-shaped, 1 = straight engine
# We observe that V shaped engines gave less mileage and had more number of cylinders and vice-versa
ggplot(data=mtcars, mapping= aes(x=mpg, y=wt)) + geom_point()
ggplot(data=mtcars, mapping= aes(x=mpg, y=wt)) + geom_point() + geom_smooth()

# There seems to be a obvious corelation between decrease in weight and increase in mileage of the cars
ggplot(data=mtcars, mapping= aes(x=mpg, y=wt)) + geom_point() + geom_smooth() +
      labs(
        title = "Miles per Gallon vs Number of Cylinders",
        x= "Miles per Gallon (mpg)",
        y= "Number of Cylinders (cyl)"
      )

p1=ggplot(data=mtcars, mapping= aes(x=mpg, y=cyl, color= factor(vs))) + geom_point() + scale_color_discrete()+
  labs(
    title = "Miles per Gallon vs Number of Cylinders",
    x= "Miles per Gallon (mpg)",
    y= "Number of Cylinders (cyl)"
  )
p2= ggplot(data=mtcars, mapping= aes(x=mpg, y=wt)) + geom_point() + geom_smooth() +
  labs(
    title = "Miles per Gallon vs Number of Cylinders",
    x= "Miles per Gallon (mpg)",
    y= "Number of Cylinders (cyl)"
  )
# Using grid arrange to arrange the plots
install.packages("gridExtra")
library(gridExtra)
grid.arrange(p1, p2, ncol = 2)

# Visualizing Number of Cylinders vs Number of Forward Gears, maybe even with respect to type of engine
ggplot(data=mtcars, mapping = aes(x= cyl, y= gear))+ geom_point(mapping=aes(color=factor(vs)))+ scale_color_discrete()

# Since the scatterplot isn't helping, I will try using a barplot
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear)))
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear)))+
  labs(
    title = "Number of Cylinders vs. Number of Front Gears",
    x = "Number of Cylinders",
    y = "Count",
    fill = "Number of Front Gears"
  )

# The barplot is much better
p3=ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear)))+
  labs(
    title = "Number of Cylinders vs. Number of Front Gears",
    x = "Number of Cylinders",
    y = "Count",
    fill = "Number of Front Gears"
  )

# Now let us arrange the 3 plots together
grid.arrange(p1, p2,p3, ncol = 3)