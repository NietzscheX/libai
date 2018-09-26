fd = io.open("1.txt","r+")  -- for read and write

--这里io.input()返回标准输入流
--而用点号调用read时需要手动传入要操作的流fd
--line = io.input().read(fd,"*a")
--print(line)
--

--这里因为手动设置了当前操作的流为fd
--故可以直接操作当前流的对象
--[[
io.input(fd)
line = io.input():read("*a")
print(line)
--]]

--这个和上面完全一样，官方其实是把io.input():read() 简写成io:read()
--[[
io.input(fd)
line = io:read("*a")
print(line)
--]]

--这个就算基于fd的最正规的操作
--[[
line = fd:read("*a")
print(line)
--]]

line = fd:lines("*a")  --this return a iter()
print(line())
--

-------------for write---------------

---1----
--[[
io.output().write(fd,"*a")
io.output().flush(fd)
--]]

--2--
--[[
io.output(fd)
io.write("****aa")
io.output().flush(fd)
---------]]


--3--
--[[
fd:write("a","b",string.rep("x",2^10))
fd:flush()
--]]



--------------last line for debug--------------
fd:seek("set")
line = fd:read("*a")
size = fd:seek("end")
print(line,size)
