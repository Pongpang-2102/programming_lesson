

# comment
# continue after basic operations

# 01. Variables
# assign variable
my_name = "Pongpang"
my_age = 28
university = "Suranaree UT"

# remove variable
rm(university)

# if below code is run ,
# below variable will be overwritten
my_name  = "Pongpang & Friends"

# to prevent overwrite
# we can use another name
my_name2 = "Toysss"





# 02. Data types

# 2.1 numeric
# 2.2 Character (string , Character)
# 2.3 Logical (TRUE , FALSE)
# 2.4 Factor , Categorical Data
# 2.5 Date

(x <- 1:100)
# create variable and print it to console

y = 20
30 -> z

# replacing x with new value
(x <- 25:49)

# creating a sequence start:stop :step
y <- seq(1 , 100 , by = 5)


class(x)
class(y)
class(z)

class(3.42)
class(1L)

class("Hello World")

class(TRUE)

# How to create vector
friends <- c("Pongpang",
             "Violet" ,
             "Mikasa",
             "Eiko",
             "Ymir")
class(friends)
movie_lover <- c(T,F ,T ,T,F)
class(movie_lover)
ages <- c(33 , 30 , 25 , 22 ,28)

# How to check item qty in object
length(ages)

# factor -- > categorical data
animals <- c("cat", 
            "dog",
            "dog",
            "cat",
            "cat",
            "shark")
class(animals)

# convert to factor
# factor use for grouping
animals <- factor(animals)
class(animals)

#create frequency table
table(animals) 

# change ot to percent
table(animals)/6 # hard code
# Vectorization

# easier way to change to %
table(animals)/length(animals)
# same result

# date , ISO standard YYYY-MM-DD
my_date = "2022-04-23"
my_date = as.Date(my_date)
class(my_date)

# 03 Data Structure 
# 3.1 vector
# 3.2 Matrix
# 3.3  list
# 3.4 DataFrame

# Vector
# Use for represent 1D
x <- 1:10

# matrix
matrix(x , ncol = 2)
# 2 col  5 rolw
(m1 <- matrix(x , ncol = 5)  )

# How about incorrect chosen ncol
matrix(x , ncol = 3) 
# error # reuse value with warning

m1      #(which ncol = 5)
m1*2

# creating object and print result to console using parenthesis

(m1 <- matrix(x , ncol = 5))

# How to change matrix orientation
# 5 col required with alignment by row
(m1 <- matrix(x , ncol = 5 ,byrow = T))

help(matrix)
class(m1)

# list
customer01 <-  list(
  fname = "David" ,
  lname = "Beckham",
  age = 42,
  movies = c("Avengers",
             "Spider-Man",
             "Justice League"),
  m = matrix(1:10 , ncol = 2)
 
)

customer01$fname
customer01$lname
customer01$age
customer01
customer01$movies

# Index in R start with 1 (one)
customer$movies[1]

friends
friends[1]
friends[1:3]
friends[4:5]
friends[c(1,3,4)]

ages

# finding the number which < 30
ages<30
# 30 will be compared with all elements
# AKA vectorization

ages[c(F,F,T,T,T)] # same with above

ages[ages<30]

ages[ages >= 30]

# finding our friends who >= 30
friends[ages >= 30]

customer$m # to extract matrix

# How about extracting matrix for row 2 col 1

customer$m[2,1] #  [row N, col N]

# How about No. 9 is needed
customer$m[4,2] # row 4 col 2

# How to extend customer list

# list
customer01 <-  list(
  fname = "David" ,
  lname = "Beckham",
  age = 42,
  movies = c("Avengers",
             "Spider-Man",
             "Justice League"),
  m = matrix(1:10 , ncol = 2)
)

customer02 <- list(
  fname = "Mary",
  lname = "Anne",
  age = 35 ,
  movies = c("Iron Man",
              "Aquaman",
             "The Flash"),
  address = c("Bangkok",
              "London")
  
)
# schemaless : each customer is not necessary to have same attribute Qty
# just like cust2 != cus01
# nested list
customer_db <- list(
  id01 = customer01 ,
  id02 = customer02
)

customer_db$id02$fname
customer_db$id02$lname
customer_db$id02$address[1]

# dataFrame
friends <- c("Toy",
             "John",
             "Mary",
             "Anna",
             "David"
             )

ages <- c(33 , 30 , 25 , 28 , 31)
movie_lover <- c(T,T,F,F,T)

cat_lover <- factor( c("cat","cat",
                       "dog","dog",
                       "cat"))
df <- data.frame(id = 1:5,
           friends,
           ages ,
           movie_lover,
           cat_lover)
df
View(df)

# How to subset df dataframe
df$friends[3:4]

df$movie_lover
df$cat_lover

# extract row 1 all col
df[2,      ]

# extract row 2 col 1-3
df[2 , 1:3]

# row 1 -2 all col
df[1:2 ,    ]

# row 1,3,5 col 4,5
df[c(1,3,5) , 4:5]

# apply with logical condition
# to find friend age < 30
df$ages<30

# in programming true=1 , false = 0
# so that we can use sum to count
# our friend whose age < 30 by
sum(df$ages<30)

# amt of friends whose age >= 30
sum(df$ages >= 30)

# amt of friends whose age is not 30
sum(df$ages != 30)
# amt of friends whose age is  30
sum(df$ages == 30)


# extract friends whose age<30 with all column
df[df$ages<30 , ]
df[df$ages>=30 , ]
# to find friend as movie_lover
df[df$movie_lover, ]
# to find friend as NOT movie_lover
df[!df$movie_lover, ]

# write csv file
# save that file in folder data
write.csv(df, "data/friends.csv")

# in case of working with desktop version of R , Pls do not forget to check working directory
getwd()


# breaktime for 10 min---------------
#-------------------------------

# How to remove index

write.csv(df, "data/friends.csv",
          row.names = FALSE)

# import csv file
getwd()
setwd("data")
getwd()

# to find existed file on folder "Data"
list.files()

# how to read csv file

df <- read.csv("data/friends.csv")

list.files()

# How to read csv file from internet
penguin <- read.csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv")

View(penguin)

# basic Data manipulation

# finding the mean value
mean(penguin$bill_length_mm ,
     na.rm = TRUE)

# translation 
#na.rm = TRUE : 
#pls remove NA before calculating mean

# to find sum
sum(penguin$bill_length_mm ,
     na.rm = TRUE)
#pls remove NA before calculating sum

# to find median
median(penguin$bill_depth_mm ,
    na.rm = TRUE)


# to find max and min
max(penguin$bill_depth_mm ,
       na.rm = TRUE)

min(penguin$bill_depth_mm ,
    na.rm = TRUE)

# instant summary
summary(penguin)

# How to preview dataframe
#check first 6 row
# 6 row is default value
head(penguin)

# preview 3 first and last rows
head(penguin,3)
tail(penguin,3)
# head and tail should be preview simultaneously

# check dimension

dim(penguin) # 344 rows 7 columns

# check datatype in each column
# using str (preview basic structure)
str(penguin)
# str =  structure 
# use to preview some data in df

# subset first 10 rows
(mini_penguin <- penguin[1:10 , ])

# How to create a new column
mini_penguin$newcolumn <- mini_penguin$bill_length_mm * 2

View(mini_penguin)

# How to drop column
mini_penguin$newcolumn <- NULL
View(mini_penguin)

# How about deleting column SEX
# method 1 using NULL

mini_penguin$sex <- NULL
View(mini_penguin)

# method 2  subset only column 1 to 6
# column sex is col 7 (will be ignored)
(mini_penguin <- mini_penguin[ , 1:6])


# How to select column + filter row
(result <- subset(mini_penguin,
                  bill_length_mm > 40,
                  c("species",
                    "island",
                    "bill_length_mm")
       ) 
  )
names(result)
# How to rename column
names(result) <- c("SPEC","LAND","BL")
result

View(penguin)

# How to count missing value by row
complete.cases(penguin)
# complete cell will represent TRUE

# sum the true value
nrow(penguin)
sum(complete.cases(penguin))
# diff = 2
nrow(penguin) - sum(complete.cases(penguin))

# extract only row which has incomplete cell
# filter only NA records
penguin[ !complete.cases(penguin), ]

## preview mtcars
data()

mtcars


head(mtcars)


# to find the summation for every col
apply(mtcars , MARGIN = 2 , sum)
# it will be aligned with column and sum it after reach the last bottom value


# remarks 
# IN margin 1 = row / 2 = column

head(mtcars)
apply(mtcars , 1, sum)
# it will be aligned with row and sum it after reach the most rightward value
#--------------------------------------
# trial for final exam

apply(mtcars, 2, mean())



#-----------------------------------

(df <- head(mtcars , 10) )

# try to replace value 108 and 20.22 with NA

df[3,3] <- NA # previously was  108
df[6,7] <- NA # previously was 20.22

df

# How many FALSE value found for this data frame (AKA df) ?
complete.cases(df)

# total = 2 
# only row with missing value
# return FALSE



## FUNCTION
my_sum <- function(x ,y) {
  # body function
  x + y
  
  
}

my_sum(2,5)
my_sum(10,"25")
# cannot operate with char


my_cube <- function(base ,power = 3){
  base ** power
}

my_cube(3)
my_cube(10)

my_cube(5,3)
my_cube(5,4)


# after placing default argument 
#for power  = 3
my_cube(5)
my_cube(5,4)
my_cube(10)
my_cube(2)
my_cube(2,20)

# in case of switching position 
# specify argument name is necceassay

my_cube(power = 5 ,base = 3)
my_cube(5,3)

# function return  more than 1 value
# return a list
# specifying return in R is OPTIONAL

test_function <- function(x){
  list(value1 = x+1 ,
       value2 = x*2 ,
       value3 = x**2 )

  
}

# Return value can be kept at variable


result <- test_function(5)

# using double square bracket
# to extract element from list

result[[1]]
result[[2]]
result[[3]]

# if the operation is named ,
# we can also use dollar sign $
result$value1
result$value2
result$value3

## function without input
greeting <- function() {
  print("Hello World")
}

greeting()

# control flow
# if / for / while

test01 <- function(score){
  if(score >= 80){
    print("Passed")
  }else {
    print("Failed")
  }
  
}
  

test01(85)
test01(5)
test01(79)


test02 <- function(score) {
  if(score >= 90){
    return("A")
  
  } else if(score >= 80) {
    return("B")
    
  } else if(score >= 70) {
    return("C")
    
  } else return("F")
}

test02(90)
test02(80)
test02(75)
test02(85)
test_result <- test02(62)

# for loop 
for(i in 1:10){
  print(i)
}

#while loop 
#while(TRUE) {
# do something }

count = 0

while (count < 5 ){
  print("Hello World")
  count <- count + 1
}

# get input from user
login <- function(){
  un <- readline("Username : ")
  pw <- readline("Password : ")
  if(un == "toyeiei" & pw == "123456"){
    print("Successfully Login. ")
  }else {
    print("Your username/Password is incorrect")
  }
  
  print("End")

}



# Homework - Pao Ying Chub 

pao__ying_chub <- function(){
  # print game rules
  
  print("Game starts!!")
  while (TRUE) { 
    hand <- c("rock", 
              "paper" ,
              "scissors")
    user_hand <- as.numeric(readline("Please select hand [1:rock , 2:paper , 3:scissors] "))
    cat(hand[user_hand],"\n")}
  
 
}



cat("Hello World")
# function without number
cat("Hello world\nThis is a second line")

# How to random number
sample(1:6 , size = 1)

sample(c("Rock","Paper", "Scissors"),1)

# try homework on datalore 
# and update on discord

x <- 100
diff(x, lag = 2)
diff(x, differences = 2)



  