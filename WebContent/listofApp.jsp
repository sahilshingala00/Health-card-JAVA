<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="beans.*,java.sql.*" %>  
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
    
    font-weight:bolder;
	}
	.example_a {
color: #fff !important;
text-transform: uppercase;
text-decoration: none;
background: teal;
border: 4px solid teal;
padding: 20px;
border-radius: 5px;
display: inline-block;
font-weight:bold;

transition: all 0.4s ease 0s;

font-size:15px;
}

.example_a:hover {

letter-spacing: 1px;
color:  black;
box-shadow: 5px 40px -10px rgba(0,0,0,0.57);
transition: all 0.4s ease 0s;
text-decoration: none;
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

<nav class="navbar navbar-custom navbar-inverse">
<div class="container-fluid">  
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Smart Clinic</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="patient.jsp">Home</a></li>
      <li><a href="patient.jsp#contactus">Contact US</a></li>
      <li><a href="book.jsp">Book an Appointment</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Profile <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listofApp.jsp">My Appointments</a></li>
          <li><a href="pre.jsp">My bills</a></li>
          <li><a href="myprofile.jsp">My History</a></li>
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
				PreparedStatement pst=cn.prepareStatement("select * from appointment where P_ID=?");
				pst.setInt(1, sb.getID());
				ResultSet rs=pst.executeQuery();
				if(rs==null)
				{
%>

<h1>you don't have any Appointments.</h1>
<a class="example_a" href="book.jsp" >Book Appointment</a>

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
<br><br>
<center><a class="example_a" href="book.jsp" >Book Appointment</a></center>


</div>
</body>
</html>