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
padding: 10px;
border-radius: 5px;
display: inline-block;
font-weight:bold;



font-size:10px;
}

.example_a:hover {

box-shadow: 5px 40px -10px rgba(0,0,0,0.57);

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

#patient{
	width: 150px;
	height: 50px;
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
	
%>
<center>
<div>
     <sql:setDataSource
        var="doctors"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/smartclinic"
        user="root" password=""
    />
     
    <sql:query var="listUsers"   dataSource="${doctors}">
        SELECT * FROM records where pid=?;
        <sql:param value="<%= sb.getID()%>" /> 
    </sql:query>
    <form action="gen.jsp">
      <select  id="patient" name="date">
      <option>Select Date</option>
         <c:forEach var="user" items="${listUsers.rows}">
         
         <option value="${user.date}"><c:out value="${user.date}" /></option>
         
         </c:forEach>
      </select>
      <input type="submit" class="example_a" value="See Prescription">
      </form>
      </div>
      </center>
      </div>
      
 
</body>
</html>