library(readr)
library(dplyr)
library(ggplot2)
library(DescTools)

superStore <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superStore_sales.csv")
View(superStore)
glimpse(superStore)

superStore %>% select(`Row ID`, `Order ID`, `Customer ID`, `Product ID`)
superStore %>% group_by(Category)
superStore %>% count(Category)

#1
superStore %>% filter(Category == "Technology") %>% count(State, sort = T) %>% head(n=2)
#2
superStore %>% group_by(City) %>% tally(sort = T) %>% head(n=3)
#3
superStore %>% filter(`Ship Mode` == "First Class") %>% group_by(`Customer Name`) %>% tally(sort = T) %>% head(n=5)
#4
superStore %>% group_by(Category) %>% summarise(Average = mean(Sales))
#5
superStore %>% select(`Order ID`, Sales) %>% filter(Sales == min(Sales))
#6
superStore %>% filter(Category == "Furniture") %>% group_by(`Sub-Category`) %>% filter(Segment == "Consumer") %>% tally(sort = T)

#4.1
View(Segment)
Segment <- data.frame(table(superStore$Segment))
Segment <- Segment %>% rename("Segment"=Var1, "Order"=Freq)
Segment %>% ggplot(aes(x = " ", y = Order, fill = Segment)) + 
            geom_bar(stat = "identity", width=1, color = "black") +
            theme_grey() +
            coord_polar("y", start = 0) + 
            geom_text(aes(label = Order), position = position_stack(vjust = 0.50))
#4.2
View(Region)
Region <- data.frame(table(superStore$Region))
Region <- Region %>% rename("Region" = Var1, "Order"=Freq)
Region %>%  ggplot(aes(x = Region, y = Order)) + 
            geom_bar(stat = "identity", fill = "orange") +
            theme_grey() +
            geom_text(aes(label = Order), position = position_stack(vjust = 1.05))
  
