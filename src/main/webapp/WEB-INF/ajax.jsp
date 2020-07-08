<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>您好Springboot</title>
<!--1.引入js  -->
<script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

/*   2.发起ajax请求  
	1. $.get()  负责查询  		    返回数据任意  人工解析
	2. $.post() 表单数据提交等           返回值类型任意 人工解析 
	3. $.getJSON() 查询获取json数据
	4. $.getScript()  获取js代码片段
	5. $.ajax({.....})  万能用法  */
	
	/*发起ajax请求  */
	$(function(){
		//页面取值时,采用对象.属性的方式动态获取.
		$.get("/findAjax",function(result){

			 addTable("tab1",result);
		})
		
		//1.悟  2.写
		//常规ajax写法
		$.ajax({
			   type: "post",				//method
			   url: "/findAjax",		//网址
			   //data: "name=John&location=Boston",  //传递数据
			   dataType: "json",
			   success: function(result){
					//准备一个函数,实现表格数据的添加.	
				    addTable("tab2",result);
				    //提示成功信息
			   },
			   error :function(data){
					alert("提示信息: 当前网络正忙,请稍后再试");
			   },
			   async : true,    //默认条件下都是异步.    false表示请求同步.
			   cache : false	//缓存页面信息                         false表示不缓存
			   
			});

		//定义ajax 展现数据函数
		function addTable(eleId,data){
			//遍历数据
			var trs = "";
			$(data).each(function(index,user){
				var id = user.id;
				var name = user.name;
				var age = user.age;
				var sex = user.sex;
				trs += "<tr align='center'><td>"+id+"</td><td>"+name+"</td><td>"
					  +age+"</td><td>"+sex+"</td></tr>"
			});
			//var id = '#'+eleId
			$("#"+eleId).append(trs);
		}




		
	})
</script>

</head>
<body>
	<table id="tab1" border="1px" width="65%" align="center">
		<tr>
			<td colspan="6" align="center"><h3>学生信息</h3></td>
		</tr>
		<tr>
			<th>编号</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>性别</th>
		</tr>
	</table>
	
	<hr>
	<table id="tab2" border="1px" width="65%" align="center">
		<tr>
			<td colspan="6" align="center"><h3>学生信息</h3></td>
		</tr>
		<tr>
			<th>编号</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>性别</th>
		</tr>
	</table>
	
	
	
	
	
</body>
</html>