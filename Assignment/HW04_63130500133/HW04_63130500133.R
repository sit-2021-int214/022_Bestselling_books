# Library
library(readr)
library(dplyr)
library(ggplot2)
library(DescTools)
# Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
# 1.
# 1.0
is.na(dataset)
# 1.1
max(dataset$Rating)
min(dataset$Rating)
mean(dataset$Rating)
Mode(dataset$Rating)
# 1.2
max(dataset$Reviews)
min(dataset$Reviews)
mean(dataset$Reviews)
Mode(dataset$Reviews)
# 1.3
dataset$Book_title %>% duplicated() %>% table()
dataset$Book_title %>% duplicated() %>% sum()
# 1.4
dataset$Description %>% duplicated() %>% table()
dataset$Description %>% duplicated() %>% sum()
dataset %>% filter(duplicated(dataset$Description))
# 1.5
max(dataset$Number_Of_Pages)
min(dataset$Number_Of_Pages)
mean(dataset$Number_Of_Pages)
Mode(dataset$Number_Of_Pages)
# 1.6
dataset %>% count(Type)
# 1.7
max(dataset$Price)
min(dataset$Price)
mean(dataset$Price)
Mode(dataset$Price)

# 2.
# 2.1
A1 <- dataset  %>% filter(Rating >=4.5) %>% select(Book_title)
A1 
# 2.2
A2 <- dataset %>% filter(Rating == 4.0 )  %>% summarise(Mean=mean(Price))
A2   
# 2.3
A3 <-  dataset  %>% filter(Rating == min(Rating)) %>% summarise(count = n())                        
A3
# 2.4
x<-dataset %>% filter(Type == "Kindle Edition") %>% summarise(count = n())
y<-dataset %>% filter(Type == "ebook") %>% summarise(count = n())
x-y
# 2.5
A5 <- dataset %>% filter(Reviews >= 1000) %>% summarise(Mode = Mode(Type))
A5
# 2.6
A6 <- dataset %>% filter(Type == "Kindle Edition") %>% summarise(min=min(Number_Of_Pages),max= max(Number_Of_Pages)) 
A6
# 3.
# 3.1
# Graph relation between Rating and Reviews
scat_plot0 <- dataset %>% filter(Reviews <= 2000 )%>% ggplot(aes(x=Rating,y=Reviews))+
  geom_point(aes(color=Type)) +geom_smooth()
scat_plot0

# การกระจายข้อมูลในช่วง Reviews = 0 - 50
scat_plot1 <- dataset %>%filter(Reviews<50)%>%ggplot(aes(x=Rating,y=Reviews))+
  geom_point(aes(color=Type)) 
scat_plot1

# การกระจายข้อมูลในช่วง Reviews = 50 - 1000
scat_plot2 <- dataset %>% filter(Reviews <= 1000 ) %>% filter(Reviews >= 50 )%>%ggplot(aes(x=Rating,y=Reviews))+
  geom_point(aes(color=Type)) 
scat_plot2

# การกระจายข้อมูลในช่วง Reviews = 1000 - 6000
scat_plot3 <- dataset %>% filter(Reviews <= 6000 ) %>% filter(Reviews >= 1000 )%>%ggplot(aes(x=Rating,y=Reviews))+
  geom_point(aes(color=Type))
scat_plot3
# 3.2
# แผนภูมิเเท่งเเสดงจำนวนของ type ต่างๆ
scat_plot4 <- dataset %>% ggplot(aes(x=Type)) + geom_bar(aes(color=Type))
scat_plot4
# 4.
# 4.1
scat_plot6 <- dataset %>% mutate(Type = fct_infreq(Type)) %>% ggplot(aes(x=Type)) + geom_bar(aes(color=Type)) 
scat_plot6
# 4.2
scat_plot6 <- dataset %>% mutate(Type = fct_rev(Type)) %>% ggplot(aes(x=Type)) + geom_bar(aes(color=Type)) 
scat_plot6