
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
