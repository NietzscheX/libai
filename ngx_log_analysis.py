#! /usr/bin/env python
#! -*- coding:utf8 -*-

'''
#读取nginx日志
#统计出每个域名的 PV UV IP 
原计划是直接用python数据结构，但是没处理好，直接存数据库还方便点。
'''


import MySQLdb


if __name__ == '__main__':
	conn = MySQLdb.connect(
				host='172.17.0.1',
				port=3306,
				user='root',
				password='qq',
				db='qq',)

	#cur = conn.cursor(MySQLdb.cursors.DictCursor)
	cur = conn.cursor()

	with open('2017-06-17_21-24.log','r') as f:
		for line in f:
			lines = line.split()
			domain = lines[0]
			ip     = lines[5]
			uri    = lines[9]
			sql = "insert into ngx_log values(0,'%s','%s','%s');" % (domain,ip,uri)
		#	print(sql)
			try:
				cur.execute(sql)
			except:
				#conn.rollback()
				print("error")


	conn.commit()
	cur.close()
	conn.close()
  
  #在数据库中查询
  "select domain,count(1) as pv ,count(distinct ip) as uv  from ngx_log group by domain ;"
  
"""
 CREATE TABLE `ngx_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) DEFAULT '',
  `ip` varchar(50) DEFAULT '0.0.0.0',
  `uri` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=899429 DEFAULT CHARSET=utf8
"""
  
  
