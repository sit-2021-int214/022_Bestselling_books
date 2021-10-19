# Data Cleaning and Data Transformation
## ขั้นตอนที่ 0 : ทำการเรียกใช้ตัวlibraryต่างๆ เเละ ทำการดาวห์โหลด dataset
### ตัวlibrary
library(dplyr)
library(readr)
library(ggplot2)
library(readr)      
library(stringr)    
library(assertive)  
### dataset ที่ใช้(เราจะ filter เอาเเค่ใน 5 ปี ) 
dataset <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/022_Bestselling_books/main/Group_mid/bestsellers_with_categories.csv")
datasetcle <- dataset %>% filter(Year >= 2015 && Year <= 2019)


##  ขั้นตอนที่ 1 : Data Transformation with dplyr
### 1.1 Rename
datasetcle <- datasetcle %>% rename(Book_Name=Name)
datasetcle <- datasetcle %>% rename(Rating=`User Rating`)
datasetcle <- datasetcle %>% rename(Fiction=Genre)
### 1.2 Mutate and Transmute
### 1.3 Drop column
datasetcle <- datasetcle %>% select(Book_Name,Author,Rating,Reviews,Price,Fiction)

### plot graph ลอง plot graph มาเพื่อดูลักษณะของข้อมูล
datasetcle %>% ggplot(aes(x=Rating))+ geom_bar()
## ขั้นตอนที่ 2 : Checking the types of values
is.character(datasetcle$Book_Name)
is.character(datasetcle$Author)
is.numeric(datasetcle$Rating)
is.integer(datasetcle$Reviews)
is.numeric(datasetcle$Price)
is.factor(datasetcle$Fiction)

## ขั้นตอนที่ 3 : Changing the types of values
datasetcle$Reviews <- as.integer(dataset$Reviews)
summary(datasetcle$Reviews)

datasetcle$Fiction <- as.factor(datasetcle$Fiction)
summary(datasetcle$Fiction)

## ขั้นตอนที่ 4 : Handling String with stringr 
## ขั้นตอนที่ 5 : Removing duplicate data
datasetcle %>% duplicated() %>% table()
datasetcle %>% duplicated() %>% sum()
datasetcle %>% filter(duplicated(datasetcle))
datasetcle <-
  datasetcle %>% distinct()
## ขั้นตอนที่ 6 : Handling missing data and outliers
### 6.1. Missing Data
is.na(datasetcle)
### 6.2. Outliers data & Range Values
