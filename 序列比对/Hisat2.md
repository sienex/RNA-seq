# Hisat2

### 构建索引
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
samtools sort -@ 12 -o /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-1_S3_L008.bam /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-1_S3_L008.sam
```


