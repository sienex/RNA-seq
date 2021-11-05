## FPKM

### 读取gtf文件，并通过exonBy()函数提取基因的外显子信息  
```
library(GenomicFeatures)
txdb <- makeTxDbFromGFF("hass_geneannotation.gtf",format="gtf")
exons.list.per.gene <- exonsBy(txdb, by = "gene")
```

### 同时，我们进一步可以通过reduce()函数来避免重复计算重叠区
```
exonic.gene.sizes <- lapply(exons.list.per.gene,function(x){sum(width(reduce(x)))})
```
### 

rbind： 根据行进行纵向合并，就是行的叠加，m行的矩阵与n行的矩阵rbind()最后变成m+n行，合并前提：rbind(a, b)中矩阵a、b的列数必需相符  
lapply函数：对列表、数据框数据集进行循环，输入为列表，返回值为列表
```
gene_length <- do.call(rbind,lapply(exonic.gene.sizes, data.frame))
write.csv(gene_length, "gene_length.csv", row.names = TRUE)
```

### 对read_counts进行转换
```
rt <- read.table("read_counts.txt", row.names = 1, header = TRUE, sep="\t")
str(rt)
```

```
eff_length <- read.csv("gene_length.csv", row.names = 1, header = T)
rownames(eff_length)<-eff_length$gene 
rownames(eff_length) <- do.call(rbind,strsplit(as.character(eff_length$gene),'\\.'))[,1]
eff_length[1:3,]
```
```
gen <- intersect(rownames(rt), rownames(eff_length))
rt <- rt[gen,]
eff_length <- eff_length[gen, ]
```
```
countToFpkm <- function(counts, effLen){
  N <- sum(counts)
  exp( log(counts) + log(1e9) - log(effLen) - log(N) )
}  
##count转换为FPKM值
fpkms <- as.data.frame(apply(rt,2,countToFpkm,effLen = eff_length$eff_length))
write.table(fpkms, "~/R/Hass-ref-genome/data_fpkms.txt", sep="\t", quote=F, row.names=T)
```
