# Comment


# Intro to R
1 + 1
2 * 2
3 ** 20
10 / 6

#print hello World
print("Hello World")

# create variables
my_name <- "Puriwat "
my_age <- 28
my_var <- "Jello"
# using variable name as snake case

# remove the variable
remove(my_var)

# data structure in R
# vector
1:10

seq(5,100 , 5) # start ,stop ,step
seq(5 , 50 ,2)

my_friends <- c("Toy",
                "ink",
                "aan")

my_friends[1]
my_friends[2]
my_friends[3]
my_friends[4]

# How to check the length of vector
length(my_friends)

ages <- c(33,30,25)

x <- c(10,20,30)
sum(x)
mean(x)
median(x)
var(x)
sd(x)
length(x) # same as count in GGsheet

# Function

greeting <- function() {
  print("Hello World")
}

# try to run very first function
greeting()

# create add_two_num
add_two_num <- function(a , b){
  return (a+b)
}

add_two_num(5,15)


# one line function
cube_num <- function(x) x**3

# similar to lambda function
cube_num(5)


# control flow
# if-else
score <- 50


# Single line used
#Not Recommended
if(score >= 80) print("Passed") else print("Failed")



grading <- function(score){
  if (score >= 80){
    return("Passed")
  }else {
    return("Failed")
  }
  
}
 
grading(85)
grading(80)
grading(20)



grading (50)

# grading with multiple students 
#using R
students <- c(85,90,56,68,92)

#Single line with multiple students
sapply(students , grading)


# simple while loop
count <- 0
while (count < 3){
  print("Hello!")
  count <- count + 1
  
}

# data type
# How to check type
is.numeric(ages)
is.logical(ages)


movie_lover <- TRUE
is.logical(movie_lover)
is.numeric(movie_lover)

# How to convert data type
text <- "100"
is.character(text)

text <- as.numeric(text)
is.numeric(text)
# data type has been converted already

# data structure

# creating dataframe from scratch
id <- c(1,2,3)
customer_name <- c("Toy",
                   "anne",
                   "marry")
city <- c("BKK" ,
          "LON" ,
          "JPN"
          )

customers <- data.frame(id ,
                        customer_name,
                        city)




membership <- data.frame(
  id = 1:3,
  member_tier = c("Gold",
                  "Gold",
                  "Silver")
)

View(membership)


# How to join table using merge
# default as inner join PK = FK

full_df <- merge(customers , 
                 membership ,
                 by = 'id')



# How to read & write csv file
stores <- read.csv("samsple_store.csv")

View(stores)

head(stores)
tail(stores)

stores[100 , ]

stores[99 ,c("Customer.Name" ,
             "Country",
             "City")
       ]

#-----------------------------------------

# Connect R to SQLlte
library(RSQLite)
con <-  dbConnect(SQLite(),"chinook.db")
con

#to find the existed table in our db

dbListTables(con)


top_ten_customer <-

dbGetQuery(con , "select firstname ,
                         lastname ,
                         country ,
                         email ,
                         phone
                  from  customers
                  limit 10")

View(top_ten_customer)

# to edit above query to be suitable
#for selecting Customer from USA
# can be done by

usa_customers <-
  
  dbGetQuery(con , "select firstname ,
                         lastname ,
                         country ,
                         email ,
                         phone
                  from  customers
                  where country= 'USA'
                  limit 10")

View(usa_customers)

# above info can be exported by
write.csv(usa_customers ,
          "data.csv")
# How to close database
dbDisconnect(con)


trial <- c(100, 200, TRUE, "300", 400)













