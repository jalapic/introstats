
# CI 1

d <- data.frame(id = "samp1", mean = 7.71, upper = 7.56, lower = 7.86)

library(tidyverse)

ggplot() + 
  geom_errorbar(data=d, mapping=aes(x=id, ymin=upper, ymax=lower), width=0.2, size=1, color="blue") + 
  geom_point(data=d, mapping=aes(x=id, y=mean), size=4, shape=21, fill="white") +
  geom_hline(yintercept = 7.8, color = 'red', lwd=1, lty=2) +
  coord_flip() +
  xlab("") +
  theme_classic()


# CI 2

d <- data.frame(id = c("samp1","samp2"), mean = c(7.71,7.81), upper = c(7.86,8.02), lower = c(7.56,7.72))

library(tidyverse)

ggplot() + 
  geom_errorbar(data=d, mapping=aes(x=id, ymin=upper, ymax=lower), width=0.2, size=1, color="blue") + 
  geom_point(data=d, mapping=aes(x=id, y=mean), size=4, shape=21, fill="white") +
  geom_hline(yintercept = 7.8, color = 'red', lwd=1, lty=2) +
  coord_flip() +
  xlab("") +
  theme_classic()




# CI 3

d <- data.frame(id = c("samp1-z","samp1-t","samp2-z","samp2-t"), 
                mean = c(7.79,7.79,7.87,7.87), 
                upper = c(7.94,7.93,8.02,7.994), 
                lower = c(7.63,7.65,7.72,7.746))

library(tidyverse)

ggplot() + 
  geom_errorbar(data=d, mapping=aes(x=id, ymin=upper, ymax=lower), width=0.2, size=1, color="blue") + 
  geom_point(data=d, mapping=aes(x=id, y=mean), size=4, shape=21, fill="white") +
  geom_hline(yintercept = 7.8, color = 'red', lwd=1, lty=2) +
  coord_flip() +
  xlab("") +
  theme_classic()



# CI 4

d <- data.frame(id = c("t","z"), mean = c(7.74,7.74), 
                upper = c(7.95,7.89), lower = c(7.53,7.59))

library(tidyverse)

ggplot() + 
  geom_errorbar(data=d, mapping=aes(x=id, ymin=upper, ymax=lower), width=0.2, size=1, color="blue") + 
  geom_point(data=d, mapping=aes(x=id, y=mean), size=4, shape=21, fill="white") +
  geom_hline(yintercept = 7.8, color = 'red', lwd=1, lty=2) +
  coord_flip() +
  xlab("") +
  theme_classic()


