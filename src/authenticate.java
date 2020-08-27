

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beans.*;

/**
 * Servlet implementation class authenticate
 */
@WebServlet("/authenticate")
public class authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public authenticate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String password  =request.getParameter("password");
		String occp=request.getParameter("occp");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		signupBean sb=new signupBean();
		
		if(email.isEmpty()  || password.isEmpty())
		{
			out.print("<script>alert(\"Fields can not be blank.\");</script>");
			
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
		
		else {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/smartclinic", "root", "");
				PreparedStatement pst=null;
				ResultSet rs=null;
				
				if(occp.equalsIgnoreCase("patient"))
				{
					pst=cn.prepareStatement("select * from patient where email=? and password=?");
					pst.setString(1, email);
					pst.setString(2, password);
					 rs=pst.executeQuery();
					 
					 if(rs.next())
					 {
						 	sb.setName(rs.getString(1));
							sb.setEmail(rs.getString(2));
							sb.setPhone(rs.getString(3));
							sb.setAddress(rs.getString(4));
							sb.setDob(rs.getString(5));
							sb.setPassword(rs.getString(6));
							sb.setBlood(rs.getString(7));
							sb.setGender(rs.getString(8));
							sb.setID(rs.getInt(9));
							sb.setOccupation(occp);
							session.setAttribute("bean", sb);
							RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
							rd.forward(request, response);

					 }
					 else {
						 out.print("<script>alert(\"Invalid email or password.\");</script>");
							
							RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
							rd.include(request, response);
					 }

				}
				else if(occp.equalsIgnoreCase("doctor"))
				{
					pst=cn.prepareStatement("select * from doctor where email=? and password=?");
					pst.setString(1, email);
					pst.setString(2, password);
					rs=pst.executeQuery();
					 if(rs.next())
					 {
						 	sb.setName(rs.getString(1));
							sb.setEmail(rs.getString(2));
							sb.setPhone(rs.getString(3));
							sb.setAddress(rs.getString(4));
							sb.setDob(rs.getString(5));
							sb.setPassword(rs.getString(6));
							sb.setBlood(rs.getString(7));
							sb.setGender(rs.getString(8));
							sb.setID(rs.getInt(9));
							sb.setOccupation(occp);
							session.setAttribute("bean", sb);
							RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
							rd.forward(request, response);

					 }
					 else {
						 out.print("<script>alert(\"Invalid email or password.\");</script>");
							
							RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
							rd.include(request, response);
					 }
				}
				else if(occp.equalsIgnoreCase("receptionist"))
				{
					pst=cn.prepareStatement("select * from receptionist where email=? and password=?");
					pst.setString(1, email);
					pst.setString(2, password);
					rs=pst.executeQuery();
					 if(rs.next())
					 {
						 sb.setName(rs.getString(1));
							sb.setEmail(rs.getString(2));
							sb.setPhone(rs.getString(3));
							sb.setAddress(rs.getString(4));
							sb.setDob(rs.getString(5));
							sb.setPassword(rs.getString(6));
							sb.setBlood(rs.getString(7));
							sb.setGender(rs.getString(8));
							sb.setID(rs.getInt(9));
							sb.setOccupation(occp);
							session.setAttribute("bean", sb);
							RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
							rd.forward(request, response);
 
					 }
					 else {
						 out.print("<script>alert(\"Invalid email or password.\");</script>");
							
							RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
							rd.include(request, response);
					 }
				}
				else
				{
					if(email.equals("admin@gmail.com") && password.equals("admin"))
					{
						RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
						rd.forward(request, response);
					}
					 else {
						 out.print("<script>alert(\"Invalid email or password.\");</script>");
							
							RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
							rd.include(request, response);
					 }
				}
									
					
				
				
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("1234");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
	}

}
