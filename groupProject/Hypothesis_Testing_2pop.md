# 08 Hypothesis Testing 2 pop 

## Step to do:

0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion

##

Step 0: Assign variables

```
n1 = 50
sd1 = 7.074213
mean1 = 10.42
n2 = 50
sd2 = 11.81436
mean2 = 13.18
u0 = 0
```

Step 1: State the hypothesis

```
#h0: A-B = 0  ,ha: A-B != 0
```

Step 2: Level of significance

```
alpha <- 0.025
```

Step 3: Test statistic

```
#find se of mean 
se <- sqrt((7.074213^2)/50) + ((11.81436^2)/50)
#find z
z <- (10.42 - 13.18)  / se;

```
se of mean = 3.792028
z = 1.536047

Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pnorm(z); pvalue
# Critical Value approach
zalpha <- qnorm(0.025); zalpha
```
P-value = 0.233355
zalpha = -1.959964

Step 5: Compare

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

Step 6: Conclusion
