DIR = "/home/lucas/CPBS/7712/Mod1/hackathon/CPBS-7712-Hackathon1/data/kmer_counts"


mapped = read.csv(sprintf("%s/mapped.csv", DIR))
all = read.csv(sprintf("%s/all.csv", DIR))

rownames(mapped) = mapped$kmer
rownames(all) = all$kmer


mapped = mapped[,-c(1:2)]
all = all[,-c(1:2)]

library(ape)

dist.1= dist(t(mapped))
pcoa.1 = pcoa(dist)


dist.2 = dist(t(all))
pcoa.2 = pcoa(dist)






par(mfrow = c(1,2))
plot(pcoa.1$vectors, main = "mapped")
text(pcoa.1$vectors, row.names(pcoa.1$vectors))
plot(pcoa.2$vectors, main = "all")
text(pcoa.2$vectors, row.names(pcoa.2$vectors))




