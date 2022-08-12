# data transformation / data viz

# package installation

install.packages( c("ggplot2","dplyr"))

# to call package
# otherwise its function will be uncallable

library(ggplot2)
library(dplyr)

# dplyr

dim(mtcars)

# extract data from col 1-3 ,5 and 11

select(mtcars , 1:3 , 5 , 11)

# extract data from column name
# new column name (desired) = 
# current column name (existed)

select(mtcars , 
       mile_per_gallon = mpg ,
       auto_manual = am ,
       horse_power = hp , 
       weight = wt )


#------------------------------------
# 1.select for all column 
# filter mpg < 15 only

# pipe operator
df_car <- mtcars %>% 
  # step 1 : select column
  select ( mile_per_gallon = mpg,
           auto_manual = am ,
           horse_power = hp , 
           weight = wt ) %>%
  
  # step 2 : filter row
  filter (mile_per_gallon <= 15) %>%
  
  # step 3 : sort horsepower (desc)
  arrange(desc(horse_power))

# data visualization

hist(mtcars$hp)  
# to create histrogram

plot(mtcars$hp , mtcars$mpg , pch = 16 ,col = 'red')
# to create a scatter plot

# graph creation using ggplot2

#modern graphics
ggplot(mtcars , aes(hp , mpg)) + 
geom_point() +
geom_smooth()+
geom_rug() + 
theme_minimal() + 
labs(title = "Hello World")

# How to create count column
mtcars$am

mtcars %>%  
  count(am)

# it can be

mtcars %>%
  mutate(am = ifelse(am == 0,
                     "Auto",
                     "Manual")) %>%
  count(am)


# To know more for K-mean clustering


## 01 Data Prep (50-80% from total time)
head(iris)
species <- iris$Species
iris_data <- iris %>% select(-Species)
    # remove column species using dplyr

## K-Mean Clustering (20-30%)
km_result <- kmeans(iris_data, 3)
cluster_memebership <- km_result$cluster

table(cluster_memebership)

# cross check
table(species , cluster_memebership)

#unsupervised learning


  
  

   

