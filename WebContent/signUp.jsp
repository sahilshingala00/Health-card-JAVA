<html>
    <head>
        <title>LOGIN/SIGNUP</title>
        <link rel="stylesheet"  type="text/css" href="signup.css">
    </head>
    <body>
        <center>
       

      
       <div class="signup" id="secondform">
      
           <h2 style="color: white;">Sign Up here</h2>
           <div class="signupform">
            <form action="storeData" method="post" name="frm">
                
                
                      <label>Name</label>
                      <input type="text" name="username" id="username" placeholder="Enter your Full name" />
                    <br>
                    <br>
                    <br>
                
                      <label>Email</label>
                      <input type="text" name="email" id="email" placeholder="Enter your email address" />
                      <br>
                    <br>
                    <br>
                    <label>Phone</label>
                    <input type="text" name="phone" id="phone" placeholder="Enter your mobile number" />
                    <br>
                  <br>
                  <br>
                  <label>Address</label>
                    <textarea id="address" name="address"></textarea>
                <br>
                    <br>
                  <br>
                  <br>
                  <label>DOB</label>
                    <input type="text" name="dob" id="dob" placeholder="Enter your birthdate" />
                    <br>
                  <br>
                  <br>
                  <label> Set Password(minimum length 8 is required)</label>
                    <input type="password" name="password" placeholder="Enter Password" id="myInput" />
                   <br><br><br>
                  
                

                  
                  <div class="box ">
                    <select class="blood" id="BG" name="blood">
                        <option value="0" selected>Blood Group</option>
                        <option value="apt">A+</option>
                        <option value="ang">A-</option>
                        <option value="bpt">B+</option>
                        <option value="bng">B-</option>
                        <option value="abpt">AB+</option>
                        <option value="abng">AB-</option>
                        <option value="opt">O+</option>
                        <option value="ong">O-</option>
                        
                    </select>
                    <select class="blood" id="gender" name="gender">
                        <option value="0" selected>Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        </select>
                       
                  </div>
                  <br>

                  

                  <div class="box">
                    <select class="occ" id="occupation" name="occp">
                        <option value="0" selected>I am a .. </option>
                        <option value="doctor">Doctor</option>
                        <option value="patient">Patient</option>
                        
                    </select>
                  </div><input type="submit" value="SIGN UP">
                <div class="agile-right">
                    <a href="login.jsp">Already Have an Account? Log In</a>

                </div>
            </form>

       </div>
    </center>
    </body>
</html>