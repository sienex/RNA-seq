# STAR

#常用参数说明:  
--runThreadN 线程数 :设置线程数  
--runMode genomeGenerate : 设置模式为构建索引  
--genomedDir 索引文件存放路径 : 必须先创建文件夹  
--genomeFastaFiles 基因组fasta文件路径 : 支持多文件路径  
--sjdbGTFfile gtf文件路径 : 可选项，高度推荐,用于提高比对精确性  
--sjdbOverhang 读段长度: 后续回帖读段的长度, 如果读长是PE 100， 则该值设为100-1=99  
--runMode alignReads : 默认就是比对模式，可以不填写  
--genomeDir: 索引文件夹  
--readFilesIn FASTA/Q文件路径  
--readFilesCommand zcat: 如果输入格式是gz结尾，那么需要加上zcat, 否则会报错  
--outSAMtype: 输出SAM文件的格式，是否排序  
--outBAMsortingThreadN: SAM排序成BAM时调用线程数

### 创建文件夹
```mkdir Persea_genome```

### 建立索引
```
STAR --runThreadN 12 --runMode genomeGenerate \
--genomeDir Persea_genome \
--genomeFastaFiles /home/sienex/Desktop/Persea/00ref/Hass-ref-genome/hass_genome.fa /home/sienex/Desktop/Persea/00ref/Hass-ref-genome/haa.cds.fa /home/sienex/Desktop/Persea/00ref/Hass-ref-genome/haa.pep.fa \
--sjdbGTFfile /home/sienex/Desktop/Persea/00ref/Hass-ref-genomehass_geneannotation.gtf \
--sjdbOverhang 149 
--limitGenomeGenerateRAM 16106127360
```
### 运行
STAR \
--genomeDir ref \
--runThreadN 20 \    
--readFilesIn sample_r1.fq.gz sample_r2.fq.gz \
--readFilesCommand zcat \
--outFileNamePrefix sample \
--outSAMtype BAM SortedByCoordinate \
--outBAMsortingThreadN 10
