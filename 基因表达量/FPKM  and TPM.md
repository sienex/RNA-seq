## FPKM

### 读取gtf文件，并通过exonBy()函数提取基因的外显子信息  
```
txdb <- makeTxDbFromGFF("gencode.v22.annotation.gtf",format="gtf")
exons.list.per.gene <- exonsBy(txdb, by = "gene")
```

### 同时，我们进一步可以通过reduce()函数来避免重复计算重叠区
```
exonic.gene.sizes <- lapply(exons.list.per.gene,
                           function(x){sum(width(reduce(x)))})
```
### 
```
gene_length2 <- do.call(rbind,lapply(exonic.gene.sizes, data.frame))
write.csv(gene_length2, "gene_length_2.csv", row.names = TRUE)
```
