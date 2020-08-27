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
<center><h1>My Profile</h1>
<br><br>
<% signupBean sb=(signupBean)session.getAttribute("bean");
	//out.println("Welcome <span class=\"inner\">"+sb.getID()+"</span>");
	Class.forName("com.mysql.jdbc.Driver");
				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/smartclinic", "root", "");
				PreparedStatement pst=cn.prepareStatement("select * from doctor where d_id=?");
				pst.setInt(1, sb.getID());
				ResultSet rs=pst.executeQuery();
				
				
%>
<div class="card" style="width:350px">
    <img class="card-img-top" src="images/img_avatar1.png" alt="Card image" style="width:100%"><br><br>
    <div class="card-body" style="border: 1px solid gray;border-top: 5px solid teal;">
      <h1 class="card-title"><%= sb.getName() %></h1>
      <p class="card-text"><b>Doctor ID:</b> <%= sb.getID() %></p>
      <p class="card-text"><b>Address:</b><%= sb.getAddress() %></p>
      <p class="card-text"><b>Email:</b> <%= sb.getEmail() %></p>
      <p class="card-text"><b>Phone:</b> <%= sb.getPhone() %></p>
      <p class="card-text"><b>DOB:</b> <%= sb.getDob() %></p>
      <p class="card-text"><b>Blood group:</b> <%= sb.getBlood() %></p>
     <p class="card-text"><b>Gender:</b> <%= sb.getGender() %></p>
    </div>
  </div>
</center>
</div>
</body>
</html>