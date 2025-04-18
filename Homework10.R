# Homework 10 CONFIDENCE INTERVALS

# Question 1:

# To find CI for variance and sd, use these steps:
# Step 1:
# find length of sample n => degree of freedom = n-1
# find a = 1-conf.level
# find sample variance => to calculate the interval in final formula

# Step 2: 
# use qchisq(a/2,df) for high
#     qchisq(1-a/2,df) for low
# this is the chi-square use for the denominator of the final formula

# Step 3: 
# final formula 
# low = sqrt(df*s^2)/low)
# high = sqrt(df*s^2)/high)

sd_interval = function(data, conf.level){
  # Step 1: find all needed variable
  n = length(data)
  df = n-1
  a = 1 - conf.level
  s2 = var(data)
  # Step 2: calculate chi-square
  low = qchisq((1-a/2), df)
  high = qchisq(a/2, df)
  
  # Step 3: Fill in the final formula
  low_interval = sqrt(df*s2/low)
  high_interval = sqrt(df*s2/high)
  
  # Rounding 
  low_interval = round(low_interval,digits=4)
  high_interval = round(high_interval, digits=4)
  
  # Output the results
  conf.level.p = conf.level*100
  cat('The ', conf.level.p, '% interval is (', low_interval, ',', high_interval,')', sep='')
}
samples = rnorm(40, mean=123, sd=43)
sd_interval(samples, conf.level=0.98)

# Question 2: 
# a.
pressure= read_excel('pressure.xlsx')
str(pressure)

ggplot(data=pressure, aes(sample=pressure))+
  geom_qq(col='darkblue',fill='grey')+
  geom_qq_line(col='red')+
  labs(title='Concrete Pressure',
       x = 'Theoretical Quantile',
       y = 'Pressure')
# I believe this is normal distributed 
# since the points are very close to the qqline

# b. 
sd_interval(pressure$pressure, conf.level=0.95)

# Question 3:
# a. 
sd_interval2 = function(data, conf.level2){
  # Step 1: find all needed variable
  n = length(data)
  df = n-1
  a = 1 - conf.level2
  s2 = var(data)
  # Step 2: calculate chi-square
  low2 = qchisq((1-a/2), df)
  high2 = qchisq(a/2, df)
  
  # Step 3: Fill in the final formula
  low_interval2 = sqrt(df*s2/low2)
  high_interval2 = sqrt(df*s2/high2)
  
  # Rounding 
  low_interval2 = round(low_interval2,digits=4)
  high_interval2 = round(high_interval2, digits=4)
  
  # Output the results
  conf.level.p2 = conf.level2*100
  
  return(c(low_interval2, high_interval2))
}
# b.
sample = replicate(n=100, rnorm(15,mean=35,sd=3), simplify = TRUE)
# c.
conf.bounds = apply(sample,
                    MARGIN=2,
                    FUN=function(x) sd_interval2(x,conf.level2=0.95))
# d. 
sig = 3
d= sum(conf.bounds[1,]<3 &
      conf.bounds[2,] >3)
# e.
paste('The number of 95% CIs that contain sigma = ', sig, ' is ', d, sep='')
# in this seed, I got 98/100, I believe the result is close to the confidence level