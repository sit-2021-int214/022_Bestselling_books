dataset <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/022_Bestselling_books/main/groupMid/bestsellers_with_categories_clearing.csv")

count(population_1)

count(population_2)


population_1 <- filter(dataset, dataset$Year == 2015)

population_2 <- filter(dataset, dataset$Year == 2016)


n1 = 50
n2 = 50
mean1 <- mean(population_1$Price,na.rm = T)
sd1 <- sd(population_1$Price,na.rm = T)
mean2 <- mean(population_2$Price,na.rm = T)
sd2 <- sd(population_2$Price,na.rm = T)

alpha = 0.025

#h0 : A - B = 0
#ha : A - B != 0
#find se of mean 
se <- sqrt((sd1^2)/n1) + ((sd2^2)/n2)
#find z
z <- (mean1 - mean2)  / se;

#find pvalue of z
pvalue <- pnorm(z);

#find Critical Value
zalpha <- qnorm(0.025);

# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
