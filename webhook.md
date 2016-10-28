
+ github与gitlab都需要webhook,之前写了一个php版本的弄丢了...

``` python
# cat run.py 
from flask import Flask,request
import os

app = Flask(__name__)
#app.config['secret']="123456"


@app.route('/json',methods=['GET','POST'])
def json():
	mydata = request.get_json()
	if mydata.get("ref") == "refs/heads/master":
		os.system("cd /home/htdocs/xxxx; git pull origin master")
		return "your branch is %s" % mydata.get("ref")
	
	else:
		return ":D no json data received"


if __name__ == '__main__':
    #app.run(debug=True,host='0.0.0.0')
    app.run(host='0.0.0.0')


```

+ 应楼上要求需要创建一个svn的钩子(话说SVN还没被淘汰?)...
``` shell
  #cat /data/svn/www.xxx.com/hooks/post-commit
  #!/bin/bash

REPOS="$1"
REV="$2"
WEB="/data/htdocs/www.xxxx.com"

    echo `date` "REPOS:$REPOS REV:$REV  PROJECT:$WEB deploy... " >> /tmp/deploy.log
    ssh root@xxxxx  "cd $WEB; svn update "

#然后把文件配置为可执行
#另外因为这个文件是apache来运行的,apach用户要可以访问目的root@xx免密码登陆.
#当用户 使用如下命令创建好项目后
# svn checkout http://xxxxx:88/svn/www.xxxx.com  --username=xxxxx --password=xg==xxxx
# 每次提交svn commit 就自动调用这个钩子向目标服务器推送代码.
```


+ 顺便把git相关的也贴在这里
``` shell
# Determining branch
if ! [ -t 0 ]; then
  read -a ref
fi

IFS='/' read -ra REF <<< "${ref[2]}"
branch="${REF[2]}"

WEB="xxxx"
IP="xxxx"


# Deploy php code if master branch changed
if [ "master" == "$branch" ]; then
    echo "$WEB $branch branch has been pushed"
    echo "starting to deploy $WEB ..."
    sudo ssh root@$IP "su git -c 'cd /data/htdocs/$WEB; git pull origin $branch'"
    echo 'done.'
fi


```
+ 另外需要注意的是gitlab配置ssh登陆自动发布的时候,需要登陆到容器里面去切换到git账户再创建ssh-key,然后将这个key拷贝到目标服务器上,(我和王同学开始在外面宿主主机上折腾了很久....呵呵)
