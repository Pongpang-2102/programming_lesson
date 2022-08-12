# STAT 103 _ Linear Regression and Correlation
# sprint video before Live 07.1 Stat
# Part R : HH:mm : 1:42

# start with correlation
#-----------------------------------------------

# 1. correlation

#----------------------------------------------

head(mtcars)


# to view Pearson Correlation 
# (General use for numeric data)

cor(mtcars$hp, mtcars$mpg )
cor(mtcars$wt, mtcars$mpg )

# to plot chart 
plot(mtcars$hp , mtcars$mpg)

# hp would be x / mpg would be y


# change point style 

plot(mtcars$hp , mtcars$mpg ,pch = 16 )

plot(mtcars$wt , mtcars$mpg ,pch = 16 )

plot(mtcars$wt , mtcars$hp,  pch = 16 )

# to view correlation matrix
cor(mtcars[             , c("mpg","wt","hp") ] )
 
# Working with dplyr (tidyverse) 

library(dplyr)

corMat <-
mtcars %>%
  select(mpg , wt  , hp , am) %>%
  cor()

# It will be shown with same answer


# to call our saved result
corMat 



# How to compute correlation and significant test

# Is our correlation significant ?
cor(mtcars$hp, mtcars$mpg )

# to test for significance
cor.test(mtcars$hp, mtcars$mpg)


#-----------------------------------------------
# from our result after running above code
# we found that our calculated p-value is 1.788e-7
#which is lower than 0.05 -> so , that relationship is statistically significant that means changing hp affected to mpg at 95% CI
#----------------------------------------------

# to check number of our total cars
# or being known as records
nrow(mtcars)

cor.test(mtcars$hp, mtcars$mpg)

#------------------------------------------------

# 2. Linear Regression

#-------------------------------------------------
## mpg =  f(hp)

lm(mpg ~ hp , data = mtcars) 

# (mpg ~ hp) means : mpg is a function of hp

lmFit <-  lm(mpg ~ hp , data = mtcars) 
lmFit

# to view summary of data
summary(lmFit)


lmFit$coefficients

lmFit$coefficients[1] + lmFit$coefficients [2] * 200

# to remove word  " (intercept)  " , we can us double bracket or [[1]] as below


# prediction

lmFit$coefficients [[1]] + lmFit$coefficients [[2]] * 200

# it can be interpreted that
# if our hp = 200 -- > mpg would be 16.4532

#-----------------------------------------
# how about prediction for many cars ( 5 cars)

#  starting with creating dataframe

# our 5 new car has  horse power as below , and we need to know that what are the result value from our new car horse power given ?
new_cars <- data.frame(
  hp = c(250 , 320 , 400 ,410 , 450)
)


new_cars


# predict()

# to predict mpg using hp 

predict(lmFit , newdata = new_cars)

# why our predicted mpg is negative value ?

# assign our predicted mpg value back to existed dataframe : new_cars by

new_cars$mpg_pred <- 
  predict(lmFit , newdata = new_cars)
new_cars

# to remove unwanted column
new_cars$hp_pred <- NULL


summary(mtcars$hp)
# our model learnt from max hp at 335 and min at 52



# do not extrapolate beyond data which we used it to train model

# How to troubleshooting that problems
# 1. Collect more data (extending our range)
# our model will be applicable with unseen data better

# to run again
lmFit <-  lm(mpg ~ hp , data = mtcars) 
lmFit
summary(lmFit)

#-------------------------------------------------
# root mean square error (RMSE)

mtcars %>%
  head()

# Multiple Linear Regression

# this case we will  use 3 variable for prediction

## mpg = f(hp ,wt , am)
## mpg = intercept + b0 * hp + b1 *wt + b2 *am


lmFit_v2 <- lm(mpg ~ hp + wt + am , 
               data = mtcars)


lmFit_v2

# start with calculating mpg by hand 
coefs <- coef(lmFit_v2) 


# write a formulation based on excel file previously
coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1

# predicted mpg would be 18.51583 (same with excel)

#-------------------------------------------------

# How to build full model

lmFit_full <- lm(mpg ~. , data = mtcars)

lmFit_full


# Explanation : (mpg ~.)

# every independent variables will be selected to predict mpg value


# how to remove one variable (this case is "gear" ) after all variables has been selected for our prediction

# we can remove it using below code

lmFit_full <- lm(mpg ~. - gear , data = mtcars)

lmFit_full

# gear has been removed already

# How to build full model (again)

lmFit_full <- lm(mpg ~. , data = mtcars)
lmFit_full

# to calculate rmse
mtcars$predicted <- predict(lmFit_full)

head(mtcars)

# Train RMSE
## starting with calculate error
squared_error <- (mtcars$mpg - mtcars$predicted) ** 2
squared_error

 (  rmse <- sqrt(mean(squared_error))   )

#-----------------------------------------------
## How to split data

# start with randomly split

# we need to randomize from number  1 -10 and collect 3 different number
sample(1:10 , 3)

# but the result can be fixed using set.seed before running sample
set.seed(42)
sample(1:10 , 3)
n <- nrow(mtcars)
n

# we will  run sample from sample 1 to sample n
# and sampling 80%  to use as trained data
id <- sample(1:n , size =  n * 0.8)

train_data <- mtcars [id ,  ]
test_data <- mtcars [ -id ,  ]
# -id : we removed id which be used at train_data




## train model 
model1 <- lm(mpg ~ hp + wt , 
             data = train_data)

# p-train as predicted train_data
# (that code will create vector named p-train)
p_train <- predict(model1)
p_train

error_train <- train_data$mpg - p_train 

rmse_train <- sqrt(  mean(error_train**2 )  ) 
rmse_train

## test model
P_test <- predict( model1 , newdata = test_data)
error_test <- test_data$mpg - P_test
(rmse_test <- sqrt(mean(error_test**2)))

#-----------------------------------------------
## print result

# to write as sentence (same as print("....")) in python

# we may use paste()  function

paste("RMSE  Train  :", rmse_train)

# another function : we may use cat() function


cat("RMSE  Train  :", rmse_train,"\n")
cat("RMSE  Test  :", rmse_test)



cat("RMSE  Train  :", rmse_train,
    "\nRMSE  Test  :", rmse_test)

#--------------------------------------------------

# overfitting
# work better with train_set
# work bad with test_set


# try to reduce overfit with add 1 more variables
# for training model : How does it work ?

# Split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n , size =  n * 0.7)
train_data <- mtcars [id ,  ]
test_data <- mtcars [ -id ,  ]

# Train Model
model1 <- lm(mpg ~ hp + wt +am + disp , 
             data = train_data)
p_train <- predict(model1)
error_train <- train_data$mpg - p_train 
( rmse_train <- sqrt(  mean(error_train**2 )  )  )

## test model
P_test <- predict( model1 , newdata = test_data)
error_test <- test_data$mpg - P_test
(rmse_test <- sqrt(mean(error_test**2)))

# Print result
cat("RMSE  Train  :", rmse_train,
    "\nRMSE  Test  :", rmse_test)

#-------------------------------------------------
# Homework : try to do logistic regression

#---------------------------------------------------
# Logistic regression :

# Use sigmoid function to covert output
# to be within [0,1] range ()
# this graph would be shown as S-curve 
















