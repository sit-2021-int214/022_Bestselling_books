#import packages
library(readr)      
library(dplyr)      
library(DescTools)  
library(forcats)    
library(stringr)    
library(ggplot2)    
library(scales)

#import dataset
superstore <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

#explore dataset
View(superstore)
glimpse(superstore)

#PART2 learning function
#dplyr
superstore %>% select(`Order ID`, `Order Date`, `Customer Name`)
#forcats
superstore %>% mutate(Segment = fct_infreq(Segment)) %>% count(Segment)
#ggplot2
frq_category <- data.frame(table(superstore$Category))
frq_category <- frq_category %>% rename("category"=Var1,"count"=Freq)

frq_category %>% ggplot(aes(x="",y=count,fill=category)) + geom_bar(stat="identity", width=1, color="black") +
  coord_polar("y", start=0)+ theme_void() + geom_text(aes(label = count),
                                                      position = position_stack(vjust = 0.55))
#PART3 transform data
#-------1-------
superstore %>% select(State, City) %>% distinct() %>% arrange(desc(State))
#-------2-------
superstore %>% filter(Sales >= 100) %>% select(`Product Name`) %>% distinct()
#-------3-------
superstore %>% filter(Category == "Technology") %>% summarise(Mean = mean(Sales))
#-------4-------
superstore %>% mutate(Category = fct_infreq(Category)) %>% count(Category)
#-------5-------
superstore %>% filter(Category == "Technology") %>% mutate(`Sub-Category` = fct_infreq(`Sub-Category`)) %>% count(`Sub-Category`)
#-------6-------
superstore %>% group_by(State) %>% select(State, Sales) %>% summarise(average_sale = mean(Sales)) %>% arrange(desc(average_sale))

#PART4 visualization
#-------1-------
frq_category <- data.frame(table(superstore$Category))
frq_category <- frq_category %>% rename("category"=Var1,"count"=Freq)

frq_category %>% ggplot(aes(x="",y=count,fill=category)) + geom_bar(stat="identity", width=1, color="black") +
  coord_polar("y", start=0)+ theme_void() + geom_text(aes(label = count),
  position = position_stack(vjust = 0.55))

#-------2-------
frq_sub <- table(superstore$`Sub-Category`)
barplot(frq_sub, main = "Frequency of sub-category in superstore",ylab = "Frequncy",
        xlab = "Sub-category")