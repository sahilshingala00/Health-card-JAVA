

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
import beans.signupBean;
import javax.servlet.http.*;

/**
 * Servlet implementation class storeData
 */
@WebServlet("/storeData")
public class storeData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
		signupBean sb=new signupBean();
		String username=request.getParameter("username");  
		String email=request.getParameter("email");  
		String phone =request.getParameter("phone");
		String address =request.getParameter("address"); 
		String dob  =request.getParameter("dob");
		String password  =request.getParameter("password");
		String blood  =request.getParameter("blood");
		String gender =request.getParameter("gender");
		String occp=request.getParameter("occp");
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		if(username.isEmpty() || email.isEmpty() || phone.isEmpty() || address.isEmpty() || dob.isEmpty() || password.isEmpty())
		{
			out.print("<script>alert(\"Fields can not be blank.\");</script>");
			
			RequestDispatcher rd=request.getRequestDispatcher("signUp.jsp");
			rd.include(request, response);
		}
		
		if(password.length()<8 || password.length()>16)
		{
			out.print("<script>alert(\"password length must be between 8-16.\");</script>");
			
			RequestDispatcher rd=request.getRequestDispatcher("signUp.jsp");
			rd.include(request, response);
		}
	
		else {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/smartclinic", "root", "");
			java.sql.Statement st=cn.createStatement();
			ResultSet rs;
			PreparedStatement pst;
			
				sb.setName(username);
				sb.setEmail(email);
				sb.setPhone(phone);
				sb.setAddress(address);
				sb.setDob(dob);
				sb.setPassword(password);
				sb.setBlood(blood);
				sb.setGender(gender);
				sb.setOccupation(occp);
				if(occp.equalsIgnoreCase("patient"))
				{
					
				String query="insert into patient (name,email,phone,address,dob,password,bloodgroup,gender)"
						+ " values('"+username+"','"+email+"','"+phone+"','"+address+"','"+dob+"','"+password+"','"+blood+"','"+gender+"')";
				
				st.execute(query);
				pst=cn.prepareStatement("select * from patient where email=?");
				pst.setString(1, email);
				rs=pst.executeQuery();
				 if(rs.next())
				 {
					 sb.setID(rs.getInt(9));
				 }
				
				 
				session.setAttribute("bean", sb);
				}
				else if(occp.equalsIgnoreCase("doctor"))
				{
					String query="insert into doctor (name,email,phone,address,dob,password,bloodgroup,gender)"
							+ " values('"+username+"','"+email+"','"+phone+"','"+address+"','"+dob+"','"+password+"','"+blood+"','"+gender+"')";
					
					st.execute(query);

					pst=cn.prepareStatement("select * from doctor where email=?");
					pst.setString(1, email);
					rs=pst.executeQuery();
					 if(rs.next())
					 {
						 sb.setID(rs.getInt(9));
					 }
					
					session.setAttribute("bean", sb);
				}
				else {
					
				}
				
				
				RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
				rd.forward(request, response);
			
			
			
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
