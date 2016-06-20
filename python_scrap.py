用BeautifulSoup解析html页面的时候遇到一个问题

UnicodeEncodeError: 'gbk' codec can't encode character '\xa0' in position 50: illegal multibyte sequence

大致意思是说，原html编码为utf8（并非gbk，于是有些字符无法再gbk中正常显示），google半天也没找到直接的答案

倒是看到一种说法是gb18030或者gb2312可以最大兼容unicode

见链接http://stackoverflow.com/questions/3218014/unicodeencodeerror-gbk-codec-cant-encode-character-illegal-multibyte-sequen



# -*- coding:utf-8 -*-
from bs4 import BeautifulSoup
from urllib.request import urlopen
from urllib.error import HTTPError

def check_url(url):
    html = urlopen(url)    
    content = html.read().decode("utf-8")
    obj = BeautifulSoup(content,'html.parser')
    # result = obj.findAll("link",{"rel":"icon"})
    result = obj.findAll("a")
    return result

开始一直以为是中文的问题
指导更换url为english网站发现依然如此

# -*- coding:utf-8 -*-
from bs4 import BeautifulSoup
from urllib.request import urlopen
from urllib.error import HTTPError

def check_url(url):
    html = urlopen(url)
    obj = BeautifulSoup(html,'html.parser')
    result = obj.findAll("a")
    return result




if __name__ == '__main__':
    result=check_url("https://docs.python.org/3.0/whatsnew/3.0.html")
    for r in result:
        print(r)
        



if __name__ == '__main__':
    result=check_url("http://cq.122.gov.cn")
    for r in result:
        print(r)

开启调试模式之后发现了问题（在__exception__这里爆出来的）：
BeautifulSoup = {type} <class 'bs4.BeautifulSoup'>
HTTPError = {type} <class 'urllib.error.HTTPError'>
__builtins__ = {module} <module 'builtins' (built-in)>
__doc__ = {NoneType} None
__exception__ = {tuple} (<class 'UnicodeEncodeError'>, UnicodeEncodeError('gbk', '<a class="headerlink" href="#what-s-new-in-python-3-0" title="Permalink to this headline">¶</a>', 90, 91, 'illegal multibyte sequence'), None)
__file__ = {str} 'E:/Pure_python/scrap.py'
__loader__ = {SourceFileLoader} <_frozen_importlib_external.SourceFileLoader object at 0x00635B90>
__name__ = {str} '__main__'
__package__ = {NoneType} None
__spec__ = {NoneType} None
check_url = {function} <function check_url at 0x02E41D20>
r = {Tag} <a class="headerlink" href="#what-s-new-in-python-3-0" title="Permalink to this headline">¶</a>
result = {ResultSet} [<a accesskey="I" href="../genindex.html" title="General Index">index</a>, <a accesskey="M" href="../modindex.html" title="Global Module Index">modules</a>, <a accesskey="N" href="2.7.html" title="What’s New in Python 2.7">next</a>, <a accesskey="P" href="
urlopen = {function} <function urlopen at 0x02D98DF8>


后来不甘心还是继续搜索发现了这个答案
将一个字符串，通过gbk的方式，去解码，想要获得Unicode字符串，结果出错了

http://www.tuicool.com/articles/nEjiEv
http://www.crifan.com/note_about_website_crawl_and_emulate_login/


