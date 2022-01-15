1.安装miniconda:
```  
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
```  

```
vi ~/.bashrc
```
```
export PATH="/root/miniconda3/bin:$PATH"
```


conda install samtools

2.导入重要channel:
```
conda config --add channels conda-forge           //conda-forg是可以安装软件包的附加渠道。
```
```
conda config --add channels r
```
```
conda config --add channels bioconda
```
