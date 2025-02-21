# HOMEWORK 3: Lists and Loops 

# Question 1
# a. Create the vector with the following elements 
opinions = c('agree', 'agree', 'missing', 'disagree', 'neutral', 'disagree', 'neutral', 'agree', 'missing', 'neutral' )

# b. Use one of the loop constructs to count the number of "missing" response 
# in the vector opinions
count_missing = 0 
for (value in opinions) {
  if (value== "missing"){
    count_missing = count_missing + 1;
  }
}

print(count_missing)

# Another way to approach this is to use index just like JAVA 
# (I wrote this part as a reminder for myself-Please dont grade this)
count.missing = 0
k =0
for (k in seq_along(opinions)){
  if (opinions[k] == 'missing'){
    count.missing = count.missing + 1;
  }
}
count_missing

# c. Use one of the loop constructs to make another vector opinions.updated
# by removing components with the value "missing" from Opinions
# Display the new vector. Note: the new vector should be shorter

# A good way to do add only word that is not "missing"
opinions.update = c()
for (value in opinions){
  if (value != "missing"){ 
    opinions.update = c(opinions.update, value);
  }
}
opinions.update 


# Question 2: The problem contains a few steps:
# a. Create a list named Roster whose components are
#  A vector with components Mary, John, Lisa. Name the component Name
Name = c("Mary", "John", "Lisa")
#  A numeric vector called GPA with the components 3.5, 3.7, 2.9
GPA = c(3.5, 3.7, 2.9)
#  A list name Test.Scores with two vector components 
#    Test 1: numeric vector (70, 80, 60)
Test1 = c(70, 80, 60)
#    Test 2: numeric vector (100, 95, 92)
Test2 = c(100,95,92)
Test.Scores = list(Test1, Test2)

# I assign all the variables into lists
# then assign those list to correct columns

Roster = list(
  Name = Name,
  GPA = GPA,
  Test.Scores = list(Test1 = Test1, Test2 = Test2)
)
str(Roster)


# b. Using indexing to access the elements of Roster that contain information 
# about Mary such as her GPA, and Test1 score. Display the result as a vector 
# with named components so it looks like as follows
#             Student       GPA       TEST 1
#              Mary         ...        ...

# Base on Question 2.a, we know that: 
# Name: Mary, GPA: 3.5, Test 1: 70, Test 2: 100
# So in order to access these information:
 
Mary_Name = Roster$Name[1]
Mary_GPA = Roster$GPA[1]
Mary_Test1 = Roster$Test.Scores$Test1[1]

Mary_Infomation = c(Mary_Name, Mary_GPA, Mary_Test1)
print(Mary_Infomation)

# c. For list Test.Scores, use function lapply or sapply to find the average
# scores on Test 1 and Test 2

f = function(x){
  mean(x)
}

average = lapply(Test.Scores, f)
print(average)

# d. Now add one more component to list Roster. The componenet should be named
# Standing, and it is a vector with elements "senior", "freshman", "sophomore". 
# Use str() to display the updated list Roster

Standing = c('freshman', 'sophomore', 'junior', 'senior')
Roster$Standing = Standing
str(Roster)

save.image()
