<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String getid="";
String password="";
String newpass="";
String newpass1="";
String newpass2="";
String sql = "";
ResultSet rs =null;
String logname="";
%>

<html>
  <body>
<%  
   String getid = request.getParameter("getid");
   String getpass=request.getParameter("oldpass");
   String newpass1=request.getParameter("newpass1");
   String newpass2=request.getParameter("newpass2");
	out.println(getid);
	out.println(getpass);
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
		password  = rs.getString("password");
		rs.close();
		}
	}
if(getpass.equals(password)&newpass1.equals(newpass2)){
	 Connection con=null;
     PreparedStatement ps=null;
     Statement stmt=null;
  
     Class.forName("com.mysql.jdbc.Driver");
     String url="jdbc:mysql://localhost:3306/friends";
     String user="root";
     String pass="";
     con=DriverManager.getConnection(url,user,pass);
     stmt=con.createStatement();
     

     String sql =  "update user set password='" + newpass1 + "' where id=" + getid;
     ps=con.prepareStatement(sql);
     ps.executeUpdate();
%>
<jsp:forward page="myindex.jsp">
<jsp:param value='<%=logname%>' name="logname"/>
</jsp:forward>
<%	
}
else {
		    out.println("<hr>");
            out.println("<h2>请输入正确的信息！</h2>");
		    out.println("<hr>");
} 
%>

  </body>
  
</html>

