# HOMEWORK 5

# Question 1: 
# A personnel director for a large firm categorizes colleges and universities as
# most desirable, good, adequate, and undesirable for purpose of hiring their graduates.

# a. Use an appropriate function covered in the section “Dataframes” to read the file
# ratings.txt. The resulting object should be a character vector with 68 components
ratings = scan('DataSet\\ratings.txt', what= character(0))

str(ratings)

# b. Create a factor from the character vector in part a. Levels of the factor should be 
# ordered as follows: Undesirable < Adequate < Good < Most desirable
rating_factor = factor(x= ratings,levels=c('Undesirable', 'Adequate', 'Good', 
                                           'Most desirable'), ordered = TRUE)
# This will help us to set the order of the levels we want
# But the original vector will not be sorted, so now it depends on what vector we want 
# to see

# vector that is NOT sorted
print(rating_factor)

# vector that is sorted
sorted_vector = sort(rating_factor)
print(sorted_vector)

# c. Use an appropriate option of function factor() to express ratings as integers from 0
# through 4, where 0=”Undesirable”, 1=”Adequate”, 2=”Good”, and 3=”Most
# desirable”. Display the resulting vector.

# we need to assign specific integer values to levels 
rating_int = as.integer(rating_factor) -1

# vector (in numeric) is NOT sorted
print(rating_int)

# vector (in numeric) is sorted
sorted_vector_int = sort(rating_int)
print(sorted_vector_int)


# Question 2: 
# An experiment was conducted to determine the effects of four different
# pesticides (P1, P2, P3, P4) on the yield of fruit tree from three 
# different varieties (V1, V2, V3) of a citrus tree. 

# a. Use read.table( ) or scan( ) to read the data from the file
# fruit_unstacked.txt and create a data frame called fruitUnstacke\
fruitUnstacked = read.table('DataSet\\fruit_unstacked.txt', header = TRUE, sep =',')
fruitUnstacked

# b. Convert fruitUnstacked to a stacked data frame named fruitStacked. Use
# functions stack( ) and/or scan( ) to accomplish the goal. The new data frame should
# contain three columns named as follows: Yield, Pesticide, Variety.

# As Yield is numerical variables, we will want to stack it first it first then 
# adding the variety in later

# stack all the pesticide columns
fruitstacked = stack(fruitUnstacked[, c('Pesticide.P1', 'Pesticide.P2', 
                                    'Pesticide.P3', 'Pesticide.P4')])
fruitstacked # now it will contain only 2 columns values and ind
             # contains Yield and Pesticide 

# now we add the new column Variety in
# when we use stack, we basically turn 4 columns of pesticides into 1 single column
# so for every variety, we will need to have 4 rows, every row indicates a type of 
# pesticides. 
fruitstacked$Variety = rep(fruitUnstacked$Variety, each=4)

names(fruitstacked) = c('Yield', 'Pesticide', 'Variety')
fruitstacked
# this is how the dataframe might look like 
#  Yield    Pesticide Variety
# 1     20 Pesticide.P1      V1
# 2     21 Pesticide.P1      V1
# 3     20 Pesticide.P1      V1
# 4     20 Pesticide.P1      V1
# 5     19 Pesticide.P1      V1
# 6     22 Pesticide.P1      V1
# 7     24 Pesticide.P1      V1
# 8     23 Pesticide.P1      V1
# 9     24 Pesticide.P1      V1
# 10    17 Pesticide.P2      V1
# 11    18 Pesticide.P2      V1
# 12    16 Pesticide.P2      V1
# 13    18 Pesticide.P2      V2
# 14    18 Pesticide.P2      V2
# 15    20 Pesticide.P2      V2
# 16    20 Pesticide.P2      V2
# 17    21 Pesticide.P2      V2
# 18    20 Pesticide.P2      V2
# 19    24 Pesticide.P3      V2
# 20    23 Pesticide.P3      V2
# 21    24 Pesticide.P3      V2
# 22    23 Pesticide.P3      V2
# 23    20 Pesticide.P3      V2
# 24    34 Pesticide.P3      V2
# 25    27 Pesticide.P3      V3
# 26    28 Pesticide.P3      V3
# 27    27 Pesticide.P3      V3
# 28    20 Pesticide.P4      V3
# 29    19 Pesticide.P4      V3
# 30    18 Pesticide.P4      V3
# 31    18 Pesticide.P4      V3
# 32    19 Pesticide.P4      V3
# 33    17 Pesticide.P4      V3
# 34    22 Pesticide.P4      V3
# 35    22 Pesticide.P4      V3
# 36    23 Pesticide.P4      V3

# c. Use function write.table() to save fruitStacked as fruit_stacked.txt. Utilize
# the options of function write.table to obtain a dataset whose elements are
# surrounded by quotes, the rows of the dataframe 
# should not be numbered (1, 2, ...; review homework 4), and use comma as a delimiter.
write.table(fruitstacked, quote=TRUE, sep=',', row.names = FALSE, file= 'fruit_stacked.txt' )

# d. Use function aggregate() to find the average yield for each combination of
# Variety and Pesticide (for ex. Variety V1 and Pesticide P2). 
# The resulting data frame should have the columns named as follows: 
# Variety, Pesticide, Average.
help("aggregate") # this function is used to split data into subsets and computes 
                  # summary statistics for each 
                  # is will be the object, which is Yield column
                  # by require a list (Variety and Pesticide)
                  # FUN here will need to be mean 
combination = list(Variety = fruitstacked$Variety,
                   Pesticide = fruitstacked$Pesticide)
average_yield=aggregate(fruitstacked$Yield, by = combination, FUN = mean)

names(average_yield)[3] = 'Average'
average_yield

# e. Unstack fruitStacked by variable Variety and name the dataframe
# yieldByVariety. Then unstack fruitStacked by variable Pesticide and name the
# dataframe yieldByPesticide. Display the results
help(unstack)
yieldByVariety = unstack(fruitstacked, form = Yield ~ Variety)
yieldByVariety
# > yieldByVariety
# V1 V2 V3
# 1  20 18 27
# 2  21 18 28
# 3  20 20 27
# 4  20 20 20
# 5  19 21 19
# 6  22 20 18
# 7  24 24 18
# 8  23 23 19
# 9  24 24 17
# 10 17 23 22
# 11 18 20 22
# 12 16 34 23

yieldByPesticide = unstack(fruitstacked, form = Yield ~ Pesticide)
yieldByPesticide

# > yieldByPesticide
# Pesticide.P1 Pesticide.P2 Pesticide.P3 Pesticide.P4
# 1           20           17           24           20
# 2           21           18           23           19
# 3           20           16           24           18
# 4           20           18           23           18
# 5           19           18           20           19
# 6           22           20           34           17
# 7           24           20           27           22
# 8           23           21           28           22
# 9           24           20           27           23
