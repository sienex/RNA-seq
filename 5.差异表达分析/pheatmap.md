```
install.packages("pheatmap")

library(pheatmap)


df2 <- read.csv("pheatmap_gene_2.csv",header = T,row.names = 1)
head(df2)
df2 <- df2[rowSums(df2)!=0,]


dim(df2)



df3<-as.matrix(df2)

#pheatmap(df3)

df3[df3==0] <- NA
df3[is.na(df3)] <- min(df3,na.rm = T)*0.01
pheatmap(log2(df3))

pheatmap(df3,scale = "row")
```
