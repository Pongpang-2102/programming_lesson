## ggplot2
## grammar of graphic plot
## start with loading library tidyverse
library(tidyverse)

# how to use proper chart in ggplot2 
# 2 simple criteria
### 1. Number of Variables (eg. 1 2 or 3)

### 2. type of dataset (Qualitative (aka Continuous) or Quantitative(aka Discrete))


# our code consists of 3 main elements
# 1. data
# 2. mapping
# 3. geometry

#  our very first plot

# 1. starting with axis setup
ggplot(data = mtcars ,
       mapping = aes( x = hp ,
                      y = mpg
                      )
       )

# 2. continue to add point 

ggplot(data = mtcars ,
       mapping = aes( x = hp ,
                      y = mpg)) + 
  geom_point()

# 3. continue again with new layer

ggplot(data = mtcars ,
       mapping = aes( x = hp ,
                      y = mpg)
       ) + 
  geom_point() + 
  geom_smooth()

# 4. continue again
ggplot(data = mtcars ,
       mapping = aes( x = hp ,
                      y = mpg)) + 
  geom_point() + 
  geom_smooth() + 
  geom_rug()

# rug - use to view data distribution

##------------------------------------
## faster coding with shorter code
ggplot(mtcars , aes(hp , mpg))+
  geom_point()

##----------------------------------
## How about point size& color adjustment
ggplot(mtcars , aes(hp , mpg))+
  geom_point(size = 3 ,
             col = "blue" ,
             alpha = 0.2)


# description
## size : to change point size
## col : to change color
## alpha : to change fadeness
   #alpha between 0 -1
# alpha near 0 : point color will be more transparent 
## alpha near 1 : point will be more opaque

#------------------------------------

# to plot histogram with 1 variable
ggplot(mtcars , aes(hp)) + 
  geom_histogram()

# bin = 30 : default of histogram

## It can be adjustable --> better result

## bin = 15
ggplot(mtcars , aes(hp)) + 
  geom_histogram(bins = 15)

## bin = 10
ggplot(mtcars , aes(hp)) + 
  geom_histogram(bins = 10)

# change color in histogram

ggplot(mtcars , aes(hp)) + 
  geom_histogram(bins = 10 ,
                 fill = "red")


# to adjust transparency
## using argument : alpha

ggplot(mtcars , aes(hp)) + 
  geom_histogram(bins = 10 ,
                 fill = "red" ,
                 alpha = 0.5)
##-------------------------------------
## boxplot

# start with blank chart
## defining based layer

ggplot(mtcars , aes(hp)) + 
  geom_boxplot()

# store chart value in object p
p <- ggplot(mtcars , aes(hp))

# to render  our p

p + geom_histogram(bins = 10)

p + geom_density() 
# normalized histogram

p + geom_boxplot()

## step
## 1. defining based layer
## 2. selecting proper geometry


##-------------------------------------
## box plot by group

# to view dataset diamonds as tibble
diamonds

## answer our questions

# How many diamonds which be ideal/good/very good etc.) cut

diamonds %>%
  count(cut)

table(diamonds$cut)
# count(in dplyr) is better

##----------------------------------

## bar plot with diamond cut

ggplot(diamonds , aes(cut)) +
  geom_bar()

## we will use bar plot with ordinal factor (word can be ordered)

# to change color for bar plot
ggplot(diamonds , aes(cut)) +
  geom_bar(fill = "lightblue")

# more color can be found from
## google search : hex color

# using color code from hex color
ggplot(diamonds , aes(cut)) +
  geom_bar(fill = "#92eb34")


ggplot(diamonds , aes(cut)) +
  geom_bar()

# to count color again
diamonds %>%
  count(color)

# to differentiate by color

# use diamond cut column to map with bar chart color
ggplot(diamonds ,
       mapping = aes(cut ,fill = cut)) +
  geom_bar()

# use diamond color (7 colors : D-J) column to map with bar chart color

ggplot(diamonds ,
       mapping = aes(cut ,fill = color)) +
  geom_bar()



# to view diamond cut with stacked diamond color (default)
ggplot(diamonds ,
       mapping = aes(cut ,fill = color)) +
  geom_bar(position = "stack")

# to view diamond cut bar chart spitted by different diamond color
ggplot(diamonds ,
       mapping = aes(cut ,fill = color)) +
  geom_bar(position = "dodge")

# to view ratio diamond color in each diamond cut
ggplot(diamonds ,
       mapping = aes(cut ,fill = color)) +
  geom_bar(position = "fill")


#--------------------------------------
diamonds


## scatter plot

## to view relationship between carat & price

# we will define that
   # carat as x axis
   # price as y axis

ggplot(diamonds ,
       aes(carat , price)
       ) +
  geom_point()

# we can sampling randomly with small Qty (5000 samples) using sample_n fn as below
 
small_diamonds <- sample_n(diamonds ,
                           5000)


ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point()

# only small lot can be use for viewing pattern #--> faster run


# to lock sampling result
# same result for all rounds
# we must to set seed as below
set.seed(1000) # use it before random
small_diamonds <- sample_n(diamonds ,
                           5000)


ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point()

##----------------------------------

#### FACET :
## small multiples

## split big chart into small subgroup


# use facet to show relationship between carat and price in each subgroup of diamond colors

ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  facet_wrap(~color)

# we will also define column and row number as below
# required column = 4

ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  facet_wrap(~color ,
             ncol = 4)

# required column = 2


ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  facet_wrap(~color ,
             ncol = 2)

## adding smooth curve

ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  geom_smooth() +
  facet_wrap(~color ,
             ncol = 2) 

## adding linear model (lm)

ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  facet_wrap(~color ,
             ncol = 2) 

## change our linear model color from blue to red

ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  geom_smooth(method = "lm" ,
              col = "red") +
  facet_wrap(~color ,
             ncol = 2)

## change theme color to minimal
ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  geom_smooth(method = "lm" ,
              col = "red") +
  facet_wrap(~color ,
             ncol = 2) + 
  theme_minimal()

## define chart label (lab) & chart axis label
ggplot(small_diamonds ,
       aes(carat , price)) + 
  geom_point() + 
  geom_smooth(method = "lm" ,
              col = "red") +
  facet_wrap(~color ,
             ncol = 2) + 
  theme_minimal() + 
  labs(title = "Relationship between carat & price by color" ,
       x = "Carart",
       y = "Price_USD" ,
       caption = "Source : Diamonds from ggplot2 Package")


###-------------------------------
## Final example
## color mapping

ggplot(small_diamonds ,
       aes(carat , 
           price,
           col = cut)) + 
  geom_point(size = 1 ,
             alpha = 1) + 
  facet_wrap(~color ,
             ncol = 2) + 
  theme_minimal()


# mapping - to map variable to chart element (happen within aesthetic fn)

# setting : outside aesthetic fn
# e.g point side adj / aplha adj






