注意事项:HTSeq是对有参考基因组的转录组测序数据进行表达量分析的，其输入文件必须有SAM和GTF文件。

### 准备工作
1.安装R和Rstudio
2.安装R包rtracklayer和export


### gff转gtf
library(rtracklayer)\
test <- import("hass_geneannotation.gff")\
export(test," hass_geneannotation.gtf","gtf")\

### Htseq
