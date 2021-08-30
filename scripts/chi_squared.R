### Chi-squared

x <- rnorm(10000000)
x <- data.frame(x)
x$x2 <- x$x^2

library(tidyverse)
ggplot(x, aes(x)) + geom_histogram(fill='white',color='black')

ggplot(x, aes(x2)) + geom_histogram(fill='white',color='black', bins=100)

mean(x$x2)
var(x$x2)

#2df
x$x3 <- x$x^2 + sample(x$x^2)
ggplot(x, aes(x3)) + geom_histogram(fill='white',color='black', bins=100)

#3df
x$x4 <- x$x^2 + sample(x$x^2)+ sample(x$x^2)
ggplot(x, aes(x4)) + geom_histogram(fill='white',color='black', bins=100, boundary = 0)
