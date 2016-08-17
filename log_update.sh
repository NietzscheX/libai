##换一种思路解决统计状态的问题

#特殊情况1 $9 为HTTP/1.0 尚未解决
#118.244.190.37 - - [16/Aug/2016:21:06:55 +0800] GET /goods-9371.html1001?? ?????????????????_????_???? HTTP/1.0 404 704 - Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; GT-I9082C Build/JDQ39) AppleWebKit/533.1 (KHTML, like Gecko) Mobile Safari/533.1

#特殊情况2 $7 包含[] --已解决
#117.136.40.22 210.52.215.31  -  [15/Aug/2016:09:26:18 +0800] GET /cdn-cgi/pe/bag2?r[]=http%3A%2F%2Fm.xx.xx%2Fcdn-cgi%2Fnexp%2Fdok3v%3D1613a3a185%2Fcloudflare%2Fmirage2.js HTTP/1.0 404 704 http://xx.xx.xx/goods-5520.html Mozilla/5.0 (Linux; Android 5.1; ik1501Plus Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/39.0.0.0 Mobile Safari/537.36; 360 Aphone Browser (6.9.9.14)


function doit()
{
#直接统计$9的数组
	awk -v filename=$1 'BEGIN{FS=" " ;printf("%-10s\n"),filename} {code[$9]+=1}END{ for(i in code){ printf("%s %s\n", i,code[i])}}' $1
}


function convert_log()
{
#首先以[日期时间这个标签之前的分割,然后基于分割把将第一部分的ip记录下来
#重组$0 = a[1] [ a[2] ,有个例外在于某些百度cdn的极少url中包含了[]，故这里额外添加了a[3]
 awk '$1 != "-"{split($0,a,"["); split(a[1],b,",| ");ip=b[1];printf("%s %s %s %s%s%s\n",ip,"-","-","[",a[2],a[3])}' $1
}

##终极解决办法就一句话...
function run()
{
 echo "+++" $1
 awk '{split($0,a,"HTTP/1.0|HTTP/1.1"); print a[2]}' $1  | awk '{b[$1]+=1}END{for(i in b)print i,b[i]}'
 echo "+++"
}

if [ $# -lt 1 ]; then
	exit 2
fi


until [ $# -eq 0 ]
do
#	convert_log $1 > ${1}.temp
#	doit ${1}.temp
	#rm -rf  ${1}.temp
	run $1
	shift
done
