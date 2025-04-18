# HOMEWORK 8

install.packages('aplpack')

# a.use function stem() and stem.leaf() to plot 
# Describe the shape of the data
gravity = read_xlsx('DataSet\\gravity.xlsx')
# since stem() only work with 
spec_gravity = gravity$spec_gravity
stem(spec_gravity)
spec_gravity
# The decimal point is 1 digit(s) to the left of the |
#   3 | 1
# 3 | 56678
# 4 | 000112222234
# 4 | 5667888
# 5 | 144
# 5 | 58
# 6 | 2
# 6 | 6678
# 7 | 
# 7 | 5
  
stem.leaf(spec_gravity)
# 1 | 2: represents 0.12
# leaf unit: 0.01
# n: 36
# 1    3* | 1
# 6    3. | 56678
# (12)   4* | 000112222234
# (7)   4. | 5667888
# 11    5* | 144
# 8    5. | 58
# 6    6* | 2
# 5    6. | 6678
# HI: 0.75

# I would describe the shape of the data is a little skewed and unimodal 
# Based on the plot I create, I would say most of the data is 4* and 5*, 
# which is just a little (negatively) skewed 
# I believe it is unimodal because 
# 4* and 5* have the highest numbers of contributor, but they are close 
# enough to not form a new peak 

# b. Using hist() make a density plot for the gravity data
# We know that Density = SG * 1000 

hist(spec_gravity, main='Density Histogram for gravity', breaks=seq(.3,.8,along=1:7), 
     ylab = 'Density', xlab='gravity', freq = FALSE, 
     xlim=c(0.2, 0.9), ylim=c(0,5))


# Question 2
# a. Create a dot plot
diameter = read_xlsx('DataSet\\diameters.xlsx')
stripchart(diameter$C1, pch=1, method='stack', at=0, frame.plot = FALSE,
           xlab='diameter', main='The dotplot for Diameters', col='blue', 
           axes = FALSE, offset=0.4)
axis(1, pos=-0.02, at=seq(2,14,2))
# Based on the plot I created, I would say most of the data is 7, 8 and 9, which 
# is a little (positively) skewed
# Same with the previous question, I do think this is unimodal because its peak 
# is at 8

# b. Create a hist()
rel.freq.h= hist(diameters, breaks=seq(1.5,13.5,along=1.5:13.5))
rel.freq.h$counts = rel.freq.h$counts/sum(rel.freq.h$counts)
str(rel.freq.h)
plot(rel.freq.h, ylim = c(0.0, 0.3), xlim=c(0,14), axes = FALSE,
     ylab='relative frequency', xlab='diameters', main='Relative Frequency Histogram for Diameters')
axis(1,pos=0, at=c(0,1,2,3,4,5,6,7,8,9,10,12,14))
axis(2,pos=0, at=c(0.0,0.1,0.2,0.3), las=2)
