#! /usr/bin/perl -w

my %hash;
my @line1;
my $key;
my $line1;

open (T1,"$ARGV[0]");#基因列表文件；
#open (T1,'<','G:\GWAS\文章讨论\油菜不对称进化和系谱育种选择-V11 (0818)\油菜不对称进化和系谱育种选择-V11 (0818)\Divergence 分析\gene.txt');
while ($line1 = <T1>){
	chomp $line1;
	$hash{$line1}=1;
	
	}
	close T1;
	
foreach my $key (keys %hash){
open(B,"$ARGV[1]") ; ##  要保证你的fasta文件的文件名就是fasta
#open (B,'<','G:\GWAS\文章讨论\油菜不对称进化和系谱育种选择-V11 (0818)\油菜不对称进化和系谱育种选择-V11 (0818)\Divergence 分析\Brassica_napus.annotation_v5_finalfilter.pep.fa');
my $sign=0; ## 这个是控制是否打印的变量
while (my $line = <B>) {  ## 一行行的读取
#         chomp $line;  ## 去掉末尾的换行符
#       if($line =~ /^>/ && $sign==1){print "\n";} # 判断是否是fasta序列名
        if($line =~ /^>/){	      
                if ($line =~ /$key/){  ## 如果是你需要的序列名
                        $sign=1;  ## 就把控制变量设为1，意思是可以输出啦
                }else{
                        $sign=0;  ## 如果不是你需要的序列名，就不输出
                }
        }
        print "$line" if $sign==1; ## 根据控制变量的情况来决定是否打印输出
}
close B;
		}
