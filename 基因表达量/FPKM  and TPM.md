## FPKM


### 读取gff文件，并通过exonBy()函数提取基因的外显子信息  
```
library(GenomicFeatures)
txdb <- makeTxDbFromGFF("~/R/Hass-ref-genome/hass_geneannotation.gff",format="gff")
#同时，我们进一步可以通过reduce()函数来避免重复计算重叠区
#lapply函数：对列表、数据框数据集进行循环，输入为列表，返回值为列表

exons_gene <- exonsBy(txdb,by="gene")
exons_gene_lens <- lapply(exons_gene, function(x){sum(width(reduce(x)))})


class(exons_gene_lens)

exons_gene_lens1 <- as.data.frame(exons_gene_lens)
dim(exons_gene_lens1)


exons_gene_lens1 <- t(exons_gene_lens1)
dim(exons_gene_lens1)

write.csv(exons_gene_lens1, file="gene_Length.csv")
exons_gene_lens2 <- read.csv("gene_Length.csv", header=T)

colnames(exons_gene_lens2) <- c("gene","Length")
View(exons_gene_lens2)

readscounts <- read.table("read_counts.txt", header=T)

mycounts <- merge(exons_gene_lens2, readscounts, by="gene", all=F)
dim(mycounts)
mycounts[1:3,1:6]

rownames(mycounts)<-mycounts[,1]
mycounts<-mycounts[,-1]
mycounts[1:3,1:3]

kb <- mycounts$Length / 1000
write.csv(kb, file="kb.csv")


countdata <- mycounts[,2:5]
rpk <- countdata / kb

tpm <- t(t(rpk)/colSums(rpk) * 1000000)
head(tpm)

fpkm <- t(t(rpk)/colSums(countdata) * 10^6) 
head(fpkm)
write.csv(fpkm, file="mRNA_fpkm.csv")
write.csv(tpm, file="mRNA_tpm.csv")
```
