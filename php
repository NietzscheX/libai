最近(2016-06下旬)在弄一个jieqi小说站点，代码1是被加密，2是只能适配php5.2版本，5.3+会报错。
安装php5.2真的是很坑，在centos6+上php都是5.3.3+

尝试多次，无奈在网易镜像上down了一个centos5.10，然后 安装了一个epel-release 
再加了了以第三方源
[root@localhost yum.repos.d]# cat utter-ramblings.repo 
[utter-ramblings]
name=Utter Ramblings
baseurl=http://yum.jasonlitka.com/EL5/x86_64/
gpgkey=http://yum.jasonlitka.com/RPM-GPG-KEY-jlitka
enabled=1
gpgcheck=1

确实可以安装php5.2.17 但是郁闷的是php-fpm找不到....找来找去也没发现直接安装php-fpm的办法
最终下载了源码 准备编译，但是各种地址都失效了，只有到官方去下载

官方php历史版本的地址了：
http://museum.php.net/php5/

想必6和7分别应该是
http://museum.php.net/php6/
http://museum.php.net/php7/
但是实际上并没有这个地址。。。。

