# data transformation / data wrangling

install.packages("tidyverse",dependencies =  TRUE)

# upload data files

# activating library 
library(tidyverse)

## read data files
friends <- read_csv("friends.csv")

## read file with semi colon
df1 <- read_delim("text_file01.txt",
                  delim = ";")
df1

df2 <- read_delim("text_file02.txt",
                  delim = "\t")
df2
# \t escape character or tab

## tibble -- > enhanced dataframe

# changing original dataframe to tibble
mtcars <- tibble(mtcars)
mtcars 
class(mtcars)
# if tibble be applied
#  1. show head 10 rows
#  2. show column which be fitted 
# with our window size

## read tibble info
help(tibble)

#-----------------------------------------

## dplyr - data transformation with R
## 1. Select
## 2. Filter
## 3. mutate 
## 4. arrange
## 5. summarize
## 6. group_by
## 7. count

## 1. select columns 

### 1.1 select column : using column name
select(mtcars ,
       mpg , hp , wt)

# >> column  ' mpg , hp , wt ' in data frame 'mtcars' will be selected 


### 1.2  select column : using column index
select(mtcars ,
       1,2,4,6)
# result < col 1,2,4 and 6 will be shown

## 1.3 select column : using column index with slicing 

select(mtcars , 1:3 ,8:10)
## result > col 1 to 3 and 8 to 10 will be shown
###------------------------------------
 # 1.4 using helper : starts_with 
# to select col which its name start with "h"

select(mtcars ,starts_with("h") )
# result> col which name ""starts with""  "h" will be shown : this case "h" col has "hp" col only

###-------------------------------------
# 1.5  using helper : contain

## to select col which its name contains with "a" (any position)

select(mtcars , contains("a"))

# result> col which name ""contains"" with "a" will be shown : this case "a" col are drat , am ,gear , carb 

### --------------------------------
# 1.6  using helper : ends_with

# to select col which its name ends  with "p"

select(mtcars , ends_with("p"))

# result > col which name ""ends with"" "p" will be shown : this case "p" col are disp and hp

###-----------------------------------
# 1.7 Switching position
# using helper : everything

select(mtcars , carb, everything())

# result > carb (was the last col) will be the first col (most left) followed by the rest


###---------------------------------
# 1.8. Rename column

## left_new_name = right_old_name

select(mtcars , HorsePower = hp ,
                MilePerGallon = mpg ,
                weight = wt)


##-----------------------------------
## 2. filter rows with conditions


# 2.1 filter only car which mpg < 20
filter(mtcars , mpg < 20)

# 2.2 filter only car which which mpg < 20 and (&) hp> 200
filter(mtcars , mpg < 20 & hp > 200)

# 2.3 filter only car which which mpg < 20 and (&) hp> 200 & am equals to  1
filter(mtcars , mpg < 20 & hp > 200 & am == 1)
# same result with using &
filter(mtcars , mpg < 20 , hp > 200 , am == 1)

# 2.4 filter only car which which mpg < 18 or am = 1
filter(mtcars , mpg < 18 | am == 1)

# 2.5 combine select + filter
head(mtcars)

# it also can be written by using pipe operator (same result)
mtcars %>% 
  head()

# Use case for select and filter

# from based R
select(mtcars ,
       mpg , hp ,wt)
#-----------------------------------
#  3. mutate
#  from using pipe operator
##  use mutate to create a  new column
mtcars %>% 
  select(mpg , hp ,wt) %>%
  filter(mpg < 20 , hp > 200) %>%
  mutate(double_hp = hp * 2 , 
         log_hp = log(hp) ,
         exp_log_hp = exp(log(hp)))

# ------------------------------------
# 4.arrange data

mtcars %>%
  select(mpg ,hp ,wt) %>%
  arrange(desc(hp)) %>%
  as.data.frame()

# arrange(hp) :hp will be sorted in ascending order
# arrange(desc(hp)) : hp will be sorted in descending order
# as.data.frame() : tipple will be changed to dataframe(default)

# change original column (double : can be aggreagated ) into factor (or category in RapidMiner)
mtcars %>%
  select(mpg ,hp ,wt, am) %>%
  mutate(am = factor(
    am , labels = c("Auto","Manual"))) %>%
  filter(am == "Manual")



# explicit programming
mtcars %>%
  select(mpg ,hp ,wt, am) %>%
  mutate(am = factor(am , 
                     level = c(0,1),
                     labels = c("Auto",
                                "Manual"))) %>%
  ## filter(am == "Manual")
  arrange(desc(am) , desc(hp)) %>%
  as.data.frame()


##-------------------------------------------
# 5. summarise / 6. group_by
mtcars %>%
  mutate(am = factor(am , 
                     level = c(0,1),
                     label = c("Auto" ,
                               "Maual"))) %>%
  group_by(am) %>%
  summarise(avg_hp = mean(hp),
            sum_hp = sum(hp),
            sd_hp = sd(hp),
            n = n(),
            avg_mpg = mean(mpg)) %>%
  ungroup()
## -------------------------------------
## 7. count
## diamonds

result <- diamonds %>%
  count(cut,color)  %>%
  mutate( percent = n / sum(n) ) %>%
  as.data.frame() %>%
  arrange(desc(percent)) %>%
  head(10)

# export result data to csv file
write_csv(result ,"top_ten_diamonds.csv")
  
##---------------------------------------
## join table
band_members
band_instruments

inner_join(band_members ,
           band_instruments,
           by = "name")

left_join(band_members ,
           band_instruments,
           by = "name")

full_join(band_members ,
           band_instruments,
           by = "name")

## Full join using pipe operator
band_members %>%
  inner_join(band_instruments ,
             by = "name")
##------------------------------------

## add grand total 
df1 <- diamonds %>%
  count(cut)


df2 <- data.frame(cut = "Total",
                  n = length(diamonds$cut))

df1 %>% bind_rows(df2)






























