<%@ page  import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String id=null;
String password="";
%>
<html>
  <head>
    <title>修改密码</title>
  </head>
 <style type="text/css">
BODY {
background:url(image/2.jpg);
background-repeat:no-repeat;
} 
</style> 
  <body>
<%
String getid = request.getParameter("id");
out.println(getid);
%>           
          
<div align="center">
<FORM action="Savepass.jsp" method="post" name=form>
<table>
	<tr>
	<td>ID:</td><td><Input type=text name="getid"  value=<%=getid %>></td></tr>
	<tr>
	<td>请输入旧密码:</td><td><Input type=password name="oldpass"  ></td></tr>
	<tr>
	<td>请输入新密码：</td><td><Input type=text name="newpass1" ></td></tr>
	<tr>
	<td>请重复新密码：</td><td><Input type=text name="newpass2"></td>
	<td><INPUT  type=submit value=" 确 定 ">
		<INPUT  type=reset value=" 清 除 "></td></tr>
	<div style="margin-top:82px;">
	<font size=2 color=red>注：请勿使用过于简单的密码！</font></div><br>
</table>
</FORM>
</div>


  </body>
</html>
