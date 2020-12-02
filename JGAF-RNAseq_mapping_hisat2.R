library(tibble)
library(tidyr)
library(dplyr)
library(readr)
library(data.table)
library(ggplot2)
library(ggpubr)
library(scales)
library(taRifx)


setwd ("/Users/ArnaudFERTET/Desktop/Papier")


##### Loading files

SRR085107 <- fread("SRR085107.SNPs.txt")
SRR080725 <- fread("SRR080725.SNPs.txt")

#SRR080725

C.SRR080725 <- SRR080725[REF=="C"]
C.T.SRR080725 <- C.SRR080725[ALT=="T"]
G.SRR080725 <- SRR080725[REF=="G"]
G.A.SRR080725 <- G.SRR080725[ALT=="A"]
SRR080725.ed <- merge(C.T.SRR080725, G.A.SRR080725, all=TRUE)
setkeyv(SRR080725.ed, c("#CHROM", "POS", "REF", "ALT"))

#SRR085107

C.SRR085107 <- SRR085107[REF=="C"]
C.T.SRR085107 <- C.SRR085107[ALT=="T"]
G.SRR085107 <- SRR085107[REF=="G"]
G.A.SRR085107 <- G.SRR085107[ALT=="A"]
SRR085107.ed <- merge(C.T.SRR085107, G.A.SRR085107, all=TRUE)
setkeyv(SRR085107.ed, c("#CHROM", "POS", "REF", "ALT"))

RNAediting <- merge(SRR085107.ed, SRR080725.ed)
