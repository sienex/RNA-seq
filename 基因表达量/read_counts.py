#把多个read_counts合成一个read_counts
import sys
import os
mydict = {}

filename=os.listdir(".")
name=[]
for i in filename:
    portion = os.path.splitext(i)   #把文件名拆分为名字和后缀
    if portion[1] == ".txt":
        name.append(portion[0])
print('gene'+'\t'+name[3]+'\t'+name[2] +'\t'+name[1] +'\t'+name[0])

for file in sys.argv[1:]:
        for line in open(file,'r'):
                key, value = line.strip().split('\t')
                if(key in mydict.keys()):
                        mydict[key] = mydict[key] + '\t' + value
                else:
                        mydict[key] = value
for key, value in mydict.items():
        print(key + '\t' + value )

