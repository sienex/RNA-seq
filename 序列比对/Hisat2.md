# Hisat2

### 构建索引
-x ：索引的前缀,也可以添加路径，例如 ~/genome/homo_GRCh38.dna.primary

-1 ：双端测序的第一个文件，若有多组，则用逗号隔开，名字与2要匹配，如-1 flyA_1.fq,flyB_1.fq

-2 ：类比上，名字与1要匹配，如-2 flyA_2.fq,flyB_2.fq

-U ：单端数据文件

-S ：保存到的sam文件，默认输出到标准输出

-p ：线程数

--dta  ：在下游使用stringtie组装的时候量身定做的参数。使用此选项，
       ：HISAT2需要更长的锚长度才能从头发现拼接位点，这样可以减少与短锚的对齐，
       ： 这有助于转录汇编程序显着提高计算和内存使用率。
       ： 当然下游不使用stringtie也可以使用此参数减少短锚定read
       
--dta-cufflinks ：下游使用cufflinks则需要添加此参数

-q ：指定读取的测序文件是fastq文件（含有质量信息）

-f ：指定读取的测序文件是fa文件

-t ：打印加载索引文件和对齐读数所需的时钟时间

--phred33 ：质量表示方法，如果使用fq文件，建议选择，同理有小众的--phred64

--min-intronlen ：设置最小内含子的长度，默认值20

--max-intronlen ：设置最大内含子长度，默认500000

--known-splicesite-infile ：提供已知的剪接位点列表，HISAT2利用这些列表比对,可以用 hisat2_extract_splice_sites.py和gtf生成信息

--novel-splicesite-outfile ：在结果中生成一个剪接位点的列表

--novel-splicesite-infile ： 可以使用novel-splicesite-outfile所生成的剪接列表作为
                          ： 新剪接列表，应该可以自己定义。为特定基因。  
```
hisat2-build -p12 /home/sienex/Desktop/Persea/00ref/hass_genome.fa /home/sienex/Desktop/Persea/00ref/hass_genome
```

### 比对
```
hisat2 -p 12 -x /home/sienex/Desktop/Persea/00ref/hass_genome -1 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R1_001filter.fastq.gz -2 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R2_001filter.fastq.gz -S /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-1_S3_L008.sam 2> /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-1_S3_L008.Log
```
```
hisat2 -p 12 -x /home/sienex/Desktop/Persea/00ref/hass_genome -1 /home/sienex/Desktop/Persea/02clean_data/FETXG-2_S2_L008_R1_001filter.fastq.gz -2 /home/sienex/Desktop/Persea/02clean_data/FETXG-2_S2_L008_R2_001filter.fastq.gz -S /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-2_S2_L008.sam 2> /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-2_S2_L008.Log
```
```
hisat2 -p 12 -x /home/sienex/Desktop/Persea/00ref/hass_genome -1 /home/sienex/Desktop/Persea/02clean_data/HSXG-1_S7_L008_R1_001filter.fastq.gz -2 /home/sienex/Desktop/Persea/02clean_data/HSXG-1_S7_L008_R2_001filter.fastq.gz -S /home/sienex/Desktop/Persea/03align_out/hisat2/HSXG-1_S7_L008.sam 2> /home/sienex/Desktop/Persea/03align_out/hisat2/HSXG-1_S7_L008.Log
```
```
hisat2 -p 12 -x /home/sienex/Desktop/Persea/00ref/hass_genome -1 /home/sienex/Desktop/Persea/02clean_data/HSXG-2_S6_L008_R1_001filter.fastq.gz -2 /home/sienex/Desktop/Persea/02clean_data/HSXG-2_S6_L008_R2_001filter.fastq.gz -S /home/sienex/Desktop/Persea/03align_out/hisat2/HSXG-2_S6_L008.sam 2> /home/sienex/Desktop/Persea/03align_out/hisat2/HSXG-2_S6_L008.Log
```

### samtools
```
samtools sort -@ 12 -o /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/FETXG-1_S3_L008sorted.bam /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-1_S3_L008.sam
```
```
samtools sort -@ 12 -o /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/FETXG-2_S2_L008sorted.bam /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-2_S2_L008.sam
```
```
samtools sort -@ 12 -o /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/HSXG-1_S7_L008sorted.bam /home/sienex/Desktop/Persea/03align_out/hisat2/HSXG-1_S7_L008.sam
```
```
samtools sort -@ 12 -o /home/sienex/Desktop/Persea/03align_out/hisat2/sorted/HSXG-2_S6_L008sorted.bam /home/sienex/Desktop/Persea/03align_out/hisat2/HSXG-2_S6_L008.sam
```
