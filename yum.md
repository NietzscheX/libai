+ 以前都是每次装机然后copy一份epel的地址
+ 今天意外发现可以用 yum install epel-release   

+ 不过 remi的还是要在这里下载http://rpms.famillecollet.com/

``` shell 
//如下在2016-06-21执行的时候是默认安装php5.4..实际上最新的php7.x都有
通过
yum search  php --enablerepo=remi  可以验证



[root@oracle ~]# yum  install php --enablerepo=remi
Loaded plugins: fastestmirror
Setting up Install Process
Loading mirror speeds from cached hostfile
 * epel: mirror01.idc.hinet.net
 * webtatic: sp.repo.webtatic.com
Resolving Dependencies
--> Running transaction check
---> Package php.x86_64 0:5.4.45-9.el6.remi will be installed
--> Processing Dependency: php-common(x86-64) = 5.4.45-9.el6.remi for package: php-5.4.45-9.el6.remi.x86_64
--> Processing Dependency: php-cli(x86-64) = 5.4.45-9.el6.remi for package: php-5.4.45-9.el6.remi.x86_64
--> Running transaction check
---> Package php-cli.x86_64 0:5.4.45-9.el6.remi will be installed
---> Package php-common.x86_64 0:5.4.45-9.el6.remi will be installed
--> Finished Dependency Resolution

Dependencies Resolved

============================================================================================================================================================================
 Package                                   Arch                                  Version                                          Repository                           Size
============================================================================================================================================================================
Installing:
 php                                       x86_64                                5.4.45-9.el6.remi                                remi                                2.8 M
Installing for dependencies:
 php-cli                                   x86_64                                5.4.45-9.el6.remi                                remi                                4.1 M
 php-common                                x86_64                                5.4.45-9.el6.remi                                remi                                964 k

Transaction Summary
============================================================================================================================================================================
Install       3 Package(s)

Total download size: 7.9 M
Installed size: 29 M
Is this ok [y/N]: 





而普通官方base的选择还是安装5.3
[root@oracle ~]# yum install php
Loaded plugins: fastestmirror
Setting up Install Process
Loading mirror speeds from cached hostfile
 * epel: mirrors.neusoft.edu.cn
 * webtatic: sp.repo.webtatic.com
Resolving Dependencies
--> Running transaction check
---> Package php.x86_64 0:5.3.3-47.el6 will be installed
--> Processing Dependency: php-common(x86-64) = 5.3.3-47.el6 for package: php-5.3.3-47.el6.x86_64
--> Processing Dependency: php-cli(x86-64) = 5.3.3-47.el6 for package: php-5.3.3-47.el6.x86_64
--> Running transaction check
---> Package php-cli.x86_64 0:5.3.3-47.el6 will be installed
---> Package php-common.x86_64 0:5.3.3-47.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

============================================================================================================================================================================
 Package                                    Arch                                   Version                                       Repository                            Size
============================================================================================================================================================================
Installing:
 php                                        x86_64                                 5.3.3-47.el6                                  base                                 1.1 M
Installing for dependencies:
 php-cli                                    x86_64                                 5.3.3-47.el6                                  base                                 2.2 M
 php-common                                 x86_64                                 5.3.3-47.el6                                  base                                 530 k

Transaction Summary
============================================================================================================================================================================
Install       3 Package(s)

Total download size: 3.8 M
Installed size: 13 M
Is this ok [y/N]: 

```
