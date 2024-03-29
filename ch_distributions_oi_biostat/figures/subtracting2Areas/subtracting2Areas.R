library(openintro)
data(COL)

AddShadedPlot <- function(x, y, offset,
                          shade.start = -8,
                          shade.until = 8) {
  lines(x + offset, y)
  lines(x + offset, rep(0, length(x)))
  these <- which(shade.start <= x & x <= shade.until)
  polygon(c(x[these[1]], x[these], x[rev(these)[1]]) + offset,
          c(0, y[these], 0),
          col = COL[1])
  lines(x + offset, y)
}
AddText <- function(x, text) {
  text(x, 0.549283, text)
}

pdf('subtracting2Areas.pdf', 4, 0.7)
par(las = 1,
    mar = rep(0, 4),
    mgp = c(3, 0, 0))
X <- seq(-3.2, 3.2, 0.01)
Y <- dnorm(X)

plot(X, Y,
     type = 'l',
     axes = FALSE,
     xlim = c(-3.4, 16 + 3.4),
     ylim = c(0, 0.622))

AddShadedPlot(X, Y, 0, -8, 1.21)
AddText(0, format(0.8869 , scientific = FALSE)[1])

AddShadedPlot(X, Y, 8, -8, -0.3)
AddText(8, format(0.3821, scientific = FALSE)[1])

AddShadedPlot(X, Y, 16, -0.3, 1.21)
AddText(16, format(0.5048, scientific = FALSE)[1])

lines(c(3.72, 4.28), rep(0.549283, 2), lwd = 1)
lines(c(3 + 3, 2*3-3.5), c(0.2, 0.2), lwd = 3)

text(12, 0.549283,
     ' = ')
segments(rep(11, 2), c(0.17, 0.23), rep(13, 2), lwd = 3)
dev.off()



