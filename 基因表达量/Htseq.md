注意事项:HTSeq是对有参考基因组的转录组测序数据进行表达量分析的，其输入文件必须有SAM和GTF文件。

### 准备工作
1.安装R和Rstudio  
2.安装R包rtracklayer和export


### gff转gtf
```
library(rtracklayer)
test <- import("hass_geneannotation.gff")
export(test," hass_geneannotation.gtf","gtf")
```
### Htseq
-f | --format default: sam 指定输入文件的格式，可以是 sam或 bam格式，默认是sam.  
-r | --order default: name 设置sam或bam文件的排序方式，该参数的值可以是name或pos。前者表示按read名进行排序，后者表示按比对的参考基因组位置进行排序。若测序数据是双末端测序，当输入sam/bam文件是按pos方式排序的时候，两端reads的比对结果在sam/bam文件中一般不是紧邻的两行，程序会将reads对的第一个比对结果放入内存，直到读取到另一端read的比对结果。因此，选择pos可能会导致程序使用较多的内存，它也适合于未排序的sam/bam文件。而pos排序则表示程序认为双末端测序的reads比对结果在紧邻的两行上，也适合于单端测序的比对结果。很多其它表达量分析软件要求输入的sam/bam文件是按pos排序的，但HTSeq推荐使用name排序，且一般比对软件的默认输出结果也是按name进行排序的。  
-s | --stranded default: yes 是否这个数据是来自链特异性建库（默认 yes)  
-a | --a default: 10 忽略比对质量低于此值的比对结果  
-t | --type default: exon 程序会对该指定的feature（gtf/gff文件第三列）进行表达量计算，而gtf/gff文件中其它的feature都会被忽略。  
-i | --idattr default: gene_id 设置feature ID是由gtf/gff文件第9列那个标签决定的；若gtf/gff文件多行具有相同的feature ID，则它们来自同一个feature，程序会计算这些features的表达量之和赋给相应的feature ID。  
-m | --mode default: union 设置表达量计算模式。有union, intersection-strict and intersection-nonempty三种  
-o | --samout 输出一个sam文件，该sam文件的比对结果中多了一个XF标签，表示该read比对到了某个feature上。  
-q | --quiet suppress progress report and warnings  
-h | --help 输出帮助信息。  
```
htseq-count -f bam \
-r name \
-s no -a 10 \
-t gene \
-i ID \
-m union /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/FETXG-1_S3_L008sorted.bam \
/home/sienex/Desktop/Persea/00ref/hass_geneannotation.gtf > /home/sienex/Desktop/Persea/04read_counts/FETXG-1_S3_L008_counts.txt
```
```
htseq-count -f bam \
-r name \
-s no -a 10 \
-t gene \
-i ID \
-m union /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/FETXG-2_S2_L008sorted.bam \
/home/sienex/Desktop/Persea/00ref/hass_geneannotation.gtf > /home/sienex/Desktop/Persea/04read_counts/FETXG-2_S2_L008_counts.txt
```
```
htseq-count -f bam \
-r name \
-s no -a 10 \
-t gene \
-i ID \
-m union /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/HSXG-1_S7_L008sorted.bam \
/home/sienex/Desktop/Persea/00ref/hass_geneannotation.gtf > /home/sienex/Desktop/Persea/04read_counts/HSXG-1_S7_L008_counts.txt
```
```
htseq-count -f bam \
-r name \
-s no -a 10 \
-t gene \
-i ID \
-m union /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/HSXG-2_S6_L008sorted.bam \
/home/sienex/Desktop/Persea/00ref/hass_geneannotation.gtf > /home/sienex/Desktop/Persea/04read_counts/HSXG-2_S6_L008_counts.txt
```


### 合并多个read_counts
HTSeq-count输出结果是一个个独立的文件，后续分析需要把多个文件合并成一个行为基因名，列为样本名，中间为count的行列式文件。

在/home/sienex/Desktop/Persea/04read_counts下```vim read_counts.py```  
```
python read_counts.py
```
```
import sys
import os
mydict = {}
print(‘gene’+’\t’)

filename=os.listdir(".")
name=[]
for i in filename:
    portion = os.path.splitext(i)   #把文件名拆分为名字和后缀
    if portion[1] == ".txt":
        name.append(portion[0])
print(name[0]+’\t’+name[1] +’\t’+name[2] +’\t’+name[3])

for file in sys.argv[1:]:
        for line in open(file,'r'):
                key, value = line.strip().split('\t')
                if(key in mydict.keys()):
                        mydict[key] = mydict[key] + '\t' + value
                else:
                        mydict[key] = value
for key, value in mydict.items():
        print(key + '\t' + value )
```
