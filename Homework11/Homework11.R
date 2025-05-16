# HOMEWORK 11

# Question 1: 
# a. 
cost = c(159,120,480,149,270,547,340,43,228,202,240,218)
cost = as.data.frame(cost)
cost
ggplot(cost, aes(sample=cost)) + 
  geom_qq(col='blue')+ 
  geom_qq_line(col='red')+
  labs(title='Estimation in Railway Track Life-Cycle Cost',
       x='Theoretical Quantities',
       y='Repair Time')
# I believe the population distribution of repair time 
# is at least approximately normal since the dots are very 
# close to the qq line 

# b. 
# H0: mean=200 vs H1: mean>200
# sigma=150, a=0.05
size = length(cost$cost)
s.mean=sum(cost$cost)/size

zTest=function(mu,s.mean,sd,size){
  z=(s.mean-mu)/sd*sqrt(size)
  p.less = round(pnorm(z),digits=3)
  p.more = round(1-pnorm(z),digits=3)
  p.noteq= round(2*pnorm(-abs(z)), digits=3)
  test = c('Left-tailed Test: p-value:',
           'Right-tailed Test: p-value:',
           'Two-tailed Test: p-value:')
  p.value=format(c(p.less,p.more,p.noteq),scientific=FALSE)
  cat(labels=test, 
      p.value, 
      fill=3)
}

zTest(200,s.mean,150,size)
# the p-value in right-tailed test is 0.126
# p>a (0.126 > 0.05)
# We fail to reject
# there are no strong evidence to conclude 
# true average repair time exceeds 200 mins.

# c. sigma=0.5. Find the type II error probability 
# in part b knowing true mean = 300. 
zPower = function(mu.0, 
                  mu.prime, 
                  sigma,
                  alpha,
                  size,
                  type){
  z.alpha=qnorm(alpha,lower.tail=FALSE)
  z.half.alpha=qnorm(alpha/2, lower.tail=FALSE)
  arg=(mu.0-mu.prime)/sigma*sqrt(size)
  
  if (type == 'left-tailed'){
    beta = 1- pnorm(-z.alpha + arg)
  }
  else if (type == 'right-tailed'){
    beta = pnorm(z.alpha + arg)
  }
  else if (type == 'two-tailed'){
    beta = pnorm(z.half.alpha+arg)-pnorm(-z.half.alpha+arg)
  }
  else {
    stop('Wrong test type', call. = FALSE)
  }
  power = 1- beta
  output = c('Test Type',
             'Beta= ',
             'The Power of the Test')
  beta.and.power = format(c(beta,power), 
                          scientific = FALSE)
  cat(labels= output, 
      c(type, beta.and.power),
      fill=3)
}

zPower(200, 300, 150, 0.05, size, 'right-tailed')


# Question 2: 
# 5% of current customer qualify for memebership
# sample size of 500 yield 40 
# a=0.01, two.sided

prop.test(x=40,
          n=500,
          p=0.05,
          alternative='two.sided',
          conf.level = 0.95,
          correct = FALSE)

# We got p=0.002084 which is > a (0.002084<0.05)
# We can reject the null hypothesis 
# The test provides strong evidence that company premise is not correct


# Question 3:
mean_interval=function(data, 
                       conf.level,
                       type){
  s.mean=mean(data)
  sd=sd(data)
  n = length(data)
  z = qnorm(conf.level)
  upper.inter = round(s.mean + z*(sd/sqrt(n)), digits = 4)
  lower.inter = round(s.mean - z*(sd/sqrt(n)), digits=4)
  if (type=='lower'){
    cat(paste('A ', conf.level*100,'% lower confidence bound is ', lower.inter, '.', sep=''))
  }
  else if (type == 'upper'){
    cat(paste('A ', conf.level*100,'% upper confidence bound is ', upper.inter, '.', sep=''))
  }
  else {
    stop('Incorrect Type', call.=FALSE)
  }
}

mercury = read_xlsx('mercury_concentration.xlsx')
length(mercury$Concentration)
mean_interval(mercury$Concentration,0.96,'upper')

# There is 96% that the true average concentration of mercury 
# in fresh tuna is less than 0.3944 ppm.
