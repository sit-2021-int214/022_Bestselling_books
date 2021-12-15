# 08 Hypothesis testing for 2 populations mean 

### Question:
We can collect sample data of best selling books in 2015 and 2016. The sample data will be shown in the following table.

|Data / Year|2015|2016|
|----|------|----|
|The average of price ($)|10.42|13.18|
|Sample standard deviation|7.074213|11.81436|
|Sample size|50|50|

We want to determine whether or not there is a significant difference between the average price in 2015 and 2016.
## Step 0: Assign variables

```r
n1 = 50
sd1 = 7.074213
mean1 = 10.42
n2 = 50
sd2 = 11.81436
mean2 = 13.18
u0 = 0
```

## Step 1: State the hypothesis

```r
h0: A-B = 0  ,ha: A-B != 0
```

## Step 2: Level of significance

```r
alpha <- 0.025
```

## Step 3: Test statistic

```r
#find se of mean 
se <- sqrt((7.074213^2)/50) + ((11.81436^2)/50)
#find z
z <- (10.42 - 13.18)  / se;

```
### result:
se of mean = 3.792028 , 
z = 1.536047

## Step 4: Finding P-value approach or Critical Value approach

```r
# P-value approach
pvalue <- pnorm(z); pvalue
# Critical Value approach
zalpha <- qnorm(0.025); zalpha
```
### result:
P-value = 0.233355 , 
zalpha = -1.959964

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
After we have done the hypothesis test, we can determine the test that there is no significant different between the average of price in 2015 and 2016.
