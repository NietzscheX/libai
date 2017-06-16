from bs4 import BeautifulSoup as BS
import requests

for url in open('url.list','r'):
    url=url.strip('\n')
    html = requests.get(url)
    html.encoding="utf-8"   ##主要就是这句话，百度默认都返回乱码，可以通过print(html.encoding)看到默认返回是ISO-8859-1
    soup = BS(html.text,"lxml")
    print(soup.title)
