package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleRegister extends HttpServlet {
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
		try { Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {}
	}
    public String handleString(String s) {
        try {
        	byte bb[]=s.getBytes("iso-8859-1");
        	s=new String(bb);
        }catch(Exception ee) {}
        return s;
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri="jdbc:mysql://127.0.0.1/friends?"+"user=root&password=&characterEncoding=gb2312";
		Connection con;
		PreparedStatement sql;
		Register userBean=new Register();
		request.setAttribute("userBean", userBean);
		String logname=request.getParameter("logname").trim();
		String password=request.getParameter("password").trim();
		String again_password=request.getParameter("again_password").trim();
		String phone=request.getParameter("phone").trim();
		String address=request.getParameter("address").trim();
		if(logname==null) {
			logname="";
		}
		if(password==null) {
			password="";
		}
		if(!password.equals(again_password)) {
			userBean.setBackNews("???????벻ͬ??ע??ʧ?ܡ?");
			RequestDispatcher dispatcher=request.getRequestDispatcher("inputRegisterMess.jsp");
			dispatcher.forward(request, response);
			return;
		}
		boolean isLD=true;
		for(int i=0;i<logname.length();i++) {
			char c=logname.charAt(i);
			if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
				isLD=false;
		}
		boolean boo=logname.length()>0&&password.length()>0&&isLD;
		String backNews="";
		try {
			con=DriverManager.getConnection(uri);
			String insertCondition="INSERT INTO user(logname,password,phone,address) VALUES(?,?,?,?)";
			sql=con.prepareStatement(insertCondition);
			if(boo) {
				sql.setString(1,handleString(logname));
				sql.setString(2,handleString(password));
				sql.setString(3,handleString(phone));
				sql.setString(4,handleString(address));
				int m=sql.executeUpdate();
				if(m!=0) {
					backNews="ע???ɹ?";
					userBean.setBackNews(backNews);
					userBean.setLogname(logname);
					userBean.setPhone(handleString(phone));
					userBean.setAddress(handleString(address));
				}
			}else {
				backNews="??Ϣ??д???????????????зǷ??ַ?";
				userBean.setBackNews(backNews);
			}
			con.close();
		}catch(SQLException exp){
			backNews="?û?Ա???ѱ?ʹ?ã?????????????"+exp;
			userBean.setBackNews(backNews);
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("inputRegisterMess.jsp");
		dispatcher.forward(request, response);
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}