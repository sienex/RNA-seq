## DESeq2

```
readscounts <- read.table("read_counts.txt", header=T)

write.csv(readscounts, file="read_counts.csv")

mycounts <- read.csv("read_counts.csv",row.names = 1)
rownames(mycounts)<-mycounts[,1]
mycounts<-mycounts[,-1]

head(mycounts)
dim(mycounts)

mycounts_1 <- mycounts[rowSums(mycounts)!=0,]
dim(mycounts_1)

myindex <- read.csv("index_read_counts.csv",stringsAsFactors = T)
myindex

#检查是否与样本匹配
colnames(mycounts_1)==myindex$id

BiocManager::install("DESeq2")

library("DESeq2")
dds <- DESeqDataSetFromMatrix(countData = mycounts_1,
                              colData = myindex,
                              design = ~index)

dds <-DESeq(dds)
res <-results(dds)

head(res)
class(res)

res_1 <- data.frame(res)
class(res_1)

#加载这个包，增加一列数据
library(dplyr)

res_1 %>%
  mutate(group = case_when(
    log2FoldChange >= 2 & padj <= 0.05 ~ "UP",
    log2FoldChange <= -2 & padj <= 0.05 ~ "DOWN",
    TRUE ~ "NOT_CHANGE"
  )) -> res_2

table(res_2$group)

write.csv(res_2,file="DESeq2_result.csv",quote = F)
```
