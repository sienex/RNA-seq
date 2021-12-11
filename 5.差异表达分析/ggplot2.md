### ggplot2

```
install.packages("ggplot2")

library(ggplot2)

df <- read.csv("DESeq2_result.csv",header = T,stringsAsFactors = F)
head(df)

table(df$group)

ggplot(df,aes(x=log2FoldChange,y=-log10(pvalue)))+geom_point(aes(color=group))+
  scale_color_manual(values = c("dodgerblue" , "gray" , "firebrick"))
```
