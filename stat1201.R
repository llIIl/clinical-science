x <- seq(-3, 3, length=1000)
y <- dnorm(x, mean = 0, sd = 1)
z_20 <- dt(x, df = 20)
z_10 <- dt(x, df = 10)
z_5 <- dt(x, df = 5)
z_1 <- dt(x, df = 1)

plot(x, y, type="l", lwd=1, col = "black")

lines(x, z_1, col = "red")
lines(x, z_5, col = "purple")
lines(x, z_10, col = "pink")
lines(x, z_20, col = "green")
