# libai

***

* so here is my first git hub file created with branch

 > 一直以来，看书就单纯的看书，思考、做笔记、测试的较少(因为懒惰)，这样导致所学印象不深（纸上得来终觉浅就是这个道理了）
故而想记录一下，一方面是内化所学，另一方面也算是在给自己在网络世界上一个身份。
本想用cnblog或者其他一些网络笔记，灵感来了：发现用hithub记笔记的估计较少（写代码的多...）我想，github天生就是为我准备的。。。
可以跟踪我的思考、更改历程，没有哪个网络笔记比hithub更合适了。
话说这个字体怎么设置大一点？设置为4会不会ok？ 原来是markdown

***

> ubuntu下chrome浏览器关了但是进程还在，启动不了
批量干掉他的办法是：ps -ef | grep "chromium-browser" | awk '{print $2}' | xargs kill -9

***

> the better tool to install deb(rpm) on ubuntu is ------> gdebi (which can auto solve the independence)

***

* docker 启动报各种文件描述符不足的时候,默认是这样的: 

```
[root@balance ~]# docker  exec -it percona /bin/bash 
[root@8f57536d1a3c /]# ulimit -aH
core file size          (blocks, -c) unlimited
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 30484
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
**open files                      (-n) 4096**
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) unlimited
cpu time               (seconds, -t) unlimited
max user processes              (-u) 30484
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited
[root@8f57536d1a3c /]# 
```

* 可以在docker 守护程序里面增加一个配置,比如在/etc/init.d/docker 里面添加行 ulimit -n 65535  即可.然后重启docker,进入容器里面使用ulimit -aH查看便知.

```
[root@balance ~]# docker  exec -it percona /bin/bash
[root@8f57536d1a3c /]# ulimit -aH
core file size          (blocks, -c) unlimited
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 30484
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
**open files                      (-n) 65535**
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) unlimited
cpu time               (seconds, -t) unlimited 
max user processes              (-u) 30484 
virtual memory          (kbytes, -v) unlimited 
file locks                      (-x) unlimited 
```
