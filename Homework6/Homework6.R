# Homework 6

# Question 1
# a. Create vector 1:30 and transform it into a matrix M with 
# 5 rows and 6 columns. Fill by row
vector = 1:30
M = matrix(vector, nrow=5, ncol=6, byrow = TRUE)
M

# b. name the rows and columns of matrix M, so the resulting matrix 
# looks like as follows

# Use functions rownames, colnames, and options do.NULL, prefix 
rownames(M, do.NULL =TRUE, prefix='row')
rownames(M)=c('Production Line #1', 
                   'Production Line #2',
                   'Production Line #3',
                   'Production Line #4',
                   'Production Line #5')
colnames(M, do.NULL=TRUE, prefix='col')
colnames(M)=c('Day #1',
                   'Day #2',
                   'Day #3',
                   'Day #4',
                   'Day #5',
                   'Day #6')
M
# c. Using indexing, access all elements in
M[4,] # matrix[index_of_row, index_of_column]

# d. Use function rowSums to find the total of each row of matrix
# M and using the function cbind(), add one more column 
# to the matrix M. Name the column "Total"
help(cbind)
Total = rowSums(M)
M= cbind(M, Total)
M


# Question 2
# a. Create an empty matrix of size 10x5
empty= matrix(nrow=10, ncol=5)
empty

# b. Use apply() to fill the matrix with 5 random samples of size 10 
# from the NORMAL DISTRIBUTION, so the samples are in the columns of matrix
x=10
new = apply(empty, MARGIN=2, FUN=function(x){ # margin=2 since the structure
  rnorm(x, mean=0, sd=1)                # of the empty is 10x5, it will need
})                                    # to print in column wise
new
# # [,1]       [,2]       [,3]       [,4]       [,5]
# [1,]  1.4599489 -0.5271889 -2.7613948  2.2165392  1.9482591
# [2,] -0.3816982 -1.1162233 -0.2832942 -2.1942778 -0.5948176
# [3,]  0.1215205  0.5925949  1.1621867  1.6533494 -1.6074145
# [4,] -0.5634249  0.0528713  2.4960981  1.2359539 -1.5490657
# [5,] -0.4719530  0.4186505  1.5314127  1.1062417  1.4734980
# [6,]  0.4251094  0.1873790 -0.4616488  0.5873476 -0.1774842
# [7,] -1.3655380 -1.2235232 -0.8572973  1.7682602 -1.2398531
# [8,] -1.6119306 -1.4858773 -0.7578315  1.0073122 -0.7801109
# [9,] -0.9291037 -2.3441331 -2.0077865  0.7264987 -0.7364005
# [10,] -0.4453311  0.2390664  0.7544814  0.5583649  0.1428330

# c. Use function apply() to find the standard deviations of the 5 samples 
# listed in the columns of the matrix from part b 
sd = apply(new, MARGIN=2, FUN=sd)
sd


# Question 3
# a. Use read_excel function from package readxl to download the data
# Create df named Crime.rate. Dont forget to load the package
install.packages(c('readxl', 'writexl'))
Crime.rate=read_excel('DataSet\\crime_rate.xlsx')
Crime.rate

# b. Arrange the rows of the df Crime.rate so that violent crimes are listed
# in the decreasing order. Name the new data frame Crime.rate.sorted
Crime.rate.sortred = Crime.rate[order(Crime.rate$`Violent Crime`, 
                                      decreasing= TRUE),]
Crime.rate.sortred

# c. Use write_xlsx from writexl to save df Crime.rate and Crime.rate.sorted in 
# 2 different sheets of the new file crime_rate_updated.xlsx 
# Name: Crime.rate -> Original 
# Name: Crime.rate.sorted -> Sorted
write_xlsx(
  x= list(Original=Crime.rate, Sorted=Crime.rate.sortred),
  'Crime_rate_updated.xlsx'
)

