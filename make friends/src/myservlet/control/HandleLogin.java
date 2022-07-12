package myservlet.control;
import mybean.data.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;

public class HandleLogin extends HttpServlet {
    public void init(ServletConfig config)throws ServletException{
    	super.init(config);
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(Exception e) {}
    }
    public String handleString(String s) {
    	try{
    		byte bb[]=s.getBytes("iso-8859-1");
    		s=new String(bb);
    	}catch(Exception ee) {}
    	return s;
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Connection con;
    	Statement sql;
    	String logname=request.getParameter("logname").trim();
    	String password=request.getParameter("password").trim();
    	logname=handleString(logname);
    	password=handleString(password);
    	String uri="jdbc:mysql://127.0.0.1/friends?"+"user=root&password=&characterEncoding=gb2312";
    	boolean boo=(logname.length()>0)&&(password.length()>0);
    	try {
    		con=DriverManager.getConnection(uri);
    		String condition="select * from user where logname = '"+logname+"'and password='"+password+"'";
    		sql=con.createStatement();
    		if(boo) {
    			ResultSet rs=sql.executeQuery(condition);
    			boolean m=rs.next();
    			if(m==true) {
    				success(request,response,logname,password);
    				RequestDispatcher dispatcher=request.getRequestDispatcher("myindex.jsp?logname="+logname);
    				dispatcher.forward(request, response);
    			}else {
    				String backNews="您输入的用户名不存在，或密码不匹配";
    				fail(request,response,logname,backNews);
    			}
    		}else {
    			String backNews="请输入用户名和密码";
    			fail(request,response,logname,backNews);
    		}
    		con.close();
    	}catch(SQLException exp) {
    		String backNews=""+exp;
    		fail(request,response,logname,backNews);
    	}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
public void success (HttpServletRequest request, HttpServletResponse response,String logname,String password) {
	Login loginBean=null;
	HttpSession session=request.getSession(true);
	try {
		loginBean=(Login)session.getAttribute("loginBean");
		if(loginBean==null) {
			loginBean=new Login();
			session.setAttribute("loginBean", loginBean);
			loginBean=(Login)session.getAttribute("loginBean");
		}
		String name=loginBean.getLogname();
		if(name.equals(logname)) {
			loginBean.setBackNews(logname+"已经登陆了");
			loginBean.setLogname(logname);
		}else {
			loginBean.setBackNews(logname+"登陆成功");
			loginBean.setLogname(logname);
		}
	}catch(Exception ee) {
		loginBean=new Login();
		session.setAttribute("loginBean", loginBean);
		loginBean.setBackNews(logname+"登陆成功");
		loginBean.setLogname(logname);
	}
}
public void fail(HttpServletRequest request, HttpServletResponse response,String logname,String backNews) {
	response.setContentType("text/html;charset=GB2312");
	try {
		PrintWriter out=response.getWriter();
		out.println("<html><body>");
		out.println("<h2>"+logname+"登陆反馈结果<br>"+backNews+"</h2>");
		out.println("返回登陆页面<br>");
		out.println("<a href=login.jsp>登录页面</a>");
		out.println("</body></html>");
	}catch(IOException exp) {}
}
}
