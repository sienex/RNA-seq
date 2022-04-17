#########################################
###        GO Pathway Plot           ### 
##           2021.11.24              ##
######################################


```
dat = read.table("GO.txt",header = T,sep = "\t")
library(ggplot2)#没有自己安装 install.package("ggplot2")
p <- ggplot(dat,aes(y=GeneRatio,x=Term,fill=P_value)) + 
  geom_bar(stat="identity",position = "dodge") +
  facet_grid(Class~.,scales = "free",space = "free") + 
  coord_flip() + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        strip.text.y = element_text(size = 14),
        legend.position="right",
        legend.title = element_text(size=18),
        legend.text = element_text(size=14),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=18),
        axis.title.x = element_text(size=14),
        axis.title.y = element_text(size=14))
p
ggsave(p,filename = "GO.pdf",limitsize = FALSE,width =30,height = 18,dpi=100)
ggsave(p,filename = "GO.jpg",limitsize = FALSE,width = 30,height = 18,dpi=500)

```
