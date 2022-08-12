# to view built - in  data in R 
data()


# explore data

# start with calling Library
library(tidyverse)


# change iris dataframe to tibble
iris_df  <- as_tibble(iris) 

iris_df
# this dataset comes from Ronald Fisher
# Inventor of P-value

# extract col Species to store in Species object
Species <- iris_df$Species

# remove column Species from iris_df
iris_df <- iris_df %>%
  select(-Species)


# to overview for iris_df to make sure that column Species does not exist on our dataframme : iris_df
glimpse(iris_df)

#-------------------------------------------
# Explore Data with ggplot
#-----------------------------------------
# before we fit model , we need to make a data exploration
#-----------------------------------------
# to view relationship between sepal Length (x) and Sepal Width (y) in Scatter Plot with default setting

ggplot(iris_df , 
       aes(Sepal.Length , Sepal.Width)
       ) + 
  geom_point()

# to view relationship between Petal Length (x) and Sepal Width (y)

ggplot(iris_df , 
       aes(Petal.Length , Sepal.Width)
) + 
  geom_point()

# to view relationship between Petal Length (x) and Petal Width (y)


ggplot(iris_df , 
       aes(Petal.Length , Petal.Width)
) + 
  geom_point()

#---------------------------------------
# Fit K-Means
#---------------------------------------
# K - > 2,3,4,.....,10

# run k-mean from iris_df with k = 2

km_model <- kmeans(iris_df , centers = 2)


# to view value stored in km_model

# total sample size
nrow(iris_df)


# to view size after clustering in k part
km_model$size

# from our data which k = 2
# first cluster would be 53 , 
# other cluster would be 97


# HOw about changing k to 3 
km_model <- kmeans(iris_df , centers = 3)
km_model$size

# from our data which k = 3
# 1st / 2nd / 3 rd cluster would be 
# 50 , 38 ,62 respectively


# to ensure that our result will be reproducible (same result in different time ) / we need to set seed

set.seed(42)
km_model <- kmeans(iris_df , centers = 3)



#-------------------------------------
# Tips -- Additional
#-------------------------------------

# We can use for loop to run any k levels
# for (i in 1 : 10) {
  #models <- kmeans(center = k )
 # list(model$cluster)
#}

#------------------------------------------

km_model$size
Clusters <- km_model$cluster

# confusion Matrix (Theory)
# True label Species vs. Model Cluster

table(Species , Clusters)


# to view accuracy

(50 + 48 + 36) /150

# original data set
ggplot(iris , aes(Petal.Length , Petal.Width ,
                  col = Species)) +
  geom_point(size = 5) + 
  theme_minimal()









































