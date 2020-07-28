library(geneListPie)
library(data.table)
data("goslim.human.all")

aa <- read.table(file = "data/BIOGRID-MV-Physical-3.5.187.tab3.txt", sep = "\t", quote = '"', comment.char = "", header = T)
aa <- as.data.table(aa)
aa = aa[Organism.Interactor.A == 9606][Organism.Interactor.B== 9606]
allgenes = unique(c(aa$Official.Symbol.Interactor.A, aa$Official.Symbol.Interactor.B))
allgenes.upper = unique(toupper(allgenes))

num.gs = length(goslim.human.all)
slimlist = lapply(goslim.human.all, FUN = function(xx) {
  line = strsplit(xx, "\t")[[1]]
  sym = toupper(line[3:length(line)])
  sym
})


names(slimlist) = sapply(goslim.human.all, FUN = function(xx) {
  strsplit(xx, "\t")[[1]][1]
})


allgenes2memberships = sapply(X = allgenes.upper, FUN = function(gg) {
  sapply(X = slimlist, FUN = function(glist) {
    (gg %in% glist)
  })
})

write.csv(allgenes2memberships, "gene_goslim_matrix.csv")
