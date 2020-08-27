<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ include file="pre.jsp" %>  
   <%@ page import="beans.*,java.sql.*" %>  
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.outer{
  height: auto;
  width: 800px;
  background-color: khaki;
  padding: 40px;
  margin-left:10%;
  }
  .inside{
   height: 100%;
  width: 100%;
  background-color: white;
  padding: 20px;
  
  }
  
  

</style>
</head>
<body>
     
       <sql:setDataSource
        var="doctors"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost/smartclinic"
        user="root" password=""
    />
     
    <sql:query var="listUsers"   dataSource="${doctors}">
        SELECT * FROM records where date=? and pid=?;
        <sql:param value="${param.date}" /> 
        <sql:param value="<%= sb.getID()%>" /> 
    </sql:query>
    

      <br><br>   
         <div class="container">
  
  <div class="outer">
  <div class=inside">
  <div class="container inside">
  <center><h2>Smart Clinic</h2>
  <h3>Prescription</h3></center><br><br>
  <div class="card">
    
    <div class="card-body" style="border: 1px solid gray;border-top: 5px solid teal; padding-left: 10px;padding-top: 20px;">
     <c:forEach var="user" items="${listUsers.rows}">
         
         
         
      <p class="card-title"><b>Name:</b><c:out value="${user.patient}" /><b style="margin-left:20%;">Patient ID:</b> <c:out value="${user.pid}" /></p>
     <hr> <p class="card-text"><b>Date:</b><c:out value="${user.date}" /></p>
      <p class="card-text"><b>Doctor:</b><c:out value="${user.doctor}" /></p>
      
      <p class="card-text"><b>Symptoms:</b><c:out value="${user.symptoms}" /></p>
      <p class="card-text"><b>Medicines:</b><c:out value="${user.medicine}" /> </p>
      <hr>
       <p class="card-text"><b>Fees:</b><c:out value="300" /> </p>

     </c:forEach>
    </div>
  </div>
  
  </div>
  </div>
  </div>
</div>
</body>
</html>