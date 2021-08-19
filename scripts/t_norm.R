
## normal dist vs t-dist

curve(dnorm(x), -4, 4, col = "red")
curve(dt(x, df = 3), add = TRUE)

p9 <- ggplot(data.frame(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = dt, args = list(df = 8))
p9

library(ggplot2)

dist = data.frame(dist = rnorm(100))

plot1 <-ggplot(data = dist) + 
  geom_histogram(mapping = aes(x = dist, y=..density..), fill="steelblue", colour="black", binwidth = 1) +
  ggtitle("Frequences") +
  stat_function(fun = dnorm, args = list(mean = mean(dist$dist), sd = sd(dist$dist)))



t.values <- seq(-4,4,.05)

t.frame = data.frame(t.values,
                     df14 = dt(t.values,14),
                     std_normal = dnorm(t.values))

head(t.frame)

tf <- t.frame %>% pivot_longer(2:3)

ggplot(tf, aes(x = t.values, y = value, color=name)) +
  geom_line(lwd=1) +
  theme_minimal() +
  scale_color_manual(values=c("blue", "red")) +
  theme(legend.position = "none") +
  geom_vline(xintercept = 2.145, color = "blue", lty=2) +
  geom_vline(xintercept = -2.145, color = "blue", lty=2) +
  geom_vline(xintercept = 1.96, color = "red", lty=2) +
  geom_vline(xintercept = -1.96, color = "red", lty=2) +
  xlab("value of z/t")+
  ylab("")+
  geom_vline(xintercept = 0, color = "black", lty=3) 
  
