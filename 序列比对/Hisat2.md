# Hisat2

### 构建索引
```
hisat2-build hass_genome.fa hass_genome
```

### 
```
hisat2 -p 12 -x hass_genome -1 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R1_001filter.fastq.gz -2 /home/sienex/Desktop/Persea/02clean_data/FETXG-1_S3_L008_R2_001filter.fastq.gz > FETXG-1_S3_L008.Log | samtools sort -o FETXG-1_S3_L008.bam

```
