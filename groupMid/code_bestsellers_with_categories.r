library(dplyr)
library(readr)
library(ggplot2)
library(readr)      
library(stringr)    
library(assertive)  

dataset <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/022_Bestselling_books/main/Group_mid/bestsellers_with_categories.csv")
#0
datasetcle <- dataset %>% filter(Year >= 2015 && Year <= 2019)
datasetcle$Price_baht <- datasetcle$Price*33.37
#1.Data Transformation with dplyr
#1.1 Rename
datasetcle <- datasetcle %>% rename(Book_Name=Name)
datasetcle <- datasetcle %>% rename(Rating=`User Rating`)
datasetcle <- datasetcle %>% rename(Fiction=Genre)
#1.2 Mutate and Transmute
glimpse(datasetcle)
#1.3 Drop column
datasetcle <- datasetcle %>% select(Book_Name,Author,Rating,Reviews,Price_baht,Fiction)

# plot graph
datasetcle %>% ggplot(aes(x=Rating))+ geom_bar()
# 3.Checking the types of values
is.character(datasetcle$Book_Name)
is.character(datasetcle$Author)
is.numeric(datasetcle$Rating)
is.integer(datasetcle$Reviews)
is.numeric(datasetcle$Price_baht)
is.factor(datasetcle$Fiction)

# 4.Changing the types of values
datasetcle$Reviews <- as.integer(dataset$Reviews)
datasetcle$Fiction <- as.factor(datasetcle$Fiction)

# 5. Handling String with stringr

# 6. Removing duplicate data
datasetcle %>% duplicated() %>% table()
datasetcle %>% duplicated() %>% sum()
datasetcle %>% filter(duplicated(datasetcle))
datasetcle <-
  datasetcle %>% distinct()
# 7. Handling missing data and outliers
#7.1. Missing Data
is.na(datasetcle)
#7.2. Outliers data & Range Values

write.csv(dataset, file = "D:/Project214/bestsellers_with_categories_clearing.csv")



