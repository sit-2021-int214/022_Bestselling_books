
# 08 Hypothesis Testing 1 pop 

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


## Step 0: Assign variables

```
n <- 240
sd <- 8.57275
xbar <- 10.85
u0 <- 10 
```

## Step 1: State the hypothesis

```
#h0: mue0 >= 10  ,ha: mue0 < 10
```

## Step 2: Level of significance

```
alpha <- 0.05
```

## Step 3: Test statistic

```
z <- (10.85 - 10) / (8.57275/sqrt(240));
z
```
z = 1.536047

## Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pnorm(1-z); pvalue
# Critical Value approach
zalpha <- qnorm(0.05); zalpha
```
P-value = 0.2959632
zalpha = -1.644854

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

