#! /usr/bin/lua
--生成随机数
math.randomseed(os.time())
local max = arg[1] or 1
for i=1,max do
	print(math.random(1,100))
 end 
