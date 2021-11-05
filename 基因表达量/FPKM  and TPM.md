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

rbind： 根据行进行纵向合并，就是行的叠加，m行的矩阵与n行的矩阵rbind()最后变成m+n行，合并前提：rbind(a, b)中矩阵a、b的列数必需相符
lapply函数：对列表、数据框数据集进行循环，输入为列表，返回值为列表
```
gene_length2 <- do.call(rbind,lapply(exonic.gene.sizes, data.frame))
write.csv(gene_length2, "gene_length_2.csv", row.names = TRUE)
```
