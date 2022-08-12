
#EP01 starting with install.packages("dplyr")
instll.packages("dplyr")

# Installing package is no needed for next time

# EP 02 Load package
library(dplyr)

# read csv file into R studio
imdb <- read.csv("imdb.csv",stringsAsFactors = FALSE)
View(imdb)

# Review data structure
glimpse(imdb)

# Print head and tail of data
head(imdb)   # preview first 6 rows
head(imdb , 10) # preview as be specified
tail(imdb)  # preview last 6 rows
tail(imdb , 10) # preview as be specified

# EP03 SELECT COLUMNS
# column MOVIE_NAME , RATING is needed
select(imdb , 
       MOVIE_NAME ,
       RATING)

# same meaning 
# col 1 & 5 are selected
select(imdb , 1 ,5)

# How to rename column name
#the left side is the desired new name
# the right one is the current name
select(imdb , movie_name = MOVIE_NAME ,
              release_year =  YEAR)

# pipe operator - use for writing data pipeliine
head(imdb) 
imdb %>% head() # same result shown

# using pipe operator for rename column
imdb %>%
  select(movie_name = MOVIE_NAME ,
         release_year = YEAR) %>%
  head(10)

#-----------------------------------------
# EP04- Filter numeric columns

filter(imdb , SCORE >= 9.0)

# using filter with pipe operator
imdb %>% filter(SCORE >= 9.0)
# more comfortable to other pipe

# to call all column name using names()
names(imdb) <- tolower(names(imdb))
names(imdb)

# using and operator
imdb %>%
  select(movie_name , year , score) %>%
  filter(score >= 9 & year > 2000)

# using OR operator

imdb %>%
  select(movie_name ,length ,score) %>%
  filter(score == 8.8 |  score == 8.3 | score == 9.0)

# multiple OR (using IN operator)
imdb %>%
  select(movie_name , length , score) %>%
  filter(score %in% c(8.3 , 8.8 , 9.0))

# The result is same with using OR

#--------------------------------
# EP5 FILTER STRING COLUMN

# to find rate PG-13
imdb %>%
  select(movie_name ,
         genre ,
         rating) %>%
  filter(rating == "PG-13")

# to find DRAMA genre movie
# Drama as Exact Match
imdb %>%
  select(movie_name , genre , rating) %>%
  filter(genre == 'Drama')

# to find Drama as approximate match
#e.g Drama (only) or Drama , .......
imdb$genre
grepl("Drama" , imdb$genre)
# TRUE or FALSE will be returned

# copy above command to paste as below

imdb %>%
  select(movie_name , genre , rating) %>%
  filter(grepl("Drama" , imdb$genre)  )


# to find the movie with "the" in movie name
imdb %>%
  select(movie_name) %>%
  filter(grepl("The" , imdb$movie_name))

# case sensitive
# The != the / diff Q'ty 

#-------------------------------
# EP 6 MUTATE NEW COLUMN
# mutate- Use for create new column


imdb %>%
  select(movie_name ,
         score , 
         length) %>%
  mutate(
    score_group = if_else(
      score >= 9,
      "High Rating",
      "Low Rating") ,
    
    length_group = if_else(
      length >= 120 ,
      "Long Film" ,
      "Short Film" )
  
    )

# If we need to correct score
#using +0.1 in ALL score point
# it can be done by
imdb %>%
  select (movie_name ,
          score) %>%
  mutate(score_update = score + 0.1) %>%
head(10)


# old data can be overwritten by
# using same col name as below
imdb %>%
  select (movie_name ,score) %>%
  mutate(score = score + 0.1) %>%
  head(10)

#-------------------------------------
# EP.7 arrange data
#Same with Order by in SQL
# degault : ascending order
imdb %>%
  arrange(length) %>%
  head(10)

# sorting in descending order

imdb %>%
  arrange(desc(length)) %>%
  head(10)


# How to sort multiple column
#e.g. start with grouping by rate
# and sort length in descending order
# it can be done by
imdb %>%
  arrange(rating ,desc(length))

#----------------------------------------
# EP 08 Summary Statistics
imdb %>%
  filter(rating != "") %>% # remove blank rating 
  group_by(rating) %>%
  summarize(mean_length  = mean(length) ,
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length) ,
            n = n())
# using n() to count all df records

#-------------------------------------
# EP9. Join table

favorite_films <- 
  data.frame(
    id = c(5, 10 , 25, 30 , 98))


favorite_films %>%
  inner_join(imdb , 
             by = c("id" = "no"))

# imagine to SQL PK = FK

favorite_films

#-----------------------------------
# EP10 . export csv file

# write csv file (export result)
imdb_prep <- imdb %>%
  select(movie_name ,
         release_year = year ,
         rating ,
         length ,
         score) %>%
  filter(rating == 'R' &
         release_year > 2000)


imdb_prep

# Export file
write.csv(imdb_prep,
          "imdb_prep.csv",
          row.names = FALSE
          )

# col row (most left)
#will no be printed






















