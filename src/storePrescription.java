

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class storePrescription
 */
@WebServlet("/storePrescription")
public class storePrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public storePrescription() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String did=request.getParameter("did");
		int pid=Integer.parseInt(request.getParameter("pid"));
		String pname = null;
		String phone=request.getParameter("phone");
		String doctor=request.getParameter("doctor");
		String date=request.getParameter("date");
		String symptoms=request.getParameter("symptoms");
		String medicine=request.getParameter("medicine");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/smartclinic", "root", "");
			java.sql.Statement st=cn.createStatement();
			PreparedStatement pst=null;
			ResultSet rs=null;
			pst=cn.prepareStatement("select * from patient where P_ID=?");
			pst.setInt(1, pid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				pname=rs.getString("name");
			}
			String query="INSERT INTO records (did,pid,doctor,patient,date,phone,symptoms,medicine) VALUES ('"+did+"','"+pid+"','"+doctor+"','"+pname+"','"+date+"','"+phone+"','"+symptoms+"','"+medicine+"')";
			st.execute(query);
			
			
			response.sendRedirect("listofAppDoctor.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
