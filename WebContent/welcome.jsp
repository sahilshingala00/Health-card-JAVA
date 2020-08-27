<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	signupBean sb=(signupBean)session.getAttribute("bean");
	String occp=sb.getOccupation();
	if(occp.equalsIgnoreCase("patient"))
	{
		response.sendRedirect("patient.jsp");
	}
	else if(occp.equalsIgnoreCase("doctor"))
	{
		response.sendRedirect("doctor.jsp");
	}
	else{
		response.sendRedirect("receptionist.jsp");
	}

%>
</body>
</html>