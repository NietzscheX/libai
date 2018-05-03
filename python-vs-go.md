> 没想到go语言性能这么强大！，作为通用编程语言确实快，竟然lua都赶不上。
不过可以看看jit如何。

- [x] lua
- [x] python
- [x] go
- [] ruby
- [] c
- [] shell
- [] java

libai@libai-desktop:/data/htdocs/learngo$ cat -n test.py 
``` python
     1	i = 0
     2	while i <= 4228250625:
     3	  i+=1
     4	print (i)
```

libai@libai-desktop:/data/htdocs/learngo$ cat -n test.go
``` go
     1	package main
     2	import(
     3	  "fmt"
     4	)
     5	
     6	func main(){
     7	  i := 0
     8	  for(i<=4228250625) {
     9	   // fmt.Println(i);
    10	    i++
    11	  }
    12	
    13	    fmt.Println(i);
    14	}
``` 
libai@libai-desktop:/data/htdocs/learngo$ cat -n test.lua 
```lua

     1	local i = 0 
     2	while i <= 4228250625 do
     3	  i= i+1
     4	end
     5	print(i)
```

```bash
libai@libai-desktop:/data/htdocs/learngo$ time lua test.lua
4228250626

real	1m0.056s
user	1m0.041s
sys	0m0.000s

libai@libai-desktop:/data/htdocs/learngo$ time  python  test.py
4228250626

real	4m53.543s
user	4m52.993s
sys	0m0.157s
libai@libai-desktop:/data/htdocs/learngo$ time  go run test.go
4228250626

real	0m1.591s
user	0m1.533s
sys	0m0.055s
```
