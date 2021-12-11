### ggplot2

```
install.packages("ggplot2")
install.packages("ggrepel")

library(ggrepel)
library(ggplot2)

df <- read.csv("DESeq2_result.csv",header = T,stringsAsFactors = F)
head(df)

table(df$group)

df$pvalue_log10<-(-log10(df$pvalue))
df1<-df[df$pvalue_log10>=50,]
dim(df1)

ggplot(df,aes(x=log2FoldChange,y=-log10(pvalue)))+geom_point(aes(color=group))+
  scale_color_manual(values = c("dodgerblue" , "gray" , "firebrick"))+
  geom_label_repel(data=df1,aes(x=log2FoldChange,y=-log10(pvalue),label=X),
                   box.padding = unit(1.5, "lines"),
                   point.padding = unit(0.25, "lines"),
                   segment.color = "black", show.legend = FALSE,segment.size=0.5,
                   arrow = arrow(length=unit(0.01, "npc")),force = 1,
                   max.iter = 3e3,
                   max.overlaps=150,
                  
  )+
  theme_bw()+labs(x="log2(FoldChange)")

```
