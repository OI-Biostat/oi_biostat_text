# bar graph of distribution of number heads, 3 coin tosses

library(openintro)
data(COL)

x.values = c(0, 1, 2, 3)
x.probs = c(1/8, 3/8, 3/8, 1/8)

x.dist.table = as.table(cbind(x.values, x.probs))
x.dist.table
barplot(x.probs, names.arg = c("0", "1", "2", "3"), xlab = "Values of X", ylab = "Probabilities")

myPDF("barPlotCoinTossing.pdf",
      4.9,
      3,
      mar = c(2, 5, 0.5, 0.5),
      mgp = c(2.2, 0.6, 0))
barplot(x.probs, col=COL[1], ylim=c(0,.4), width=2, names.arg = c("0", "1", "2", "3"), xlab = "Values of X", ylab = "Probabilities")

dev.off()
