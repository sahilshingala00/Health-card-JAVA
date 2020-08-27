<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN/SIGNUP</title>
        <link rel="stylesheet"  type="text/css" href="login.css">
        
    </head>
    <body>
        <center>
       <div class="login" id="oneform">
        <h2>LogIn Here</h2>
        <div class="loginform">
            <form action="authenticate" method="post" name="frmLogin">
                 <div class="box">
                    <select class="occ" id="occupation" name="occp">
                        <option value="0" selected>I am a .. </option>
                        <option value="doctor">Doctor</option>
                        <option value="patient">Patient</option>
                        
                        
                    </select>
                  </div><br><br><br><br>
                <div class="agile-field-txt">
                    <label> Email</label>
                    <input type="text" name="email" id="email" placeholder="Enter Email"  />
                </div>
                <div class="agile-field-txt">
                    <label> password</label>
                    <input type="password" name="password" placeholder="Enter Password" id="myInput" />
                    <div class="agile_label">
                        <input id="check3" name="check3" type="checkbox" value="show password" onclick="myFunction()">
                        <label class="check" for="check3">Show password</label>
                    </div>
                    <div class="agile-right">
                        <a href="#">forgot password?</a>

                    </div>
                    <div class="agile-right">
                        
                        <a href="signUp.jsp">Not having an Account? SignUp</a>
                        </div>
                </div>
                <!-- script for show password -->
                <script>
                    function myFunction() {
                        var x = document.getElementById("myInput");
                        if (x.type === "password") {
                            x.type = "text";
                        } else {
                            x.type = "password";
                        }
                    }
                </script>
                <input type="submit" value="SIGN IN">
            </form>

        </div>
       </div>

      
    </center>
    </body>
</html>