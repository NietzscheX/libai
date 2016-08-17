function cleanOtherLogs()
{
	find . ! -name "$0" -delete
	echo 
}

function work()
{
if [ ! -f lock ]; then
	cp /var/log/nginx/access.log-*.gz .
	gzip -d *.gz
	touch lock
else
	echo "Don't handle anything,or you want  run   sh check_log.sh clean"
	read    -p "continue? [y]es [n]o: " next_or_quit
	if [ $next_or_quit != "y" ];then
		exit 2
	fi
	echo $next_or_quit
fi

FILES=$(ls access.log-*)
echo -n "log files are: " $FILES
echo

TODAY=$(date +%Y%m%d)
for  file in $FILES;
do
	if [ ! -f ${TODAY}.collection ]; then
		
		cat ${file} > ${TODAY}.collection
	else
		cat ${file} >> ${TODAY}.collection
	fi

done
}

function reportLogs()
{

	echo "start report logs"
	echo $LINE_START
awk 'BEGIN{printf("%-10s\n"),"nginx log "} $9 ~ /20/ {x20x[$9]+=1}; $9 ~ /30/ {x30x[$9]+=1}; $9 ~ /40/ {x40x[$9]+=1}; $9 ~ /50/ {x50x[$9]+=1}END{for(i in x20x ){print i,x20x[i]};for(i in x30x ){print i,x30x[i]}; for(i in x40x ){print i,x40x[i]}; for(i in x50x ){print i,x50x[i]}}' ${TODAY}.collection

	echo $LINE_END
	echo "end of report logs"

}

## MAIN 
TODAY=$(date +%Y%m%d)
LINE_START=$(seq -s "+" 70 | sed 's/[0-9]//g')
LINE_END=$(seq -s "-" 70 | sed 's/[0-9]//g')
WORK_DIR=/opt/libai/anasys_log

cd $WORK_DIR

if [ $# -eq 1 ] ; then
	case $1 in
	clean)
		echo "start clean logs"
		cleanOtherLogs
		echo "end of clean logs"
	;;
	report)
		echo "start report logs"
		reportLogs
		echo "end of report logs"
	;;
	*) 
		echo "unkown command"
		echo "use  sh $0 [ clean | report ]"
		exit 3
	;;
	esac
	
else
	echo "start handle logs "
	work
	reportLogs
	echo "end of handle logs "
fi
