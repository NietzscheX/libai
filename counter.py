#! /usr/bin/python
##当时要在命令行接收参数做一个统计，随手写的脚本
import sys 
from collections import defaultdict

data = sys.stdin.read()
data = data.strip(" ")
data = data.split('\n')

dd = defaultdict(lambda:0)

for eachline in data:
	if eachline !="":
		dd[eachline]+=1
for k,v in dd.items():
	print("%s ===> %s") % (k,v)
