<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<head></head>

<style type="text/css">
BODY {
background:url(image/welcome.jpg);
background-repeat:no-repeat;
} 
</style>
<title>注册页面</title>
<html><BODY><Font size=2>
<div align="center">
<FORM action="registerServlet" method="post" name=form>
<table>
	<tr>
	<td>*会员名称：</td><td><Input type=text name="logname"  placeholder="请输入会员名称"></td></tr>
	<tr>
	<td>*会员密码：</td><td><Input type=password name="password" placeholder="请输入会员密码"></td></tr>
	<tr>
	<td>*重复密码：</td><td><Input type=password name="again_password" placeholder="请重复会员密码"></td></tr>
	<tr>
	<td>联系电话：</td><td><Input type=text name="phone" placeholder="请输入联系电话"></td></tr>
	<tr>
	<td>邮件地址：</td><td><Input type=text name="address" placeholder="请输入邮件地址"></td>
	<td><Input type=submit name="g" value="提交"></td></tr>
	<div style="margin-top:82px;">
	<font size=2 color=red>注：用户名由字母、数字、下划线构成，*注释的项必须填写</font></div><br>
</table>
</FORM>
</div>
<div align="center">
<p>注册反馈：
<jsp:getProperty name="userBean" property="backNews"/>
<table border=3>
	<tr><td>会员名称：</td>
	<td><jsp:getProperty name="userBean" property="logname"/></td>
	</tr>
	<tr><td>邮件地址：</td>
	<td><jsp:getProperty name="userBean" property="address"/></td>
	</tr>
	<tr><td>联系电话：</td>
	<td><jsp:getProperty name="userBean" property="phone"/></td>
	</tr>
</table></div>
</BODY>
</html>