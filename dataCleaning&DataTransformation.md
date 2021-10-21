# Data Cleaning and Data Transformation
## ขั้นตอนที่ 0 : ทำการเรียกใช้ตัวlibraryต่างๆ เเละ ทำการดาวห์โหลด dataset
### ตัวlibrary
```{R}
library(dplyr)
library(readr)
library(ggplot2)
library(readr)    
library(stringr)  
library(assertive) 
```
### dataset ที่ใช้(เราจะ filter เอาเเค่ใน 5 ปีเเละทำการปรับค่า price จะที่เป็นดอลล่า เป็น บาทเเทน ) 
```{R}
dataset <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/022_Bestselling_books/main/Group_mid/bestsellers_with_categories.csv")
```

##  ขั้นตอนที่ 1 : Data Transformation with dplyr
### 1.0 filter เเละ เปลี่ยนค่าภายใน Price จาก ดอลลาร์สหรัฐ เป็น บาท
```{R}
datasetcle <- dataset %>% filter(Year >= 2015 && Year <= 2019)
datasetcle$Price_baht <- datasetcle$Price*33.37
```
### 1.1 Rename
```{R}
datasetcle <- datasetcle %>% rename(Book_Name=Name)
datasetcle <- datasetcle %>% rename(Rating=`User Rating`)
datasetcle <- datasetcle %>% rename(Fiction=Genre)
datasetcle <- datasetcle %>% rename(Price_baht=Price)
```
### 1.2 Drop column
```{R}
datasetcle <- datasetcle %>% select(Book_Name,Author,Rating,Reviews,Price,Fiction)
```

## ขั้นตอนที่ 2 : Checking the types of values
```{R}
is.character(datasetcle$Book_Name)
is.character(datasetcle$Author)
is.numeric(datasetcle$Rating)
is.integer(datasetcle$Reviews)
is.numeric(datasetcle$Price)
is.factor(datasetcle$Fiction)
```

## ขั้นตอนที่ 3 : Changing the types of values
หลังจากทำการเช็ดในข้อที่ 2 เราทำการเปลี่ยน type of values ให้ตรงกับ ความต้องการของเรา
```{R}
datasetcle$Reviews <- as.integer(dataset$Reviews)
datasetcle$Fiction <- as.factor(datasetcle$Fiction)
```

## ขั้นตอนที่ 4 : Handling String with stringr 
ไม่ได้ทำเพราะ dataset ที่เรานำมานั้นไม่มีส่วนไหนต้องเเก้ไขหรือตัดข้อมูลข้างในออก

## ขั้นตอนที่ 5 : Removing duplicate data
เนื่องจากหนังสือบางเล่มนั้นได้รางวัลซ้ำเเต่คนละปีเราจึงทำการตัดตัวซ้ำออกนั้นเอง
```{R}
datasetcle %>% duplicated() %>% table()
datasetcle %>% duplicated() %>% sum()
datasetcle %>% filter(duplicated(datasetcle))
datasetcle <- datasetcle %>% distinct()
```
## ขั้นตอนที่ 6 : Handling missing data and outliers
```{R}
is.na(datasetcle) 
```
เนื่องจากไม่มีข้อมูลไหนเป็น null เลยไม่ต้องตัดข้อมูลที่เป็น null ทิ้ง
