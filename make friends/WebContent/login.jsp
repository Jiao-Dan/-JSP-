<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<html>
<style type="text/css">
BODY {
background:url(image/1.jpg);
background-repeat:no-repeat;
} 
</style>
<head></head>
<body><font size=2>
<div align="center" style="margin-top:100px;">
<table border=2>
<tr><th>登录</th></tr>
<form action="loginServlet" Method="post">
<tr><td>登录名称：<Input type=text name="logname"></td></tr>
<tr><td>输入密码：<Input type=password name="password"></td></tr>
</table>
<Input type=submit name="g" value="提交">
</form></div>
<div align="center">
登陆反馈信息：<jsp:getProperty name="loginBean" property="backNews"/>
<br>登录名称：<jsp:getProperty name="loginBean" property="logname"/>
<div></font>
</body>
</html>