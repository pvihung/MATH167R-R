#HOMEWORK 9:

# Question 1:
# a.
install.packages(ggplot2)
welds=read_excel('welds.xlsx')
welds
ggplot(data=welds, aes(x=strength))+
  geom_histogram(col='blue', fill='grey', breaks=seq(4000,6000,200))+
  scale_x_continuous(breaks=seq(4000,6000,200))+
  scale_y_continuous(breaks = seq(0, 25, 5))+
  labs(title='Shear Strength of Ultrasonic Spot Welds: Histogram',
       x='Shear Strength (lb)',
       y='Frequency',
       subtitle = 'J. of Aircraft, 1983: 552-556')

# b.
ggplot(data=welds, aes(sample=strength))+
  geom_qq(col='blue') + geom_qq_line(col='red') +
  labs(title='Shear Strength of Ultrasonic Spot Welds: Histogram',
       y='Shear Strenth (lb)', x='Theoretical Quantiles',
       subtitle = 'J. of Aircraft, 1983: 552-556')

# c. What can you conclude about the distribution of shear strenght 
# I think this is normal distributed since most of the values 
# is in the range of 5000-5400, and there is no skewness

# d. 
a=ggplot(data=welds, aes(x=strength))+
  geom_histogram(col='blue', fill='grey', breaks=seq(4000,6000,200))+ ylim(0,20) +
  scale_x_continuous(breaks=seq(4000,6000,200))+
  scale_y_continuous(breaks=seq(0,25,5))+
  labs(x='Shear Strength (lb)',
       y='Frequency')

b= ggplot(data=welds, aes(sample=strength))+
  geom_qq(col='blue') + geom_qq_line(col='red') +
  labs(y='Shear Strenth (lb)', x='Theoretical Quantiles') 

d=ggarrange(a,b,ncol=2)
annotate_figure(d, 
  top=text_grob('Comparison of Properties of Joints Prepared by Ultrasonic Welding and Other Means', size=14, col='blue', face='bold'), 
  bottom=text_grob('J. of Aircraft, 1983: 552-556',size=10,col='blue'))

# Question 2:
insect=datasets::InsectSprays
ggplot(data=insect, aes(x=spray, y=count,fill=spray))+
  geom_boxplot() + 
  labs(title='Effectiveness of Insects Sprays',
       x='spray',
       y='counts of insects',
       subtitle='The counts of insects treated with different insecticides.') +
  scale_fill_discrete(name='The Type of Spray')