<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="beans.*,java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .navbar-custom { 
    background-color: white;
    font-weight:bolder;
	}
	.tbl{
 border-collapse: collapse;
  width: 80%;
  margin-left: 10%;
  
}
.tbl tr:first-child{background-color: teal;color: white; font-weight: bold;}
.tbl  td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}
	

  </style>
<title>Smart Clinic</title>
</head>
<body>

<nav class="navbar navbar-inverse ">
<div class="container-fluid">  
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Smart Clinic</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="doctor.jsp">Home</a></li>
      <li><a href="doctor.jsp#contactus">Contact US</a></li>
      <li><a href="dprofile.jsp">My Profile</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Appointments <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listofAppDoctor.jsp"> Appointments</a></li>
          <li><a href="generateP.jsp">Give Prescription</a></li>
        </ul>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">

      <li><a href="home.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      
    </ul>
  </div>
</nav>


<div class="container">
<center><h1>My Appointments</h1></center>
<br><br>
<% signupBean sb=(signupBean)session.getAttribute("bean");
	//out.println("Welcome <span class=\"inner\">"+sb.getID()+"</span>");
	Class.forName("com.mysql.jdbc.Driver");
				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/smartclinic", "root", "");
				PreparedStatement pst=cn.prepareStatement("select * from appointment where doctor=?");
				pst.setString(1, sb.getName());
				ResultSet rs=pst.executeQuery();
				if(rs==null)
				{
%>

<h1>you don't have any Appointments.</h1>


<%				}
				else{
%>
<table class="tbl">
<tr>
<td>PATIENT ID</td>
<td>NAME</td>
<td>PHONE</td>
<td>DOCTOR</td>
<td>DATE</td>
</tr>
<%				while(rs.next())
{

%>
<tr>

<td><%= rs.getInt(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(5) %></td>
</tr>
<%

}	

}
	
%>
</table>

</body>
</html>