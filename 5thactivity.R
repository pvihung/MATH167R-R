a=rep(x=1:4, times=5)
dim(a)= c(4,5)
a


b=rep(x=5:9, each=2, times=1)
b=matrix(b, nrow=5, ncol=2, byrow = TRUE)
b

a%*%b
