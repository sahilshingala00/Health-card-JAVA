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
	
	th{
	background-color:teal;
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
<center><h1>My Profile</h1>
<hr>
<br><br>
<% signupBean sb=(signupBean)session.getAttribute("bean");
	//out.println("Welcome <span class=\"inner\">"+sb.getID()+"</span>");
	Class.forName("com.mysql.jdbc.Driver");
				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/smartclinic", "root", "");
				PreparedStatement pst=cn.prepareStatement("select * from patient where P_ID=?");
				pst.setInt(1, sb.getID());
				ResultSet rs=pst.executeQuery();
				
				
%>
</center>
<div>
<div class="card" style="width:200px;float: left;">
    <img class="card-img-top" src="images/img_avatar1.png" alt="Card image" style="width:100%"><br><br>
    <div class="card-body" style="border: 1px solid gray;border-top: 5px solid teal; padding: 8px;">
      <h2 class="card-title"><%= sb.getName() %></h2>
      <p class="card-text"><b>Patient ID:</b> <%= sb.getID() %></p>
      <p class="card-text"><b>Address:</b><%= sb.getAddress() %></p>
      <p class="card-text"><b>Email:</b> <%= sb.getEmail() %></p>
      <p class="card-text"><b>Phone:</b> <%= sb.getPhone() %></p>
      <p class="card-text"><b>DOB:</b> <%= sb.getDob() %></p>
      <p class="card-text"><b>Blood group:</b> <%= sb.getBlood() %></p>
     <p class="card-text"><b>Gender:</b> <%= sb.getGender() %></p>
    </div>
</div>

<div style="float:right;margin-right:8%;width:800px;">
<h1>My History</h1>
<table class="table table-striped table-bordered">
<tr>
<th>date</th>
<th>doctor name</th>
<th>symptoms</th>
<th>medicine</th>
</tr>
<%  
pst=cn.prepareStatement("SELECT * FROM records where pid=?;");
pst.setInt(1, sb.getID());
rs=pst.executeQuery();
while(rs.next())
{

%>
<tr>

<td><%= rs.getString(5) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(7) %></td>
<td><%= rs.getString(8) %></td>
</tr>
<%

}	

%>
</table>
</div>
</div>  

</div>
</body>
</html>