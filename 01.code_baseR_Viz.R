# start with check working directory
getwd()

#download package
## library tidyverse
library(tidyverse)

# start with built-in dataset

# to view mtcars
head(mtcars)

##------------------------------------
## basic plot in based R

##-----------------------------------
# create a histogram 
## Histogram : one quantitative variable


## visualize mgp histogram
hist(mtcars$mpg)

## visualize ho histogram
hist(mtcars$hp)

#-----------------------------------
## Analyzing Horse Power

# to find mean of hp
mean(mtcars$hp)

# to find median of hp
median(mtcars$hp)


## basic EDA : exploratory data analysis
# use statistic + basic chart 
#--------------------------------------

# to view basic structure (str)
str(mtcars)

# now , all col will be shown in Numeric
# we can change numeric to factor  by


# to change the value in am (Transmission)
# from 0 , 1 -> Numeric
# to "Auto" , "Manual" -> factor
# and reassign new value to mtcars and show
mtcars$am <- factor(mtcars$am ,
                    level = c(0,1) ,
                    labels = c("Auto",
                               "Manual"
                               )
                    )

# to view basic structure (again after change numeric to factor)

# using str to check our data structure
str(mtcars)

# to analyze our factor column
# bar plot will be used in this case

#------------------------------------------

## bar plot
##  one Qualitative Variable

# start with create a  table
table(mtcars$am)

# use above table to create bar plot
barplot(table(mtcars$am))

#------------------------------------------
# Box Plot

boxplot(mtcars$hp)

# to view data from 5 numbers summary
fivenum(mtcars$hp)

# How about 5 num?
# 52 - minimum
# 96 - Q1
# 123 - Q2 (median)
# 180 - Q3
# 335 - maximum

# to ensure that we are not misunderstood

# to find min/max/Q1, Q2 and Q3
min(mtcars$hp)
quantile(mtcars$hp ,probs = c(.25,
                              .5,
                              .75) )
max(mtcars$hp)
# it will be same with using fivenum previously

# more info for boxplot
# box width = IQR = Q3 -Q1
# arm(whisker)
## whisker length (wl)
#### wl_top = Q3 + 1.5*IQR
#### wl_bottom = Q1 - 1.5*IQR


## whisker calculation
Q3 <- quantile(mtcars$hp , probs = .75)
Q1 <- quantile(mtcars$hp , probs = .25)
IQR_hp <- Q3-Q1

IQR_hp

fivenum(mtcars$hp)
180-96 # similar with our calculated IQR


Q3 + 1.5*IQR_hp # top whisker
Q1 -  1.5*IQR_hp # bottom whisker

# to view all main stat info
# general case which we use +- 1.5 IQR as whisker length

boxplot.stats(mtcars$hp ,
              coef = 1.5)

# filter out outliers
# to select only mtcars which hp is lower than hp at outlier position (hpe = 335)

# start with call library dplyr
library(dplyr)

# filter as be told above
mtcars_no_out <- mtcars %>%
  filter(hp < 335)

# after remove hp >= 335 
# viewing boxplot again
boxplot(mtcars_no_out$hp)

# using boxplot with 2 variables

## Qualitative x Quantitative

# to compare "mpg" between auto & manual (am


##----------------------------------------
## remark : in case of error 

## How to load dataframe again

### 1 . run command data
data(mtcars)

### 2. change numeric value (as our built-in dataset's default) to factor (auto/ manual)

mtcars$am <- factor(mtcars$am ,
                    level = c(0,1) ,
                    labels = c("Auto",
                               "Manual"
                    )
)

### 3. after step 2 completed --> go back to visualize again

###-----------------------------------
### boxplot (cont.)


boxplot(mpg ~ am ,
        data = mtcars)

###-----------------------------------

## to change chart color (in base R)

boxplot(mpg ~ am ,
        data = mtcars ,
        col = c("gold" , "salmon"))

### col = color


###------------------------------------

# scatter plot

## use with 2 Quantitative variables

# basic scatter plot
plot(mtcars$hp ,
     mtcars$mpg)
# hp will be x / mpg will be y


# change point style
plot(mtcars$hp ,
     mtcars$mpg ,
     pch = 17) 
# different pch value will result to different point style
## see more info from google

## to change point color
plot(mtcars$hp ,
     mtcars$mpg ,
     pch = 17,
     col = "blue" )

# try to place cursor on plot
## and press F1 --> help at it

# to view correlation
cor(mtcars$hp , 
    mtcars$mpg)

# to view linear regression
lm(mpg ~ hp ,
   data = mtcars)


# to rename
# x,y label & chart title
plot(mtcars$hp ,
     mtcars$mpg ,
     pch = 17,
     col = "blue" ,
     main = "Relationship between hp & mpg",
     xlab = "Horse Power",
     ylab = "Miles per Gallon")


















