<%@ page  import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String id=null;
String logname="";
String phone=null;
String address=null;
%>
<html>
  <head>
    <title>修改信息</title>
  </head>
 <style type="text/css">
BODY {
background:url(image/3.jpg);
background-repeat:no-repeat;
} 
</style> 
  <body>
<%
String getid = request.getParameter("id");
out.println(getid);
if(getid!= null) {
         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/friends";
         String user="root";
         String pass="";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();
	String sql="select * from user where id =" + getid;
         ResultSet rs=stmt.executeQuery( sql );
	if(rs.next()) {
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
          
<div align="center">
<FORM action="Saveinfor.jsp" method="post" name=form>
<table>
	<tr>
	<td>ID:</td><td><Input type=text name="getid"  value=<%=getid%> onfocus=this.blur()></td></tr>
	<tr>
	<td>*会员名称：</td><td><Input type=text name="logname"  value=<%=logname %>></td></tr>
	<tr>
	<td>联系电话：</td><td><Input type=text name="phone" value=<%=phone %>></td></tr>
	<tr>
	<td>邮件地址：</td><td><Input type=text name="address" value=<%=address %>></td>
	<td><INPUT  type=submit value=" 确 定 ">
		<INPUT  type=reset value=" 清 除 "></td></tr>
	<div style="margin-top:82px;">
	<font size=2 color=red>注：用户名由字母、数字、下划线构成，*注释的项必须填写</font></div><br>
</table>
</FORM>
</div>


  </body>
</html>
