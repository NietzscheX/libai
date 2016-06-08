/*
*昨天看了两章<<Javascript高级程序设计>>
*之前对这个js脚本语言完全是0基础
*/

/*
* 第一章就是历史介绍
* javascript出生于1995年，是已故Netscape Navigator的后代，因为与微软IE竞争，引发标准的制定ECMAScript
* 现代浏览器都是与ECMAScript兼容为发展方向。

* DOM概念文档、对象、模型，其实也是一个API，只是说这个API是针对XML，但是扩展之后可用于HTML的API。
* DOM是由w3c制定的标准。
* DOM有3个版本 1/2/3.逐渐完善的过程，
* DOM1只是为了映射文档的结果
* DOM2添加了：视图views、事件events、样式style（css）、遍历和操作文档的接口。
* DOM3添加了：以统一的方式加载和保存文档的方法、验证文档的方法。

* 当然不同的语言还有些其他的DOM标准。
* 因为先有DOM，再有浏览器去支持，所以实际上支持DOM才是浏览器开发商的主要目标。

* 还提到一个BOM，浏览器、对象、模型。不过这个东西还没有标准。
*/

/*
* 第二章也是比较简单
* 主要讲了如何在HTML中引入javascript
* 两种方式：1个是直接嵌入 
*/
<script type="text/javascript"> 
	function sayScript(){
		alert("hello");
		}
</script>

//另外一种就是
<script type="text/javascript" src="externaljs.js">如果这里再写js会被忽略</script>

//最后提到script的加载顺序，因为一般习惯把js放在head里面，这样有个弊端就是：浏览器在等待js加载完全之前是白板
//解决办法有2个，一个是把js移动到body里面的</body>标签之前
//另外一个就是给在head里面的<script defer="defer"> 加个这个属性，延迟加载。（这个在H5中好像不支持了）

//最后提到只有一个页面不支持javascript的话，才会执行<noscript>
<noscript>
	<p> 本页面需要开启javascript才能正常显示</p>
</noscript>




/*
第三章算是正式进入js的世界
首先介绍语法：
	标识符（可含$符号）、注释、关键字、变量、
	数据类型（一共6种）
	undefined  //只声明未赋值（默认值就是undefined）
	Null   //表示一个空对象指针（javascript这种低级脚本语言还有指针？）
	Boolean //boolean()函数等价于 !! 两次逻辑非，想必4次、6次等偶数次也是等价的。。。
	Number  //数值转换用number("string")、parseInt("string",base)、parseFloat("string")
	String //单引号于双引号完全一致，length是属性不是方法，toString()或者string()函数
	Object //是数据与功能的集合，是实例的爸爸
	
然后讲了一下操作符
++ --  
位操作符：负数在内存中以二进制补码存储，二进制补码= 1.原数的绝对值 2.将绝对值取反  3.取反后+1
位操作符：NOT  AND  OR  XOR  <<(左移[右边补0])  >>(有符号右移[左边补符号位])  >>>(无符号右移[左边补0])


布尔操作符： ! &&  ||  
关系操作符：一个数值与字符串比较会转化为数值。 <  > <=  >=   规定：任何数与NaN比较都是false   NaN>2是false  NaN<=2也是false
相等操作符：==(会自动类型转换)  !=  ===(不自动转换)  !==
条件操作符： boolean_expresion?true_value:false_value
赋值操作符：+= -= *= /= %= <<=  >>=  >>>=

关系操作符的时候，一个数值与字符串比较会转化为数值。
而加法操作符 +号 会把一个数值与一个字符串 转化为字符串。
*/


	
	
	








