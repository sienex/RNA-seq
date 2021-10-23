# Hisat2

### 构建索引
```
hisat2-build -p12 /home/sienex/Desktop/Persea/00ref/Hass-ref-genome/hass_genome.fa /home/sienex/Desktop/Persea/00ref/Hass-ref-genome/hass_genome
```

### 比对
```
hisat2 -p 12 -x hass_genome -1 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R1_001filter.fastq.gz -2 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R2_001filter.fastq.gz 2> /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-1_S3_L008.Log | samtools sort -@ 12 > /home/sienex/Desktop/Persea/03align_out/hisat2/FETXG-1_S3_L008.bam &
```
