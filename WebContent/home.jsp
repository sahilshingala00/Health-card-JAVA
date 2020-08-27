<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Smart Clinic</title>
<style type="text/css">
.flot{
position: absolute;
 top: 250px;
 left: 20%;
 color: white;
 font-size: 80px;
 
}

.inner{

color:teal;
}
.image{
position:relative;
width:100%;
}

.example_a {
color: #fff !important;
text-transform: uppercase;
text-decoration: none;
background: teal;
padding: 20px;
border-radius: 5px;
display: inline-block;
border: none;
transition: all 0.4s ease 0s;

font-size:20px;
}

.example_a:hover {
background: #434343;
letter-spacing: 1px;
box-shadow: 5px 40px -10px rgba(0,0,0,0.57);
transition: all 0.4s ease 0s;
}
</style>
</head>
<body>
<jsp:include page="head1.jsp"></jsp:include>
<img alt="doctor" src="images/home.jpg" class="image">
<div class="flot">
<b>
 We care about<br> your <span class="inner">Health</span>
 <br><a class="example_a" href="login.jsp" >Log In</a>&nbsp;&nbsp;<a class="example_a" href="signUp.jsp" >SignUp</a>
</b>
</div>
</body>
</html>