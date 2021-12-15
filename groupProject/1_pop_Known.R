

dataset <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/022_Bestselling_books/main/groupMid/bestsellers_with_categories_clearing.csv")

View(population_1)

mue0 <- mean(dataset$Price,na.rm = T)

count(population_1)

sd

population_1 <- filter(dataset, dataset$Genre == "Fiction")

  n1 = 240
  mean <- mean(population_1$Price,na.rm = T)
  mue0  <- 10
  sd <- sd(population_1$Price,na.rm = T)
  alpha = 0.05
  
  # h0 : mue0 >= 10
  # ha : mue0 < 10
  
  #find z
  z <- (mean - mue0) / (sd/sqrt(n));
  
  #find pvalue of z
  pvalue <- pnorm(1-z);

  #find Critical Value
  zalpha <- qnorm(0.05);
  
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
