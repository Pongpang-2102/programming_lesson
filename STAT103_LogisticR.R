# Logistic Regression

# We use S-Curve 
# S Stands for : Sigmoid function


library(dplyr)

mtcars %>% 
  head()


str(mtcars)

# Covert am to factor
mtcars$am <- factor(mtcars$am , 
                    level = c(0,1) ,
                    label = c("Auto","Manual")
                    )
class(mtcars$am)

# use table to prepare a frequency table
table(mtcars$am)


#-----------------------------------------------
# Start building logistic Regression Model

# Split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n , size =  n * 0.7)
train_data <- mtcars [id ,  ]
test_data <- mtcars [ -id ,  ]

# Train Model
logit_model <- glm(am ~ mpg ,
                   data = train_data ,
                   family = "binomial")
p_train <- predict(logit_model , 
                   type ="response") ## Probability

# type = response "
# change data to be within 0 and 1


train_data$pred <- 
  if_else(p_train >= 0.5, "Manual","Auto")
  
# if our prob >= our threshold (0.5) the transmission would be manual , otherwise auto


#  calculating  model accuracy
# finding mean in this case is finding model accuracy
mean(train_data$am == train_data$pred)

# my chart (Puriwat) show mean == NA
## adToy (instructor) shown 0.8181818 (81.81%)

# glm : generalized linear models

## test model
p_test <- predict(logit_model , 
                   new_data = test_data,
                   type ="response") ## Probability

test_data$pred <- 
  if_else(p_test >= 0.5, "Manual","Auto")

mean(test_data$am == test_data$pred)


