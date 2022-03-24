Firms <- Ornstein
View(Firms)
print(nrow(Firms))
print(ncol(Firms))
print(colnames(Firms))

sum(is.na.data.frame(Firms))

print(Firms[Firms$assets >= 10000 & Firms$assets <= 20000,])
print(Firms[Firms$interlocks <= 30,])
print(Firms[Firms$sector == 'TRN' & Firms$nation == 'CAN',])

Firms$log_asset <- log(Firms$assets)

hist(Firms$assets, breaks = 40)

plot(Firms$log_asset, 
     type = "o", 
     pch = 19, 
     cex = I(0.5), 
     col = "blue")

library(foreign)
write.dta(Firms, "Firms.dta")
