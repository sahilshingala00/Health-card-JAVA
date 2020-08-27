<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="beans.*" %>  
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
	
.flot{
position: absolute;
 top: 250px;
 left: 20%;
 color: white;
 font-size: 50px;
 
}

.inner{

color:teal;
}
.image{
position:relative;
width:100%;
height: 600px;
margin-top: -0%;
} 


.example_a {
color: #fff !important;
text-transform: uppercase;
text-decoration: none;
background: none;
border: 4px solid teal;
padding: 20px;
border-radius: 5px;
display: inline-block;

transition: all 0.4s ease 0s;

font-size:20px;
}

.example_a:hover {
background: teal;
letter-spacing: 1px;
box-shadow: 5px 40px -10px rgba(0,0,0,0.57);
transition: all 0.4s ease 0s;
text-decoration: none;
}
.tbl{
 border-collapse: collapse;
  width: 80%;
  
}

.tbl  td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

.left{
	height: 350px;
	width: 550px;
	float:left;
	
}

.right{
	margin-left: 570px;
	
	text-align: left;
	color: black;
	
}

.dark{
background:black;
}
  </style>
<title>Smart Clinic</title>
</head>
<body>

<nav class="navbar navbar-custom bg">
<div class="container-fluid">  
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Smart Clinic</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#">Home</a></li>
      <li><a href="#contactus">Contact US</a></li>
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
<img alt="doctor" src="images/home.jpg" class="image">
      <div class="flot">
<b>
 
<% signupBean sb=(signupBean)session.getAttribute("bean");
	out.println("Welcome <span class=\"inner\">"+sb.getName()+"</span>");
%>

<br>
Find a Doctor
 <br>
<a class="example_a" href="doctorlist.jsp" >Find Now</a> 
</b>
</div>
<div class="container">
<div style="background-color: teal;margin: 10px;padding: 10px; color: white; ">
<center><h2>Our Working Hours</h2>
<br><br>
<table class="tbl">
<tr><td>monday-wednesday</td><td>9:00am to 9:00pm</td></tr>
<tr><td>thursday-friday</td><td>9:00am to 9:00pm</td></tr>
<tr><td>saturday</td><td>9:00am to 7:00pm</td></tr>
<tr><td>sunday</td><td>closed</td></tr>
</table></center><br>
</div>
<br>
<div>
<div class="left">
<img alt="" src="images/doctors.jpg" height="350px"  width="550px;"></div>
<div class="right">
<h2 style="font-weight: bold; color: teal;">About</h2>
<ul style="font-size: 20px;">
<li>It is a long established fact that a reader will be distracted by the readable content of a page when looking.</li>
<li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>
<li>Many desktop publishing packages and web page editors now use Lorem Ipsum.</li>
<hr>
<li type="none"><i><q>The mind has great influence over the body and maladies often have their origin there.</q></i><br>-John Doe Molicere</li>
</ul>
</div>
</div>
</div>
<br><br>
<div class="container-fluid dark">
<div class="container" id="contactus">
<center><b><h1 style="color:white;">Contact Us</h1></b></center>
<div style="color:gray;float:left;margin-left: 100px;">
<b><h2>Our Address</h2></b>
Kiran Multi Super Speciality Hospital &<br> Research Center,<br>Nr Sumul Dairy,<br>
Surat - 395004<br><br>
</div>
<div style="color:gray; margin-left: 200px;float:left;">
<b><h2>Phone</h2></b>
8758194225
</div>
<div style="color:gray;margin-left: 800px; margin-top:30px;">
<b><h2>Email</h2></b>
smartclinic@gmail.com
</div>

</div>
</div>
</body>
</html>