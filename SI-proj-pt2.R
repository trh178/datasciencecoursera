data <- ToothGrowth
head(data)

require(graphics)
coplot(len ~ dose | supp, data = data, panel = panel.smooth)
