
# 08 Hypothesis testing for 1 population mean 

### Question:
We want to perform a hypothesis test, with a .05 level of significance, to determine the price is $10 or less than it. We have 240 samples of fiction book. The average price of 240 samples is $10.85. We believed that the standard deviation is 8.57275.

## Step 0: Assign variables

```r
n <- 240
sd <- 8.57275
xbar <- 10.85
u0 <- 10 
```

## Step 1: State the hypothesis

```r 
h0: mue0 <= 10  ,ha: mue0 > 10
```

## Step 2: Level of significance

```r
alpha <- 0.05
```

## Step 3: Test statistic

```r 
z <- (10.85 - 10) / (8.57275/sqrt(240));
```
### result:
z = 1.536047

## Step 4: Finding P-value approach or Critical Value approach

```r 
# P-value approach
pvalue <- pnorm(1-z); pvalue
# Critical Value approach
zalpha <- qnorm(0.05); zalpha
```
### result:
P-value = 0.2959632 ,
zalpha = -1.644854

## Step 5: Compare

```r
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

# Result for using p-value approach
Accept H0

# Result for using critical value approach
Accept H0
```
## Step 6: Conclusion
From what we have processed hypothesis test, we can conclude that the average price is less than or equal to $10 as we expected in the test.

