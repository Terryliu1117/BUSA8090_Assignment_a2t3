library(devtools)
install_github("DougLuke/UserNetR")

library(UserNetR)

library(statnet.common)
data("Bali")

library(sna)

op <- par(mar=c(0,0,0,0))
plot(Bali,displaylabels=TRUE,label.cex=0.8,pad=0.4,label.col="darkblue")
par(op)
