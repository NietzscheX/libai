 awk 'BEGIN{printf("%10s %10s %10s %10s\n","20x","30x","40x","50x")} $9 ~ /20/ {x20x=x20x+1 }; $9 ~/30/ {x30x=x30x+1}; $9 ~ /40/ {x40x=x40x+1}; $9 ~/50/ {x50x=x50x + 1 }  END{printf("%10s %10s %10s %10s",x20x,x30x,x40x,x50x)}'
 
 
 
 
 update
 
 awk 'BEGIN{printf("%-10s\n"),"nginx log "} $9 ~ /20/ {x20x[$9]+=1}; $9 ~ /30/ {x30x[$9]+=1}; $9 ~ /40/ {x40x[$9]+=1}; $9 ~ /50/ {x50x[$9]+=1}END{for(i in x20x ){print i,x20x[i]};for(i in x30x ){print i,x30x[i]}; for(i in x40x ){print i,x40x[i]}; for(i in x50x ){print i,x50x[i]}}' access.log-20160808
 
 
 其实还应该进一步简化
 
 1 function doit()
 2 {
 3     awk -v filename=$1 'BEGIN{printf("%-10s\n"),filename} {code[$9]+=1}END{ for(i in code){print i,code[i]}}' $1
 4 }   
 
 
 
