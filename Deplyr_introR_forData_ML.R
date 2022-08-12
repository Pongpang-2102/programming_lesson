
# comment
# CTRL+ENT run code
# CTRL+L Clear Console
1+1
2*2
5/2
5-2
5**2
income<- 30000
expense<-18000
savings<-income-expense
print(savings)
rm(savings)
rm(expense)
#function print
print("Hello World")

# create your own function
my_sum<-function(val1,val2){
  a+b
  
}

greeting<-Function(){
  print("Hello World")
}

#Data struction 
#1 ) Vector 
#2 ) Matrix
#3) List
#4) Dataframe (often used)

x<-1:100
print(x)

y<-5:9
print(y)

my_Name<-"Pongpang"
my_age<-27

friend<-c("Toy","Ann","Cher",
          "Ink","Zue","Dent")
#index in R start with 1

friend[1]
friend[2]
friend[3]
class(friend)

friend[1:3]
friend[4:6]

friend[C(1,3,5)]



dim(friend) <- C(2,3)



matrix(1:6)

matrix(1:6,ncol=3,byrow=TRUE)

#DATA STRUCTURE : LIST (THUMBDRIVE)

harddrive<-list(
  owner="Toy",
  size=512,
  unit="GB",
  movies=c("titanic","Avengers",
           "Fables")
  
  )

#customer DB
#nested list
customer_db<-list(
  id_01=list(),
  id_02=list()
)
# Customer data
# nested list
customer_db <- list(
  id_01 = list(
    name = "Toy",
    age = 33,
    city = "Bangkok"
  ),
  id_02 = list(
    fname = "Cher",
    lname = "Prang",
    age = 20,
    city = c("Bangkok","London")
  )
) 
customer_db <- list(
  id_01 = list(
    name = "Toy",
    age = 33,
    city = "Bangkok"
  ),
  id_02 = list(
    name = "Cher",
    name = "Prang",
    age = 20,
    city = c("Bangkok", "London")
  )
)


#DATA STRUCTURE : DATA FRAME
 friends<-c("Ann","Bee","Beam",
           "Tom","Abdunloh")
 ages<-c(33,33,29,35,36)
 movie_lover<-c(TRUE,FALSE,FALSE,
                TRUE,TRUE)

 #creat data farame
 
  
 df<-data.frame(
            ID=1:5,
            friends,
            ages,
            movie_lover
            )
 
 write.csv(df,"friends.csv"
           ,row.names = FALSE)
 
 #HEAD DATA FRAME
 
 #RUN CODE
library(dplyr)
library(skimr)
 
#read file
 url<-https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv
 df<-read.csv(url)
 
 #head df
 head(df)
 tail(df)
 summry(df)
 
 
 #Modern R-
 df%>%
   select(species,island,sex)%>%
   head()
  # head() %>%
   #summary() %>%
 
#create new pipeline
 
 df %>%
   select(species,body_mass_g)%>%
   
   
summarise(avg_body_mass=
          mean(correct_body_mass))
 
#export csv file

 #binary classification tree
 









