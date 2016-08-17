##异常请求 无法捕获
#14.106.225.182 - - [17/Aug/2016:10:32:50 +0800] "\x16\x03\x00\xF3\x01\x00\xFF\xEE\x03\x01o\xE8\xC1 h\xD5\x81\xA1\x925D!\x93WcU\x03Kv\xD0\x95\x00)H\xB2\x5C\x86<k\xEF\x0B\x0E\x00\x00\x94\xC0\x14\xC0" 400 573 "-" "-"



function doit()
{
	awk -v filename=$1 'BEGIN{printf("%-10s\n"),filename} {code[$9]+=1}END{ for(i in code){print i,code[i]}}' $1
}

function run()
{
 echo "+++" $1
 awk '{split($0,a,"HTTP/1.0\"|HTTP/1.1\"|HTTP/2.0\""); print a[2]}' $1  | awk '{b[$1]+=1}END{for(i in b)print i,b[i]}'
 echo "+++"
}



if [ $# -lt 1 ]; then
	exit 2
fi


until [ $# -eq 0 ]
do
#	doit $1
	run $1
	shift
done
