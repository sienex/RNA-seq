# fastqc


	
#批量处理目录下所有gz，并生成zip文件  
```fastqc sample*gz```

#多线程后台处理 (在/home/sienex/Desktop/Persea/01raw_data下运行)  
```
ls *gz | xargs -I [] echo 'nohup fastqc [] -o /home/sienex/Desktop/Persea/01raw_data/fastqc &' > fastqc.sh
```  
#运行```bash fastqc.sh```


# 质量过滤fastp
对于双端测序数据  
--in1:输入read1  
--out1:输出read1  
--in2:输入read2  
--out2:输出read2  
-A,--disable_adpter_trimming:不过滤接头序列，默认过滤  
-f,--trim_front1:去掉read1头部的几bp序列，默认为0  
-t,--trim_tail1:去掉read1尾部的几bp序列，默认为0  
-F,--trim_front2:去掉read2头部的几bp序列，默认为0  
-T,--trim_front2:去掉read2尾部的几bp序列，默认为0  
-q--qualified_quality_phred:质量值低于q的碱基将被过滤，默认为15  
-l, --length_required:长度低于l的序列将被过滤，默认为15  
-n, --n_base_limit:序列中含N碱基多余n个将被过滤，默认为5  
-j, --json:生成可读的json文件  
-h,--html:生成html质控报告  



```
fastp --in1 /home/sienex/Desktop/Persea/01raw_data/FETXG-1_S3_L008_R1_001.fastq.gz \
--in2 /home/sienex/Desktop/Persea/01raw_data/FETXG-1_S3_L008_R2_001.fastq.gz \
--out1 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R1_001filter.fastq.gz \
--out2 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R2_001filter.fastq.gz \
--html ./02clean_data/FETXG-1_S3_L008fastp.html \
--json ./02clean_data/FETXG-1_S3_L008fastp.json \
--thread 12
```

```
fastp --in1 /home/sienex/Desktop/Persea/01raw_data/FETXG-2_S2_L008_R1_001.fastq.gz \
--in2 /home/sienex/Desktop/Persea/01raw_data/FETXG-2_S2_L008_R2_001.fastq.gz \
--out1 /home/sienex/Desktop/Persea/02clean_data/FETXG-2_S2_L008_R1_001filter.fastq.gz \
--out2 /home/sienex/Desktop/Persea/02clean_data/FETXG-2_S2_L008_R2_001filter.fastq.gz \
--html ./02clean_data/FETXG-2_S2_L008fastp.html \
--json ./02clean_data/FETXG-2_S2_L008fastp.json \
--thread 12
```

```
fastp --in1 /home/sienex/Desktop/Persea/01raw_data/HSXG-1_S7_L008_R1_001.fastq.gz \
--in2 /home/sienex/Desktop/Persea/01raw_data/HSXG-1_S7_L008_R2_001.fastq.gz \
--out1 /home/sienex/Desktop/Persea/02clean_data/HSXG-1_S7_L008_R1_001filter.fastq.gz \
--out2 /home/sienex/Desktop/Persea/02clean_data/HSXG-1_S7_L008_R2_001filter.fastq.gz \
--html ./02clean_data/HSXG-1_S7_L008fastp.html \
--json ./02clean_data/HSXG-1_S7_L008fastp.json \
--thread 12
```

```
fastp --in1 /home/sienex/Desktop/Persea/01raw_data/HSXG-2_S6_L008_R1_001.fastq.gz \
--in2 /home/sienex/Desktop/Persea/01raw_data/HSXG-2_S6_L008_R2_001.fastq.gz \
--out1 /home/sienex/Desktop/Persea/02clean_data/HSXG-2_S6_L008_R1_001filter.fastq.gz \
--out2 /home/sienex/Desktop/Persea/02clean_data/HSXG-2_S6_L008_R2_001filter.fastq.gz \
--html ./02clean_data/HSXG-2_S6_L008fastp.html \
--json ./02clean_data/HSXG-2_S6_L008fastp.json \
--thread 12
```
