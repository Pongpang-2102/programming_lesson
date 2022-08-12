# additional VDO (for Live 6.Data Viz)
# Required - Data Visualization(recorded Video)
# install  library

install.packages('tidyverse',
                   depedencies = TRUE)

# Load Library
library(tidyverse)

# Chart selection based on 2 important questions
## 1. No. of Variables

## (1D , 2D or 3D)  
## ggplot2 focused on 2D chart

## 2. Type of selected variable

## Type of variables consist of
## 2.1 Continuous variable : Number (including: decimal number :e.g. height ) 

## 2.2 Discrete Variable # Countable
# e.g. Number of Students on this Classroom ,
##     Number of Monday in this months

## cannot be a decimal number 
## e.g Geom_bar 
#---------------------------------------
## start with small datasets
mtcars

help(mtcars)

# to view only first 6 rows on our data
head(mtcars)

# to preview our dataset
# by check number of cols & rows in dataset
glimpse(mtcars)

# now , am is inappropriate data type
# It should be factor (not double) 

# to check col info of this built-in dataset
help(mtcars)

# change column vs ,am to factor
mtcars %>%
  mutate(am = if_else(am == 0 , 
                      "Auto", "Maual" ) ,
         vs = if_else(vs == 0 ,
                      "V-Shaped","Straight")
         ) %>%
  head() %>%
  glimpse()

# after pipe it to glimpse()
# column am & vs will be physically changed(only relabeled) from double(number) to character (string)

# defining a new dataframe
mtcars <- mtcars %>%
  mutate(am = if_else(am == 0 , 
                      "Auto", "Maual" ) ,
         vs = if_else(vs == 0 ,
                      "V-Shaped","Straight")
  )

mtcars

# mutate is creating a new column
#-----------------------------------------
# one variable , continuous

## start with showing col mpg 
mtcars$mpg

## create a new chart (base R)

# histogram
hist(mtcars$mpg)
hist(mtcars$hp)

#--------------------------------------
# two variables , Continuous

# scatter plot

## first column would be x ,
## second column would be y

plot(mtcars$wt , mtcars$mpg)

# continue using pch (for changing shape)
plot(mtcars$wt , mtcars$mpg , 
     pch = 1)

# change dot style & color
plot(mtcars$wt , mtcars$mpg , 
     pch = 15 , col = "red")

## pch = plotted character
#----------------------------------------
# one variable , discrete (factor)

mtcars$am

# it can be counted for frequency for each words using table()
table(mtcars$am) # total should be 32
table(mtcars$vs) # total should be 32

# to check number of our total cars
nrow(mtcars)

# to change am from table() from number of each type to probability 

table(mtcars$am) / nrow(mtcars)

# changing vs in the same way
table(mtcars$vs) / nrow(mtcars)

# starting with create a new table of  frequency
## tips : R motto
## Everything in R is an objects
## Everything in R is a function call

# store am table in  t1 and change it to barplot
t1 <- table(mtcars$am)
barplot(t1)

# store vs table in  t2 and change it to barplot

t2 <- table(mtcars$vs)
barplot(t2)

# end of our base R
#----------------------------------------
# Introduction to  ggplot in R

# the 1st pancake 
ggplot(data = mtcars)

# the 2nd pancake 
ggplot(data = mtcars ,
       mapping = aes(x = mpg ))

# explain :
# data in col mpg will be extracted to x axis

# to render chart 
# the 3rd pancake is needed
ggplot(data = mtcars ,
       mapping = aes(x = mpg )) + 
  geom_histogram()
  

# do not let ggplot choose bin for you
# default bin in ggplot = 30

ggplot(data = mtcars ,
       mapping = aes(x = mpg )) + 
  geom_histogram(bins = 10)


ggplot(data = mtcars ,
       mapping = aes(x = mpg )) + 
  geom_histogram(bins = 5)

# changing border color / 
# bar body color
ggplot(data = mtcars ,
       mapping = aes(x = mpg )) + 
  geom_histogram(bins = 5 ,
                 color = "red" ,
                 fill = "gold")

# change from histogram to density plot
ggplot(data = mtcars ,
       mapping = aes(x = mpg )) + 
  geom_density()

#----------------------------------------
#---------------------------------------
# one variable 


# frequency polygon 
ggplot(data = mtcars ,
       mapping = aes(x = mpg )) + 
  geom_freqpoly(bins = 10)


# to view How to of each chart type
# place cursor on chart type name and
# press F1 -(help)

# dotplot 
ggplot(data = mtcars ,
       mapping = aes(x = mpg )) + 
  geom_dotplot()

# We can create a plot with **shorter coding**

# scatter plot
ggplot(mtcars ,aes( x = wt ,y = mpg)) + 
  geom_point()

# smooth curve
ggplot(mtcars ,aes( x = wt ,y = mpg)) + 
  geom_smooth()

# we can also combine scatter plot and smooth curve in same chart 
ggplot(mtcars ,aes( x = wt ,y = mpg)) + 
  geom_point() + 
  geom_smooth() + 
  geom_rug()

# we can also change model of smooth curve
# from loess (default) to linear model (lm) by
ggplot(mtcars ,aes( x = wt ,y = mpg)) + 
  geom_point() + 
  geom_smooth( method = "lm")


# default value for smooth curve
# method = "loess"


ggplot(mtcars ,aes( x = wt ,y = mpg)) + 
  geom_point() + 
  geom_smooth( method = "lm" , 
               se = FALSE)

# se  = standard error
# use for creating range for confident interval (se = FALSE -> no that range)


# changing line color to red

ggplot(mtcars ,aes( x = wt ,y = mpg)) + 
  geom_point() + 
  geom_smooth( method = "lm" , 
               se     = FALSE,
               color  = "red")


# scatter plot deep dive

## Important !!!!!

## mapping vs setting
##---------------------------------------
## mapping - bring column in dataframe to map with each chart elements
## eg. we will map 'wt' to x and 
##             map  'mpg' to y
#---------------------------------------
## setting - we can set each value manually
## (happen outside aesthetic function)
## e.g. geom_point(size = 5 )
## we call (size = 5) that "setting"
#----------------------------------------
# starting with setting
# setting happens OUTSIDE aesthetic function

ggplot(mtcars , aes( x = wt , y = mpg)) + 
  geom_point(size = 5 , 
             color = "blue" ,
             shape  = "+")

# from above / our size , color , shape are setting
#-----------------------------------------

# mapping

# mapping happens INSIDE aesthetic function

ggplot(mtcars ,aes( x = wt ,y = mpg ,
                    color = am)) + 
  geom_point() 

# add one more part 

ggplot(mtcars ,aes( x = wt ,y = mpg ,
                    color = am,
                    shape = am)) + 
  geom_point() 


# after code being run ,
# point color will be changed (in 2  different color)
# for this case (color = am) and          (shape = am) is mapping

ggplot(mtcars ,
       mapping = aes( x = wt ,y = mpg )) + 
  geom_point(mapping = aes(color = am),
             size    = 3
             ) 
#---------------------------------------
# another setting : alpha

# alpha 

## use for adjust chart opacity
# alpha-> 1 --> more opaque
## alpha -> 0 --> more transparent

ggplot(mtcars ,
       mapping = aes( x = wt ,y = mpg )) + 
  geom_point(mapping = aes(color = am),
             size    = 3 ,
             alpha   = 0.5
             ) 
#----------------------------------------
#every layer in R can be stored in object
p_base <- ggplot(mtcars , 
                 aes(x =wt , y = mpg))
p_base

p_base + geom_point()
p_base + geom_rug()
p_base + geom_point() + geom_smooth()

#--------------------------------------
# add more layer 
# labels / text / scale color

p1 <- p_base + geom_point()

p1 +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
       )

#----------------------------------------
# we can write only column name
# first position will be x and second position will be y automatically

ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  )


##------------------------------------
# changing theme

ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  theme_minimal() +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  )

#-----------------------------------------
# changing data point color 
ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  theme_minimal() +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  ) + 
  scale_color_manual(values = c("blue",
                                "gold"))

# try to use hex color code

ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  theme_minimal() +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  ) + 
  scale_color_manual(values = c("#EA3812",
                                "gold"))

# try to view data of default color in R
colors()

# try to learn more in color change
ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  theme_minimal() +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  ) + 
  scale_color_brewer(type  ="div" ,
                     palette = 5)




# try to learn more in color change :sequential
# 
ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  theme_minimal() +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  ) + 
  scale_color_brewer(type  ="seq" ,
                     palette = 3)

# try to learn more in color change :qualitative
# 

ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  theme_minimal() +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  ) + 
  scale_color_brewer(type  ="qual" ,
                     palette = 3)

# change it to manual

ggplot(mtcars , aes(wt , mpg ,
                    color = am)) +
  geom_point(size  = 5 , 
             alpha = 0.6) +
  theme_minimal() +
  labs(title = "My first scatter Plot",
       subtitle = "R is very Cool! " ,
       x = "Weight (Ton)" ,
       y = "Miles per Gallon" ,
       caption = "Source : mtcars Dataframe (1975)"
  ) + 
  scale_color_manual(values = c("blue","darkorange"))

##--------------------------------------------------

## Facet

# facet is segmented chart

# am chart (splitted to auto and manual)
ggplot(mtcars , aes(wt , mpg)) + 
  geom_point(size = 3) +
  facet_wrap(~am)
  

# vs chart (splitted to straight and V-Shaped)
ggplot(mtcars , aes(wt , mpg)) + 
  geom_point(size = 3) +
  facet_wrap(~vs)


# define it to 2 row
ggplot(mtcars , aes(wt , mpg)) + 
  geom_point(size = 3) +
  facet_wrap(~vs , nrow = 2)


table(mtcars$am , mtcars$vs)


# facet grid

# we use it in case of number of variable for creating segment more than 1 variable (as above table) 


ggplot(mtcars , aes(wt , mpg)) + 
  geom_point(size = 3) +
  facet_grid(am ~ vs)


# am would be mapped at x-axis / vs at y-axis 

# try to map color 
ggplot(mtcars , aes(wt , mpg , color = am)) + 
  geom_point(size = 3) +
  facet_grid(am ~ vs)

#------------------------------------------------------
# box plot (one variable , continuous)

# use for detect outliers

ggplot(mtcars , aes(mpg)) +
  geom_boxplot()

# how to flip chart from horizontal to vertical alignment
# using coord_flip()

ggplot(mtcars , aes(mpg)) +
  geom_boxplot() + 
  coord_flip()

# how to fill color
ggplot(mtcars , aes(mpg)) +
  geom_boxplot(fill = "gold") + 
  coord_flip() + 
  theme_minimal()

#------------------------------------------------------

#qplot(ggplot as shortcut)

ggplot(mtcars , aes(mpg))+
  geom_histogram(bins = 10)

 qplot(x = mpg , 
       data = mtcars , 
       bins = 10)

 qplot(mpg , 
       data = mtcars , 
       bins = 10)
 
# same appearance

 # to view qplot as scatter plot
 qplot(wt , mpg , data = mtcars)
 qplot(x = wt , y = mpg , data = mtcars , color = "red")
 qplot(mpg , data = mtcars ,
       bins = 10 , geom = "histogram")
 
# if you need high complexity 
 # ggplot is better
 
 #using qplot as boxplot
 qplot(mpg , data = mtcars , geom = "boxplot")
 
# using qplot as density plot
qplot(mpg , data = mtcars , geom = "density")


# use case :use for explore data (less complexity but faster)

#---------------------------------------------------
mtcars$am

table(mtcars$am)
qplot(am , data = mtcars , geom = "bar")

# and flip it 

qplot(am , data = mtcars , geom = "bar") + 
  coord_flip()

#-------------------------------------------------------

## bigger dataset

# diamonds
glimpse(diamonds)

# explore price
ggplot(diamonds , aes(price)) + 
  geom_histogram(bins = 50) # our default bin = 30

# explore cut
diamonds  %>%
  count(cut)

diamonds$cut  %>% head

class(diamonds$cut)

#-------------------------------------------------------
# factor in R
## 1. Categorical factor (Nominal factor)
##. e.g Auto or manual Transmission 
## V-shaped or Straight / Man or Woman
## cannot be ordered

## 2. Ordinal Factor (can be ordered)
temp <- c("high" , "low" , "low","medium", "high")
temp


# convert old temp variable (general factor) to new temp variable (ordinal factor)
temp <- factor(temp ,
               ordered = TRUE ,
               labels = c("low","medium","high" ))
temp
# finally we've got an ordinal factor

#----------------------------------------------------

diamonds %>%
  count(cut)

# How about need to know %

diamonds %>%
  count(cut) %>%
  mutate (percent = n/sum(n)*100)

# How to create a bar plot
ggplot(diamonds , aes (x = cut)) + 
  geom_bar()


# to view  diamond color info
diamonds %>%
  count(color)

diamonds$color

# fill color in our existed chart
ggplot(diamonds , 
       aes(cut ,  fill = color)) +
  geom_bar(position = "dodge")


ggplot(diamonds , 
       aes(cut ,  fill = color)) +
  geom_bar(position = "fill")

#------------------------------------------------
# review data transformation

diamonds %>%
  count(color , cut) %>%
  group_by(color) %>%
  mutate ( pct = n / sum(n))

# s.data.frame()  # convert tibble back to dataframe

#----------------------------------------------------
# dplyr + ggplot2 (tidyverse)

# using geom_col()
diamonds %>%
  count(cut) %>%
  ggplot(aes( x = cut ,y = n)) + 
  geom_col()

#---------------------------------------------------
# It will be same with
#diamonds %>%
 # count(cut) %>%
  #ggplot(data = . ,
  #       aes( x = cut ,y = n)) + 
 # geom_col()
#---------------------------------------------------

#data = . as placeholder 
# to imply that table of frequency from count(cut)
# will be placed at that dot so It can be removed



# geom_col : will be used with table which already summarized (this case we count cut previously)
# geom_bar : used with with raw data table
#-----------------------------------------------------
# using  geom_bar 
diamonds %>%
  select(cut) %>%
  ggplot(aes(cut)) + 
  geom_bar()

#---------------------------------------------------
# dplyr + ggplot2 (tidyverse) (Cont.)

# another method with same answer

ggplot(diamonds %>% count(cut) , 
       aes( x = cut , y = n)) + 
  geom_col()


#---------------------------------------------------
# scatter plot on diamonds
ggplot(diamonds , aes( x = carat , y = price)) + 
  geom_point()


# 50K +  point plotting --> take more time
# Why don't we use sampling method ?
# for faster chart rendering

# sampling

# sampling for 5000 records
diamonds %>%
  sample_n(5000)


# sampling for only 10% 
diamonds %>%
  sample_frac(0.1)

# this case , we will use 10% sampling
ggplot(diamonds %>%  
         sample_frac(0.1), 
         aes( x = carat , y = price)) +
  geom_point()


# to prevent data inconsistency (from different rendering time ) 
# we need to set seed 
set.seed(42)
ggplot(diamonds %>%  
         sample_frac(0.1), 
       aes( x = carat , y = price)) +
  geom_point()


#overplotting : too many point in our plot so,
# we cannot evaluate data distribution precisely

# to reduce this problem : wee need to adjust alpha (opacity)

set.seed(42)
ggplot(diamonds %>%  
         sample_frac(0.1), 
       aes( x = carat , y = price)) +
  geom_point(alpha = 0.1)

# after run this code : we found that high distribution would be seen at bottom left


# another method to view data distribution
# we may use dot as point shape as below


set.seed(42)
ggplot(diamonds %>%  
         sample_frac(0.1), 
       aes( x = carat , y = price)) +
  geom_point(shape = ".") + 
  theme_minimal()

# for better visualization we may use ALL data instead of using fraction


set.seed(42)
ggplot(diamonds, 
       aes( x = carat , y = price)) +
  geom_point(shape = ".") + 
  theme_minimal()

#------------------------------------------------
# summary 
# strategy to deal with overplotting
# 1. low alpha value  
#         (point would be highly transparent )


# 2. using dot as point shape
# (point would be smaller)

#-------------------------------------------------

# bring it all together

ggplot (diamonds ,
        aes(carat , price , color = cut)) +
  geom_point( alpha = 0.5)

# Problem overplotting was found again
# (from too many plot)


# change its code slightly as

ggplot (diamonds %>%
          sample_n(5000) ,
        aes(carat , price , 
            color = cut)) +
  geom_point( alpha = 0.3)


# after above code being run , our chart would be easier to be seen its data pattern 

# to improve user understanding of our data pattern
# facet may be applied for this chart as well


ggplot (diamonds %>%
          sample_n(5000) ,
        aes(carat , price , color = cut)) +
  geom_point(alpha = 0.3) + 
  geom_smooth(se = TRUE) +
  theme_minimal() +
  facet_wrap( ~ cut , ncol = 2)

#--------------------------------------------------
# multiple data source in one chart

ggplot(mtcars , aes(wt , mpg)) +
  geom_point()


# What did you see ?
# 3 cars (which wt > 5) as outlier what car and why?

# if we need to know more we need to filter it
# to deep dive

mtcars %>%
  filter (wt > 5) %>%
  row.names()


# [1] "Cadillac Fleetwood"  "Lincoln Continental"
# [3] "Chrysler Imperial" were found


# split this dataframe annd store it 
# in object heavy_cars

heavy_cars <- mtcars %>%
  filter( wt > 5)


# and continue to split other cars as normal cars
normal_cars <- mtcars %>%
  filter (wt <= 5)

normal_cars

# plot 2 dataframe (normal_cars & heavy_cars)
# in same chart as below
ggplot() + 
  geom_point(data = normal_cars ,
             mapping = aes(wt , mpg),
             alpha = 0.5 )  +
  geom_point(data = heavy_cars ,
             mapping = aes(wt , mpg) ,
             color = "red",
             shape = 15,
             size = 5) +
  theme_minimal()

#------------------------------------------------
# R Markdown
# to prepare report
















  




