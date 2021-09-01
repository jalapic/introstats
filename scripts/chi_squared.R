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


ggplot(x, aes(x4)) + 
  geom_histogram(fill='white',color='black', bins=50, boundary = 0)+
  xlim(0,10)

###  https://www.statology.org/plot-chi-square-distribution-in-r/

curve(dchisq(x, df = 10), from = 0, to = 40)

curve(dchisq(x, df = 10), from = 0, to = 40,
      main = 'Chi-Square Distribution (df = 10)', #add title
      ylab = 'Density', #change y-axis label
      lwd = 2, #increase line width to 2
      col = 'steelblue') #change line color to steelblue



#create density curve
curve(dchisq(x, df = 10), from = 0, to = 40,
      main = 'Chi-Square Distribution (df = 10)',
      ylab = 'Density',
      lwd = 2)

#create vector of x values
x_vector <- seq(10, 40)

#create vector of chi-square density values
p_vector <- dchisq(x_vector, df = 10)

#fill in portion of the density plot from 0 to 40
polygon(c(x_vector, rev(x_vector)), c(p_vector, rep(0, length(p_vector))),
        col = adjustcolor('red', alpha=0.3), border = NA)


#create density curve
curve(dchisq(x, df = 10), from = 0, to = 40,
      main = 'Chi-Square Distribution (df = 10)',
      ylab = 'Density',
      lwd = 2)

#create vector of x values
x_vector <- seq(0, 10)

#create vector of chi-square density values
p_vector <- dchisq(x_vector, df = 10)

#fill in portion of the density plot from 0 to 10
polygon(c(x_vector, rev(x_vector)), c(p_vector, rep(0, length(p_vector))),
        col = adjustcolor('red', alpha=0.3), border = NA)




#create density curve
curve(dchisq(x, df = 10), from = 0, to = 40,
      main = 'Chi-Square Distribution (df = 10)',
      ylab = 'Density',
      lwd = 2)

#find upper and lower values for middle 95% of distribution
lower95 <- qchisq(.025, 10)
upper95 <- qchisq(.975, 10)

#create vector of x values
x_lower95 <- seq(0, lower95)

#create vector of chi-square density values
p_lower95 <- dchisq(x_lower95, df = 10)

#fill in portion of the density plot from 0 to lower 95% value
polygon(c(x_lower95, rev(x_lower95)), c(p_lower95, rep(0, length(p_lower95))),
        col = adjustcolor('red', alpha=0.3), border = NA)

#create vector of x values
x_upper95 <- seq(upper95, 40)

#create vector of chi-square density values
p_upper95 <- dchisq(x_upper95, df = 10)

#fill in portion of the density plot for upper 95% value to end of plot
polygon(c(x_upper95, rev(x_upper95)), c(p_upper95, rep(0, length(p_upper95))),
        col = adjustcolor('red', alpha=0.3), border = NA)



#create density curve
curve(dchisq(x, df = 10), from = 0, to = 40,
      main = 'Chi-Square Distribution (df = 10)',
      ylab = 'Density',
      lwd = 2)

#find upper and lower values for middle 95% of distribution
lower95 <- qchisq(.025, 10)
upper95 <- qchisq(.975, 10)

#create vector of x values
x_vector <- seq(lower95, upper95)

#create vector of chi-square density values
p_vector <- dchisq(x_vector, df = 10)

#fill in density plot
polygon(c(x_vector, rev(x_vector)), c(p_vector, rep(0, length(p_vector))),
        col = adjustcolor('red', alpha=0.3), border = NA)