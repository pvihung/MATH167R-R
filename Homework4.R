# HOMEWORK 4: DATAFRAMES AND PATTERNS 

# QUESTION 1: 
# a. Create a data frame named Air.Pollution from the dataset air_pollution.txt
# Here, we can not use scan because it will release an error message 
# The reason for that error is because the columns right not is: 
#     State, County, County,.... (2 columns same name => error)
# so we must use read.table first, skip=1, and change the name of column 
air.pollution = read.table('DataSet\\air_pollution.txt', sep=',',
    skip =1, colClasses = c('character', 'character', 'character', 'numeric'))
air.pollution
# Since we need to combine 2 columns (the second and third column) 
names(air.pollution) = c('A', 'B', 'C', 'D')
air.pollution
air.pollution$A = paste(air.pollution$A, air.pollution$B, sep=', ')
air.pollution

new.air.pollution = data.frame(air.pollution$A,
                               air.pollution$C,
                               air.pollution$D)
new.air.pollution
names(new.air.pollution) = c('State County', 'County FIPS Code', '2010 Population')
new.air.pollution
# b. Add one more column to the dataframe that have created. The column contains 
# the amount of PM 2.5 particles in mg/m^3. The column name: "PM25 (mg/m3)"
# 65,NA,92,97,104,66,NA,NA, 124 (Make sure the column is numeric)
# names(dataframe)[names(dataframe)=="old name"] <- "new name"
z=c(65,NA,92,97,104,66,NA,NA,124)
new.air.pollution = cbind(new.air.pollution,z) 
names(new.air.pollution)[names(new.air.pollution) == 'z'] <- 'PM25 (mg/m3)'
new.air.pollution


# c. Using function rbind() to add one more row to the dataframe 
#   California, Glenn County, 6021, 28122, 34
help("rbind")

w = c('California, Glenn County', '6021', '28122', '34')
new.air.pollution = rbind(new.air.pollution, w)
str(new.air.pollution)

# d. Save the dataframe in a new file called air_pollution_update.txt
# * Character elements should be surrounded by quotes
# * The set should not include row number 1,2,...
# * Download the file on Canvas

# quote = FALSE - to not let the elements surrounded by quotes
# row.names = FALSE - to not include the index 
write.table(new.air.pollution, quote=FALSE,
            row.names = FALSE, file = 'air_pollution_updated.txt')


# QUESTION 2
# Close interval [2,3] should be divide into n subintervals of same width.
# The total number of endpoints of the subintervals is 𝑛 + 1.
# Write a function named end.pnt with the argument 𝑛, 
# that produces the endpoints of the intervals including 2 and 3. 
# You should use seq() with option along=... .
help(seq)
seq(2,3, along.with=rep(NA,4))
    