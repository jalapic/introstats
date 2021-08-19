## Remaking Figure 12.2 same/different a/b

# https://towardsdatascience.com/generate-simulated-dataset-for-linear-model-in-r-469a5e2f4c2e


library(car)
library(MASS)
library(lmtest)
library(tseries)
library(ggfortify)


##Linear Regression
#Generate the independent variable and the error
x1=rnorm(100,50,9)
x2=rnorm(100,200,64)
error=rnorm(100,0,16)
#Generate the dependent variable (b0=150, b1=-4, b2=2.5)
y1=150-(4*x1)+(2.5*x2)+error
#create the model
m1=lm(y1~x1+x2)
summary(m1)
autoplot(m1)


####
#Default plot
x1 <- rnorm(10000,10,2)
error=rnorm(10000,0,3)
b1 <- .704
a1 <- 10.32
a2 <- 8.32
a3 <- 5.32
y1 <- a1 + (b1*x1) + error
y2 <- a2 + (b1*x1) + error
y3 <- a3 + (b1*x1) + error

df<-data.frame(x1,y1,y2,y3)
library(tidyverse)

p1=ggplot() +
  stat_smooth(data=df, aes(x1,y1), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y2), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y3), method='lm',se=F, color='black') +
  ggtitle("Different a,  Same b") +
  xlab("X")+
  ylab("Y") + 
  xlim(2,24)+
  annotate("text", x = 21.5, y = 23.33, label = "y = 10.32 + 0.704x")+
  annotate("text", x = 21.5, y = 21.33, label = "y = 8.32 + 0.704x")+
  annotate("text", x = 21.5, y = 18.33, label = "y = 5.32 + 0.704x")


# add in extra red lines
xx1 <- rnorm(10000,0,2)
yy1 <- a1 + (b1*xx1) + error
yy2 <- a2 + (b1*xx1) + error
yy3 <- a3 + (b1*xx1) + error

ddf<-data.frame(xx1,yy1,yy2,yy3)
library(tidyverse)

ddff <- ddf[ddf$xx1<2,]
ddff <- ddff[ddff$xx1>-2,]


p2=ggplot() +
  stat_smooth(data=ddff, aes(xx1,yy1), method='lm',se=F, color='red',lty=2)+
  stat_smooth(data=ddff, aes(xx1,yy2), method='lm',se=F, color='red',lty=2)+
  stat_smooth(data=ddff, aes(xx1,yy3), method='lm',se=F, color='red',lty=2) +
  stat_smooth(data=df, aes(x1,y1), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y2), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y3), method='lm',se=F, color='black') +
  ggtitle("Different a,  Same b") +
  xlab("X")+
  ylab("Y") + 
  xlim(-2,24)+
  annotate("text", x = 21.5, y = 23.33, label = "y = 10.32 + 0.704x")+
  annotate("text", x = 21.5, y = 21.33, label = "y = 8.32 + 0.704x")+
  annotate("text", x = 21.5, y = 18.33, label = "y = 5.32 + 0.704x") +
  geom_vline(xintercept=0, color='firebrick',lwd=1)


library(gridExtra)
grid.arrange(p1,p2,nrow=1)


########

# Same a different b.

#Default plot
x1 <- rnorm(10000,10,2)
error=rnorm(10000,0,3)
b1 <- 0.350
b2 <- 0.704
b3 <- -0.622
a1 <- 8.32
y1 <- a1 + (b1*x1) + error
y2 <- a1 + (b2*x1) + error
y3 <- a1 + (b3*x1) + error

df<-data.frame(x1,y1,y2,y3)
library(tidyverse)

p3=ggplot() +
  stat_smooth(data=df, aes(x1,y1), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y2), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y3), method='lm',se=F, color='black') +
  ggtitle("Same a,  Different b") +
  xlab("X")+
  ylab("Y") + 
  xlim(2,24)+
  annotate("text", x = 20.8, y = 21.33, label = "y = 8.32 + 0.350x")+
  annotate("text", x = 20.8, y = 14.33, label = "y = 8.32 + 0.704x")+
  annotate("text", x = 20.8, y = -3.33, label = "y = 8.32 + -0.622x")


# add in extra red lines
xx1 <- rnorm(10000,0,2)
yy1 <- a1 + (b1*xx1) + error
yy2 <- a1 + (b2*xx1) + error
yy3 <- a1 + (b3*xx1) + error

ddf<-data.frame(xx1,yy1,yy2,yy3)
library(tidyverse)

ddff <- ddf[ddf$xx1<2.5,]
ddff <- ddff[ddff$xx1>-0.01,]


p4=ggplot() +
  stat_smooth(data=ddff, aes(xx1,yy1), method='lm',se=F, color='red',lty=2)+
  stat_smooth(data=ddff, aes(xx1,yy2), method='lm',se=F, color='red',lty=2)+
  stat_smooth(data=ddff, aes(xx1,yy3), method='lm',se=F, color='red',lty=2) +
  stat_smooth(data=df, aes(x1,y1), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y2), method='lm',se=F, color='black')+
  stat_smooth(data=df, aes(x1,y3), method='lm',se=F, color='black') +
  ggtitle("Same a,  Different b") +
  xlab("X")+
  ylab("Y") + 
  xlim(-2,24)+
  annotate("text", x = 20.8, y = 21.33, label = "y = 8.32 + 0.350x")+
  annotate("text", x = 20.8, y = 14.33, label = "y = 8.32 + 0.704x")+
  annotate("text", x = 20.8, y = -3.33, label = "y = 8.32 + -0.622x")+
  geom_vline(xintercept=0, color='firebrick',lwd=1)


grid.arrange(p1,p2,p3,p4,nrow=2)
