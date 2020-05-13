library(devtools)
install_github("DougLuke/UserNetR")

library(UserNetR)

library(statnet.common)
data("Bali")

library(sna)

rolelab <- get.vertex.attribute(Bali,"role")
plot(Bali,usearrows=FALSE,label=rolelab,displaylabels=T,label.col="darkblue")

