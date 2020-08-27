

import java.io.IOException;
import java.sql.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class storeAPP
 */
@WebServlet("/storeAPP")
public class storeAPP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public storeAPP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String name=request.getParameter("name");
		String PID=request.getParameter("pid");
		String phone=request.getParameter("phone");
		String doctor=request.getParameter("doctor");
		String date=request.getParameter("date");
		
		String query="INSERT INTO appointment (name, P_ID, phone, doctor, date) VALUES ('"+name+"','"+PID+"','"+phone+"','"+doctor+"','"+date+"')";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/smartclinic", "root", "");
			java.sql.Statement st=cn.createStatement();
			st.execute(query);
			response.sendRedirect("listofApp.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
