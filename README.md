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

# 刚发现计划任务没有执行...
> 检查发现/var/log/cron里面也没有日志...
> 于是先把/etc/init.d/rsyslog restart  日志记录启动起来
> 然后把/etc/init.d/cron restart 启动起来
> 再通过一个小脚本测试一下是否正常 
``` bash
    cd /opt/libai/;time=`date -d now`; echo $time >> 123.txt
```

-  今天做了一共系统封装
-  > 准备工作:原版操作系统cn_windows_7_ultimate_x64_dvd_x15-66043.iso
-  > 万能驱动 WanDrv6_Win7.x64_6.6.2016.0719_Dev.zip
-  > 运行库 GoRuntime_1.9 (包含.NET dx VC)
-  系统装好了之后在输入用户名界面,按ctrl + shift +F3,系统重启
-  首先进入winPE用到EasyImageX_v1.62用于将操作系统备份成WIM的镜像.
-  然后进入系统,用EasySysprep_4.3.29.602制作第一阶段的封装
-  重启进入WinPE,再次启动EasySysprep_4.3.29.602制作第二阶段的封装.
-  最后在WinPE里面把通过EasyImageX_v1.62把二阶段制作的封装打包成 .wim 或者.gho
-  
-  只是我第一次制作,win的包有6G+,因为工作环境是ubuntu16.04 + virtalbox,
-  Oracle VM VirtualBox Command Line Management Interface Version 5.0.20
-  有BUG无法把宿主的U盘挂载到虚拟机里...
-  所以存在一个问题:在linux上的win7x64.pro.wim无法直接以文件/以U盘/以ISO挂载到想安装的目标系统...
-  虽然我尝试了 dd if=win7x64.pro.wim of=win7x64.pro.wim.iso 但是并不能识别这种格式
-  后来尝试使用python -m SimpleHTTPServer 8000  然后在客户机通过浏览器下载...发现python直接崩溃
-  再使用nginx来以autoindex提供下载,这次nginx没崩,但是客户机崩了.
-  最终发现一个法宝----->windows和linux之间拷贝数据可以用pscp.exe
-  通过 scp root@192.168.1.122:/data/imgs/win7x64.pro.wim.iso d:\   就ok啦~~~
-  

>  ubuntu 下的记事本gedit本来使用比较方便,但是没有配置文件,只有通过全局开头的设置环境
> 比如 gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
> 具体的可用参数 gsettings list-recursively  | grep -i gedit
> 哈哈在http://askubuntu.com/questions/375049/where-are-gedits-preferences 学到一招,先打开gedit然后按ALT+E,
> 再按E选择Pr[e]ferences 就可用配置gedit了!

```
  在linux下创建一个特定大小的文件用dd没错,正常是这样的
  创建1个G: dd if=/dev/zero of=a.out bs=1M count=1024
  创建10个G: dd if=/dev/zero of=a.out bs=1M count=10240
  
  
  上面的创建很慢创建10G差不要几分钟,要提高速度秒级别有个技巧,用seek参数.
  创建1个G: dd if=/dev/zero of=a.out bs=1M count=0 seek=1024
  创建10个G:  dd if=/dev/zero of=a.out bs=1M count=0 seek=10240

  还有批量创建文件夹的办法,比如说
   mkdir -p {a..z}/{a..z}{1..26}
   mkdir {libai,dufu,github,google}
   
   因为网络原因经常pip下载不了模块,只有手动下载openpyxl-2.4.0-b1.tar.gz 然后执行pip install openpyxl-2.4.0-b1.tar.gz 就可以啦
   ```
   
   lua 和c 和python在对待循环上一个显著的区别是
   
   ``` c
  /* libai@libai-desktop:/opt/script$ cat -n test.c && gcc test.c  && ./a.out */
     1	#include <stdio.h>
     2	
     3	int main()
     4	{
     5	 int i =0;
     6	 for (i=0;i<10;i++)
     7	  {
     8	    i+=10;
     9	    printf("result %d\n",i);
    10	  }
    11	}
result 10
```


``` lua
-- libai@libai-desktop:/opt/script$ cat -n test.lua  && luajit test.lua 
     1	for i=1,10,1
     2	do
     3	   i=i+10
     4	   print("result ",i)
     5	end


result 	11
result 	12
result 	13
result 	14
result 	15
result 	16
result 	17
result 	18
result 	19
result 	20
```


``` python
# libai@libai-desktop:/opt/script$ cat -n test.py  && python test.py
     1	for i in range(10):
     2	    i+=10
     3	    print("result %d"% i)
     4	
   
result 10
result 11
result 12
result 13
result 14
result 15
result 16
result 17
result 18
result 19
```  



