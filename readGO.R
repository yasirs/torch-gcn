library(biomaRt)

gaf <- read.table(file = "data/goa_human.gaf", header = T, comment.char = "!", sep = "\t", fill = F, quote = '"')
