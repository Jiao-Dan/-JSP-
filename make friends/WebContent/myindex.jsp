<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page  import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
td {
margin-top:250px;
text-align:right; /*设置水平居中*/
vertical-align:middle;/*设置垂直居中*/
}
BODY {
background:url(image/小学生.jpg);
background-repeat:no-repeat;
} 
</style>
</head>
<body>
<%
String id=null;
String logname=null;
String phone=null;
String address=null;
String logname1 = request.getParameter("logname");
if(logname1!= null) {
         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/friends";
         String user="root";
         String pass="";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();
	String sql="";
	     sql="select * from user where logname= '"+logname1+"'"; 
         ResultSet rs=stmt.executeQuery( sql );
	if(rs.next()) {
		id=rs.getString("id");
		logname  = rs.getString("logname");
		phone = rs.getString("phone");
		address  = rs.getString("address");
		rs.close();
%>          
<%
   } else {
		  out.println("<hr>");	
		  out.println("<center>没有用户！</center>");
		  out.println("<hr>");	
   }
}
%>         
<div align="center"><p><strong>我的主页</strong></p></div>        
<div align="center">
<FORM action="Modifyinfor.jsp" method="post" name=form>
<table>
	<tr>
	<td>ID:</td><td><%=id %></td></tr>
	<tr>
	<td>会员名称：</td><td><Input type=text name="logname"  value=<%=logname%>></td></tr>
	<tr>
	<td>联系电话：</td><td><Input type=text name="phone" value=<%=phone%>></td></tr>
	<tr>
	<td>邮件地址：</td><td><Input type=text name="address" value=<%=address %>></td>
	</tr>
	<div style="margin-top:82px;">
</table>
</FORM>
<div style="background-image: url(image/welcome.jpg) no-repeat;;">
<table cellSpacing="1" cellPadding="1" width="400" align="center" border="0">
<tr align="bottom">
<td height="50px"><A href="Modifyinfor.jsp?id=<%=id%>" target="contentFrm">修改注册信息</A></td>
<td height="50px"><A href="Modifypass.jsp?id=<%=id%>" target="contentFrm">修改密码</A></td></tr>
</table>
</div>
</div>
</body>
</html>