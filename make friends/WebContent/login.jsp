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
<tr><th>��¼</th></tr>
<form action="loginServlet" Method="post">
<tr><td>��¼���ƣ�<Input type=text name="logname"></td></tr>
<tr><td>�������룺<Input type=password name="password"></td></tr>
</table>
<Input type=submit name="g" value="�ύ">
</form></div>
<div align="center">
��½������Ϣ��<jsp:getProperty name="loginBean" property="backNews"/>
<br>��¼���ƣ�<jsp:getProperty name="loginBean" property="logname"/>
<div></font>
</body>
</html>