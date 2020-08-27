<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Insert title here</title>
<style type="text/css">
.navbar-custom { 
    
    font-weight:bolder;
	}
</style>
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
      <li><a href="#">Contact US</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">

      <li><a href="home.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      
    </ul>
  </div>
</nav>
<div class="container">
<center><h1>OUR DOCTORS' TEAM </h1>
<br><br>
<sql:setDataSource
        var="doctors"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/smartclinic"
        user="root" password=""
    />
     
    <sql:query var="listUsers"   dataSource="${doctors}">
        SELECT * FROM doctor;
    </sql:query>
     <c:forEach var="user" items="${listUsers.rows}">
    
      
 
  <div class="card" style="width:350px">
    <img class="card-img-top" src="images/img_avatar1.png" alt="Card image" style="width:100%"><br><br>
    <div class="card-body" style="border: 1px solid gray;border-top: 5px solid teal;">
      <h1 class="card-title">${user.name}</h1>
      <p class="card-text"><b>Address:</b> ${user.address}</p>
      <p class="card-text"><b>Email:</b> ${user.email}</p>
      <p class="card-text"><b>Phone:</b> ${user.phone}</p>
      <p class="card-text"><b>DOB:</b> ${user.dob}</p>
            
    </div>
  </div>
  <br>
  


     
     
     </c:forEach>
     
     </center>
     </div>
</body>
</html>