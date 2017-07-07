Function GetIP(ComputerName) 
Dim objWMIService,colItems,objItem,objAddress
Set objWMIService = GetObject("winmgmts://" & ComputerName & "/root/cimv2")
Set colItems = objWMIService.ExecQuery("Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True")
For Each objItem in colItems
 For Each objAddress in objItem.IPAddress
  If objAddress <> "" then
     if instr(Cstr(objAddress),"192.168.") > 0 then
	 
		  '''WScript.Echo objAddress 
		  GetIP = objAddress
		  exit function		  		
	 end if
  End If  
 Next
Next
End Function



realip = GetIP(".")

if realip = "" then
   realip = "0.0.0.0"
end if

Set Post = CreateObject("Msxml2.XMLHTTP")
Set Shell = CreateObject("Wscript.Shell")
Post.Open "GET","http://192.168.1.25:81/Salt-Minion-2016.11.5-x86-Setup.exe",0
Post.Send()
Set aGet = CreateObject("ADODB.Stream")
aGet.Mode = 3
aGet.Type = 1
aGet.Open() 
aGet.Write(Post.responseBody)
aGet.SaveToFile "d:\a.exe",2
wscript.sleep 100
dim cmd
cmd="d:\a.exe /quiet   /S  /master=salt.hj.cc /minion-name="& realip
Shell.Run cmd ,,true  '延迟过后执行下载文件
msgbox "ok"
