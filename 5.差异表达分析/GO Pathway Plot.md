
###        GO Pathway Plot           ### 




```
library (stringr)
library(ggplot2)#没有自己安装 install.package("ggplot2")
dat = read.table("GO.txt",header = T,sep = "\t")
dat$newTerm = str_wrap(dat$Term, width = 90)

p <- ggplot(dat,aes(y=GeneRatio,x=newTerm,fill=P_value)) + 
  geom_bar(stat="identity",position = "dodge") +
  facet_grid(Class~.,scales = "free",space = "free") + 
  coord_flip() + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 1),
        strip.text.y = element_text(size = 30),
        legend.position="right",
        legend.title = element_text(size=25),
        legend.text = element_text(size=25),
        legend.key.size = unit(2, 'cm'),
        axis.text.x = element_text(size=24),
        axis.text.y = element_text(size=28),
        axis.title.x = element_text(size=24),
        axis.title.y = element_text(size=24))
p
ggsave(p,filename = "GO.pdf",limitsize = FALSE,width =30,height = 18,dpi=100)
ggsave(p,filename = "GO2.jpg",limitsize = FALSE,width = 30,height = 28,dpi=500)


```
