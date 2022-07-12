<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String getid="";
String logname ="";
String phone = "";
String address ="";
boolean flag1=false;


String sql = "";
ResultSet rs = null;
%>

<html>
<body>  
<%
request.setCharacterEncoding("utf-8");
String getid= request.getParameter("getid");
out.println(getid);
if(request.getParameter("logname")!=null&&request.getParameter("logname").length()>0)     {
	flag1=true; 
	logname = request.getParameter("logname");	
	phone = request.getParameter("phone");
	address = request.getParameter("address");
}
if(flag1){
            Connection con=null;
            PreparedStatement ps=null;
            Statement stmt=null;
         
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/friends";
            String user="root";
            String pass="";
            con=DriverManager.getConnection(url,user,pass);
            stmt=con.createStatement();
            

            String sql =  "update user set logname='" + logname + "',phone='" + phone + "',address='" + address + "' where id=" + getid;
            
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
%>
<jsp:forward page="myindex.jsp">
<jsp:param value='<%=request.getParameter("logname")%>' name="logname"/>
</jsp:forward>
<%}else {
    out.println("<hr>");
    out.println("<h2>请输入正确的信息！</h2>");
    out.println("<hr>");
} 
%>
</body>
</html>
