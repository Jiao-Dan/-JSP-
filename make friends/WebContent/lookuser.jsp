<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page language="java" import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<%!
	String sql="";
	ResultSet rs=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<%
if(loginBean==null){
	response.sendRedirect("login.jsp");
}else{
	boolean b=loginBean.getLogname()==null||loginBean.getLogname().length()==0;
	if(b)
		response.sendRedirect("login.jsp");
}
	String logname=loginBean.getLogname();		
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/friends";
	String user="root";
	String pass="";
	Connection conn=DriverManager.getConnection(url,user,pass);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from user");
	if(!rs.next()){
		out.println("<p>...</p>");
	}else{
%>

		<p><strong>会员列表</strong></p>
		<table width=100%>
		<tr bgcolor=cccccc align=center>
			<td>会员ID</td>
			<td>会员名称</td>
			<td>电话</td>
			<td>地址</td>
		</tr>
<%
		int cc=1;
		do{
			if(cc%2==1)
				out.println("<tr bgcolor=#E7E7E7>");
			else
				out.println("<tr bgcolor=#F4F4F4>");
%>
				<td align=center><%=rs.getString("id")%></td>
				<td align=center><%=rs.getString("logname")%></td>
				<td align=center><%=rs.getString("phone")%></td>
				<td align=center><%=rs.getString("address")%>
<%
				out.println("</td></tr>");
				cc++;
		}while(rs.next());
		
	}
	rs.close();
%>
	<p align=center><a href="myindex.jsp?logname=<%=logname%>">返回主页</a></p>
</body>
</html>