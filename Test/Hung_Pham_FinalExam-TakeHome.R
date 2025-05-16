# Final Exam: Take-Home Part 


# Question 1: 
# a. Table
ald=read.table('ALD.txt', skip=1)
names(ald)=c('values')
str(ald)
ald

size = round(length(ald$values),digits=2)
mean = round(mean(ald$values),digits=2)
median = round(median(ald$values),digits=2)
st.deviation = round(sd(ald$values),digits=2)
q1 = round(quantile(ald$values, 0.25),digits=2)
q3 = round(quantile(ald$values, 0.75),digits=2)
iqr = round(IQR(ald$values), digits=2)

Values = c(size, mean, median, st.deviation,
           as.numeric(q1),
           as.numeric(q3),
           iqr)
Characteristics = c('Size',
         'Mean',
         'Median',
         'St.Deviation',
         'Q1',
         'Q3',
         'IQR')

ald.data.frame = data.frame(Characteristics,Values)
ald.data.frame

attr(ald.data.frame,'row.names')=rep('',7)
ald.data.frame
table = ggtexttable(ald.data.frame)
table

# b. Boxplot
boxplot_question1 = ggplot(data=ald, aes(x=values)) + 
  geom_boxplot(col='blue',fill='lightblue')+
  scale_y_discrete()+
  labs(x='ADL measurements')

# Based on the plot, we can assume that there are no outliers
# The median is closer to the lower quantile  
# The whisker on the right is longer compared to 
# the left size 
# This shows that the values are skewed to the right

# c. Histogram
histogram_question1 =ggplot(data=ald, aes(x=values))+
  geom_histogram(aes(y=stat(density)),
                 col='blue', fill='lightblue', bins=7)+
  labs(x='ADL measurements',
       y='density')
# Based on the plot, I would say my assumption was 
# quite correct, as the first 2 bins on the left show 
# a rise before the rest 'skew' down

# d. qqplot
qqplot_question1 = ggplot(data=ald, aes(sample=values))+
  geom_qq(col='blue')+geom_qq_line(col='red')+
  labs(x='Theoretical Quantiles',
       y='ALD measurements')
# I think it is not plausible that ALD is at least approximately
# normally distributed. Since the boxplot and histogram 
# show a clear right-skewed trend
# moreover, the mean is not equal to median

# e. Combine all plots
combine = ggarrange(histogram_question1,
                    qqplot_question1,
                    boxplot_question1,
                    table,
                    ncol = 2,
                    nrow = 2)
annotate_figure(combine,
      top=text_grob('ALD observations for sample of 49 kidneys',
                    size=20,
                    col='red'))

# Question 2:
cars = datasets::cars
cars
par(mfrow=c(2,2),mar=c(3,4,3,1), cex=0.8)

hist_question2.1= hist(cars$speed, 
                     main='',
                     breaks=seq(4,25,along=1:8), 
                     xlab='',
                     ylab='',
                     xlim=c(0,30), 
                     ylim=c(0,20),
                     axes=FALSE)
axis(side=1, pos=0)
axis(side=2, pos=0, las=2)
mtext('Cars: Speed')
mtext('frequency', side=2, cex=1, line=1.1)


hist_question2.2=hist(cars$dist, 
                      main='',
                      breaks=seq(0,120,along=1:7), 
                      xlab='',
                      ylab='',
                      xlim=c(0,140), 
                      ylim=c(0,20),
                      axes=FALSE)
axis(side=1, pos=0, at=seq(0,140,20))
axis(side=2, pos=0, las=2)
mtext('Cars: Distance')
mtext('frequency', side=2, cex=1, line=1.1)

box_plot2.1 = boxplot(cars$speed, 
                      horizontal = TRUE,
                      ylim=c(0,30),
                      axes=FALSE)
axis(side=1)

box.plot2.2 = boxplot(cars$dist,
                      horizontal = TRUE,
                      ylim=c(0,120),
                      axes=FALSE)
axis(side=1)

mtext('Speeds and Distances of Cars in 1920',
      line=-1,
      outer=TRUE,
      cex=1.17)
