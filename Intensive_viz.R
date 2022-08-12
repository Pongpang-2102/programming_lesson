# Live 6.1 Data Analysis & Visualization Free Fire & PubG

# start wiht installing package Tidyverse

# Load library 
library(tidyverse)


head(mtcars)

# 1.  How many variables
# 2. Data type of Each variables


# starting with plotting histogram
ggplot(data = mtcars ,aes(mpg)) + 
  geom_histogram()

# command step :
# 1. go to view at mtcars dataset
# 2.reach to mpg at send it to chart
# 3.plot it as histogram

# we also can define a bin number
# (dedault in ggplot = 30)
ggplot(data = mtcars ,aes(mpg)) + 
  geom_histogram(bins = 10) #geometry

# How about density plot
ggplot(data = mtcars ,aes(mpg)) + 
  geom_density()

# How about box plot
ggplot(data = mtcars ,aes(mpg)) + 
  geom_boxplot()

# put the first layer into a variable
p <- ggplot(data = mtcars ,aes(mpg)) 

# call p to show blank plot
p
# show p with informative histogram
p + geom_histogram(bins = 10)

# using  p with boxplot or density
p + geom_boxplot()
p + geom_density()

## tow variables

# we need to plot relationship between mpg & hp
# starting by viewing data
mtcars[        , c("mpg","hp")]

# continue to plot in scatter plot

### 2 variable (numeric)
## --> scatter plot will be applied
ggplot(data = mtcars , 
       aes(x = hp , y = mpg)) +
  geom_point()

# we can reduce our typing effort by
p1 <- ggplot(mtcars , 
       aes(hp , mpg)) + 
  geom_point() + 
  geom_smooth(se = FALSE ,
              color = "red") +
  geom_rug()
  
p1


# se =  standard error (TRUE or FALSE)
# se will be use to represent range of confidence interval 
# rug _ to view data density
# In case of our data is overlapped , We may use it 

# everything in R (including chart) can be object

# play with theme
## theme_minimal

p1 + theme_minimal() # remove grey bg

# insert/change title/label name

p1 + 
  theme_minimal() +
  labs(title = "My first ggplot chart",
      x = "Hors Power" ,
      y = "Miles per Gallon")

# changing color

diamonds

# ord : ordinal factor : 
# factor that can be sorted
# e.g. Ideal > Premium >Very Good > Good

diamonds$cut[1:10]

# How to create ordinal factor in R

temperature <- c("high","med","low",
                 "low","high")
factor(temperature ,
       level = c ("low","medium","high")
       )

# Now it will be a factor but cannot be sorted , we must to add more 1 arguments
#orderd
factor(temperature ,
       level = c ("low","medium","high"),
       ordered = TRUE
)

# and replace it to existed temperature object
temperature <- 
  factor(temperature ,
         level = c ("low","medium","high"),
         ordered = TRUE
         )


# try to create a chart
ggplot(diamonds ,aes(cut)) + 
  geom_bar()


# how to map other column in aesthetic fn
# this case we will try to do it with "clarity"

ggplot(diamonds ,
       aes(cut , fill = clarity)
       ) + 
  geom_bar() + 
  theme_minimal()

# it also can change the position

ggplot(diamonds ,
       aes(cut , fill = clarity)
) + 
  geom_bar(position = "dodge") + 
  theme_minimal()


ggplot(diamonds ,
       aes(cut , fill = clarity)
) + 
  geom_bar(position = "fill") + 
  theme_minimal()


ggplot(diamonds ,
       aes(cut ,price)) + 
  geom_boxplot()



# geom_violin()
ggplot(diamonds ,
       aes(cut ,price)) + 
  geom_violin()







