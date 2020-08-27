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
  
  <img alt="" src="images/clip.png" class="top"><br><br><br>
  <div class="outer">
  <div class=inside">
  <div class="container inside">
 <center><b><h1>Prescription</h1></b></center><br>
  <form action="storePrescription" method="post" name="f1">
  <div class="form-group">
     <sql:setDataSource
        var="doctors"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/smartclinic"
        user="root" password=""
    />
     
    <sql:query var="listUsers"   dataSource="${doctors}">
        SELECT distinct P_ID  FROM appointment where doctor=?;
        <sql:param value="<%= sb.getName()%>" /> 
    </sql:query>
      <select class="form-control" "id="patient" onchange="funct()" name="pid">
      <option>Select Patient</option>
         <c:forEach var="user" items="${listUsers.rows}">
         
         <option value="${user.P_ID}"><c:out value="${user.P_ID}" /></option>
         </c:forEach>
      </select>
      </div> 
    <div class="form-group">
      <label for="id">Doctor Id:</label>
      <input type="text" class="form-control" id="did" value="<%= sb.getID() %>" name="did">
    </div>
     
   <div class="form-group">
    	
      <label for="name">Doctor Name:</label>
      <input type="text" class="form-control" id="doctor" value="<%= sb.getName() %>" name="doctor">
    </div>
    <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" value="<%= sb.getPhone() %>" name="phone">
    </div>
       <div class="form-group">
      <label for="date">Date:</label>
      <input type="text" class="form-control" id="date" placeholder="Enter date" name="date">
    </div>
    <div class="form-group">
      <label for="symptoms">Symptoms:</label>
      <textarea  rows="3" class="form-control" name="symptoms"></textarea>
     </div>
     <div class="form-group">
      <label for="medicine">Medicine:</label>
      <textarea rows="3" class="form-control" name="medicine"></textarea>
     </div>
     
   	
    <input type="submit" class="btn btn-primary" value="submit"> &nbsp;<a href="listofAppDoctor.jsp" class="btn btn-primary">Cancel</a>
  </form>
</div>
  
  </div>
  </div>
 	
</div>

</body>
</html>