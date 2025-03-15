# Homework 7 SAMPLE, DISTRIBUTIONS, GRAPHS

# Question 1: Using the Poission distribution to model the number of failure in
# in pipelines of various type. Suppose that for cast-iron pipe of a particular
# length, the expected number of failure is 1. Then X, the number of failures, has 
# a Poisson distribution with mean=1. Write r-code that computes the following P

# a. P(X<=5)
# In order to calculate the probability, we need x and lambda 
# In Possion, mean (E(X) = lambda) => lambda=1 
ppois(5,lambda = 1, lower.tail= TRUE) # Mean it will calculate P(X<=q)

# b. P(X=2)
dpois(2,lambda = 1)


# Question 2: # Normally distributed 
# Mean=30mm, sd=7.8mm
# What is the 75th percentile of the defect length distribution 
qnorm(0.75,mean=30,sd=7.8)

# Question 3: 4 digit PIN has no restriction on the digits (0-9),repetition is allowed
# Use functions sample() and replicate() to generate 10 random PINs

# we will want to use sample() to create a random sample of 4 digits
# then use paste() to combine 4 digits into a string 
# then repeat it 10 times to great 10 PINs 
random.pins = replicate(10, paste(sample(0:9, 4, replace=TRUE), collapse = ''))
random.pins

# Question 4: N(0,1) as the sample size increase
# Contain the densities of the standard normal distribution and two t-distributions
# with df of 5 and 10. 
x=seq(-3,3,0.1)
plot(x,dnorm(x),type='l', axes=FALSE,xlab='',ylab='',col='red', 
     main='Standard Normal and t-distribution \nComparing Densities', font.main=1)
axis(1,at=seq(-3,3,1),pos=0)
axis(2,las=1,at=c(0.0,0.1,0.2,0.3,0.4), pos=-3)
lines(x,dt(x,df=5),col='blue',lty=1)
lines(x,dt(x,df=10),col='black',lty=2)

legend(x=1.2, y=0.4, legend=c('N(0,1)','t-dist, df=5','t-dist, df=10'),
       col=c('red','blue','black'), box.lty=0, lty=c(1,1,2))

