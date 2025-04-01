# Question 1:
survey = read_xlsx('DataSet\\survey.xlsx')
survey = as.data.frame(survey)
survey

# The provided data is in a long format, so I change it to 
# wide format by using unstack()
survey_unstack= unstack(survey, Count~Residence)
rownames(survey_unstack) = c('ABC', 'CBS', 'NBC', 'Other')

# Because the order of my columns are not correct, so I have to 
# rearrange it
survey_unstack = survey_unstack[, c('Urban', 'Suburban', 'Rural')]

# since the bar plot requires to use matrix, so I change it from 
# data frame to matrix 
matrix = as.matrix(survey_unstack)

barplot(matrix, main = 'A Television Viewing Survey',
        ylab='frequency', beside=TRUE, col=2:5, ylim=c(0,250)
)
legend('topright', legend=c('ABC', 'CBS', 'NBC', 'Other'),
       fill=2:5, box.lty = 0)

# Question 2:
colleges = c('Agr', 'A&S', 'BA', 'Edu', 'Engr')
majors=c(1500,11000,7000,2000,5000)

# I calculate the percentage of each majors by divide each major to 
# the sum of all majors
total_majors = sum(majors)
# as the label should contain percentage rounded to 1 decimal place
percentages=round((majors/total_majors)*100,1)

percentages
percentages_labels = paste(colleges, ', ', percentages, '%', sep='')
percentages_labels

pie(majors, labels = percentages_labels, radius=1, edges=120,
    main = 'Pie Chart for the Distribution of Undergrade majors',
    col = 2:6)

# Question 3: 
# a. 
set.seed(36)
trials=10
prob=0.3
n=100
samples = replicate(200, rbinom(n,trials,prob))
samples

# b. 
sample_mean = colMeans(samples)
sample_mean
a= min(sample_mean)
b= max(sample_mean)
a
b


# c. 
# Since we want to have 14 bars, we might want to have 14 breaks
hist(sample_mean, breaks=seq(a, b, length=14), freq=FALSE,
     col = "gray", border = "black", 
     xlab = "Sample Means", ylab = "Density", 
     ylim=c(0.0, 3.5), axes=FALSE)
axis(1, pos=0, at=round(seq(a,b,length.out=14),2))
axis(2, pos=a , at=seq(0, 3.5, by=0.5), las=2)

# d.
curve(dnorm(x, mean = 3, sd = sqrt(2.1/100)),
      add=TRUE, col = "red", lwd = 2,
      from=a,to=b)

# Question 4:
epilepsy=read_xlsx('DataSet\\Epilepsy.xlsx')
epilepsy=as.data.frame(epilepsy)
epilepsy
par(mfrow=c(2,1))
boxplot(epilepsy$Base ~ epilepsy$Trt, epilepsy,
          horizontal = TRUE, col = "gray", border='black',
          main = 'Study of Progabide versus Standard Therapy',
          xlab = 'baseline seizure rate', ylab = 'Treatment', 
          staplewex=0.08, at=(1:2), width=c(0.1,0.1), ylim=c(0,150))
# For treatment/base plot
# Outliers: There are outliers for both placebo and progabide treatments
# Spreads: The placebo treatment has a wider spread than progabide treatment
# Medians: The medians of both treatments are somewhat close, as the
# progabide is slightly higher 

boxplot(epilepsy$Age ~ epilepsy$Trt, epilepsy,
        horizontal = TRUE, col = 'gray', border='black',
        xlab = 'age', ylab = 'Treatment',
        staplewex=0.08, at=(1:2), width=c(0.1,0.1), ylim=c(15,45))
# For treatment/age plot
# Outliers: I think there is no outliers in this plot, since the age range is not 
# too wide, as well as the ages are really close to one another 
# Spreads: The progabide treatment has a wider spread compared to placebo treatment
# Medians: The medians are not close to one another, as median age of placebo treatment
# is higher than progabide treatment (around 2 to 4 years)