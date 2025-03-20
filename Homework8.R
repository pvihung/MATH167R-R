#HOMEWORK 8
install.packages("aplpack")
#Question 1:
# a. Stem() and stem.leaf()
# Describe the shape of the data
gravity= read_xlsx('DataSet\\gravity.xlsx')
spec_gravity = gravity$spec_gravity
stem(spec_gravity)
stem.leaf(spec_gravity)

# | 2: represents 0.12
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

# Based on the stem.leaf plot, we can see that the the majority 
# of the data is 4 and 5, so I might say it just a little skewed to the left

# I think it is unimodal, as the peak is long, rather than actually form 2 peaks 

# b. hist(), make a density plot for the gravity data
