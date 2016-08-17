function doit()
{
awk -v filename=$1 'BEGIN{printf("%-10s\n"),filename} $9 ~ /20/ {x20x[$9]+=1}; $9 ~ /30/ {x30x[$9]+=1}; $9 ~ /40/ {x40x[$9]+=1}; $9 ~ /50/ {x50x[$9]+=1}END{for(i in x20x ){print i,x20x[i]};for(i in x30x ){print i,x30x[i]}; for(i in x40x ){print i,x40x[i]}; for(i in x50x ){print i,x50x[i]}}' $1
}

if [ $# -lt 1 ]; then
  echo "at least 1 params"
  exit 2
fi


until [ $# -eq 0 ]
do
  doit $1
  shift
done
