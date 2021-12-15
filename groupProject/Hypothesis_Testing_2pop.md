# 08 Hypothesis Testing 2 pop 

##

## Step 0: Assign variables

```
n1 = 50
sd1 = 7.074213
mean1 = 10.42
n2 = 50
sd2 = 11.81436
mean2 = 13.18
u0 = 0
```

## Step 1: State the hypothesis

```
#h0: A-B = 0  ,ha: A-B != 0
```

## Step 2: Level of significance

```
alpha <- 0.025
```

## Step 3: Test statistic

```
#find se of mean 
se <- sqrt((7.074213^2)/50) + ((11.81436^2)/50)
#find z
z <- (10.42 - 13.18)  / se;

```
se of mean = 3.792028 , 
z = 1.536047

## Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pnorm(z); pvalue
# Critical Value approach
zalpha <- qnorm(0.025); zalpha
```
P-value = 0.233355 , 
zalpha = -1.959964

## Step 5: Compare

```
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
```
### Using p-value approach
Accept H0
### Using critical value
Accept H0

## Step 6: Conclusion
