##用于统计默认nginx日志中返回值的数量
##调用方法：sh log.sh access1.log access2.log ...

function doit()
{
  awk -v filename=$1 'BEGIN{printf("%-10s\n"),filename} {code[$9]+=1}END{ for(i in code){print i,code[i]}}' $1
}


if [ $# -lt 1 ]; then
  exit 2
fi


until [ $# -eq 0 ]
do
  doit $1
  shift
done
