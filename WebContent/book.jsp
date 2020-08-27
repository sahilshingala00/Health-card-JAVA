<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="beans.*" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  .outer{
  height: auto;
  width: auto;
  background-color: black;
  padding: 40px;
  z-index:2;
  }
  .inside{
   height: 100%;
  width: 100%;
  background-color: white;
  padding: 20px;
  
  }
  
  .top{
  
  position:absolute;
  width: 350px;
  left: 40%;
  z-index: 1;
  }
  
  #doctor{
  color:black;}
  </style>
<title>Insert title here</title>
</head>
<body>
<% 

signupBean sb=(signupBean)session.getAttribute("bean");
	
%>
<div class="container">
  <center><b><h1>Book your Appointment</h1></b></center>
  <br><br>
  <img alt="" src="images/clip.png" class="top"><br><br><br>
  <div class="outer">
  <div class=inside">
  <div class="container inside">
  
  <form action="storeAPP" method="post">
    <div class="form-group">
      <label for="id">Patient Id:</label>
      <input type="text" class="form-control" id="pid"  value="<%= sb.getID() %>"  name="pid">
    </div>
   <div class="form-group">
    	
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" value="<%= sb.getName() %>"  name="name">
    </div>
    <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" value="<%= sb.getPhone() %>" name="phone">
    </div>
    <div class="form-group">
     <sql:setDataSource
        var="doctors"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/smartclinic"
        user="root" password=""
    />
     
    <sql:query var="listUsers"   dataSource="${doctors}">
        SELECT * FROM doctor;
    </sql:query>
      <select class="form-control" id="doctor" name="doctor">
      <option>Select doctor</option>
         <c:forEach var="user" items="${listUsers.rows}">
         
         <option value="${user.name}"><c:out value="${user.name}" /></option>
         </c:forEach>
      </select>
      </div>
       <div class="form-group">
      <label for="date">Date:</label>
      <input type="text" class="form-control" id="date" placeholder="Enter date" name="date">
    </div>
   	
    <input type="submit" class="btn btn-primary" value="submit"> &nbsp;<a href="patient.jsp" class="btn btn-primary">Cancel</a>
  </form>
</div>
  
  </div>
  </div>
 	
</div>

</body>
</html>