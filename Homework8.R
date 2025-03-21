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
# which is just a litlte shewed 
# I believe it is unimodal because 
# 4* and 5* have the highest numbers of contributor, but they are close 
# enough to not form a new peak 

# b. Using hist() make a density plot for the gravity data
# We know that Density = SG * 1000 

hist(spec_gravity, main='Density Histogram for gravity', breaks=seq(0.2,0.9,0.1), 
     ylab = 'Density', xlab='gravity', freq = FALSE, 
     xlim=c(0.2, 0.9), ylim=c(0,5))


# Question 2
diameter = read_xlsx('DataSet\\diameters.xlsx')
diameters = diameter$C1
diameters
stripchart(diameters, pch=1, method='stack', at=0, frame.plot = FALSE, xlim = c(2,14),
           xlab='diameter', main='The dotplot for Diameters', col='blue')

