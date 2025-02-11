# Homework 1 

# Question 1
# 1.a Write down the version number of R installed on your computer 
R.version

# 1.b Write down the platform under which R is running on your computer 
R.version$platform

# 1.c List the four commands displayed in the console window just above the 
# first command prompt 
licence()
contributors()
citation()
demo()
help()
help.start()
q()


# Question 2
#2.a File Open Document on OS X or File Open Script on Windows, which open a 
# dialog box to load a previously saved script into the R editor 
# Control + O

#2.b Edit Clear Console, which clears the screen in the console window
# Control + L

# Question 3
dir.create("compStat")
#3.a In the R editor, execute the first line of ex1-3.R and note the result 
# displayed in the R console
# [1] 1

#3.b Source ex1-3.R from the R console and note the result displayed. Which 
# line of command does the result correspond to? Explain 
source("compStat/ex1-3.R")
# The result correspond to the second line of the ex1-3.R. 
# The reason for my answer is that:
# First line (without print()) is automatically calculate and can only return 
# the result if it is the last line of the script => So it is not the first line
# The second line (with print()) will show the answer to the console no matter
# it is the last line or not 

