<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
        <%@ page import="java.sql.*"%>

<%@ page import="java.util.Base64" %>

<%@ page import="java.io.*"%>

<%@ page import="java.math.*"%>

<%@ page import="java.security.MessageDigest"%>

<%@ page import="java.util.Calendar"%>

<%@ page import="java.text.SimpleDateFormat"%>

    <!doctype html>
    <html class="no-js" lang="zxx">
    

    <head>
            <meta charset="utf-8">
            <meta http-equiv="x-ua-compatible" content="ie=edge">
            <title></title>
            <meta name="description" content="">
            <meta name="robots" content="noindex, follow" />
            <meta name="viewport" content="width=device-width, initial-scale=1">
            
            

    <!-- all css here -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/animate.css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="assets/css/slick.css">
            <link rel="stylesheet" href="assets/css/chosen.min.css">
            <link rel="stylesheet" href="assets/css/font-awesome.min.css">
            <link rel="stylesheet" href="assets/css/themify-icons.css">
            <link rel="stylesheet" href="assets/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.css">
            <link rel="stylesheet" href="assets/css/meanmenu.min.css">
            <link rel="stylesheet" href="assets/css/style.css">
            <link rel="stylesheet" href="assets/css/responsive.css">
            <script src="assets/js/vendor/modernizr-2.8.3.min.js">
            
            </script>
        </head>
        <body>
       
       <%@ page import="java.sql.*" %>
       <% 
try{

Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");
	
	

if(request.getParameter("submit") != null)

{

if(request.getParameter("uname") != null ||request.getParameter("contact") != null ||request.getParameter("city") != null || request.getParameter("email") != null ||request.getParameter("password") != null )

{

Statement st =con.createStatement();

// String rid = request.getParameter("rid");

String uname = request.getParameter("uname");

String contact = request.getParameter("contact");

String city = request.getParameter("city");

String email = request.getParameter("email");

String password = request.getParameter("password");




//hash password

MessageDigest md = MessageDigest.getInstance("SHA-256");

md.update(password.getBytes());

byte[] hash = md.digest();

String hashpass = new String(Base64.getEncoder().encode(hash));

PreparedStatement ps = con.prepareStatement("insert into tbl_reg(uname,contact,city, email, password,usertype) values(?,?,?,?,?,'tenant');");

ps.setString(1,uname);

ps.setString(2,contact);

ps.setString(3,city);

ps.setString(4,email);

ps.setString(5,hashpass);





int x = ps.executeUpdate();


response.sendRedirect("login1.jsp");
}

else

{

/* out.print("enter the details"); */

/* String er = "enter the details"; */

}

}

else

{

//out.print("enter the details");

}

}

catch(Exception e)

{

  out.println("error" +e);
 
}

%>
  <%@ include file = "header-file.jsp" %>       
            <div class="login-register-area ptb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                            <div class="login-register-wrapper">
                                <div class="login-register-tab-list nav">
                                    
                                    <a class="active" data-toggle="tab" href="#lg2">
                                        <h4> register </h4>
                                    </a>
                                </div>
                                <div class="tab-content">
                                    <div id="lg1" class="tab-pane active">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <form action="" method="post" onsubmit="return verifyPassword()">
                                                    Name : <input type="text" name="uname" pattern="[A-Z a-z]*" id="uname" required><br>
                                                    <span id = "uname-message" style="color:red"> </span>
                            
                                                    Contact  : <input type="text" name="contact" pattern="[6789][0-9]*" min="10" max="12" id="contact" ><br>
                                                    <span id = "phone-message" style="color:red"> </span>
                            
                                                    City  : <input type="text" name="city"  pattern="[a-z]*" id="city" required><br></br>
                            						<span id = "city-message" style="color:red"> </span>
                                                    
                                                    Email  : <input type="email" name="email"  pattern=".+@gmail\.com" size="30" id="email" required><br>
													<span id = "email-message" style="color:red"> </span>
                                                    
                                                    password   : <input type="password" name="password" id="password"><br>
                                                    <span id = "pass-message" style="color:red"> </span>
                                                    
                                                    <input type="submit" name="submit" value="Registration"><span></span> 
                        	already have acc??... <a href = "login1.jsp" >login here </a>
                                                   
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     <%@ include file = "footer-file.jsp" %>
            
        </body>
        
        <script>

function verifyPassword() {

var decimal= /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;



var uname = document.getElementById("uname").value;

var phone = document.getElementById("contact").value;

var city = document.getElementById("city").value;

var email = document.getElementById("email").value;

var pw = document.getElementById("password").value;


if(uname == "") {

document.getElementById("uname-message").innerHTML = "**Fill the username please!";

return false;

}

if(phone == "") {

document.getElementById("phone-message").innerHTML = "**Fill the contact number please!";

return false;

}

if(phone == "") {

	document.getElementById("city-message").innerHTML = "**Fill the city please!";

	return false;

	}

if(email == "") {

document.getElementById("email-message").innerHTML = "**Fill the email please!";

return false;

}

//check empty password field

if(pw == "") {

document.getElementById("pass-message").innerHTML = "**Fill the password please!";

return false;

}

//To check a password between 8 to 15 characters which contain at least one lowercase letter,

//one uppercase letter, one numeric digit, and one special character

if(!pw.match(decimal)){

document.getElementById("pass-message").innerHTML = "**Follow the rules for password";

return false;

}

//minimum password length validation

if(pw.length < 8) {

document.getElementById("pass-message").innerHTML = "**Password length must be atleast 8 characters";

return false;

}

//maximum length of password validation

if(pw.length > 15) {

document.getElementById("pass-message").innerHTML = "**Password length must not exceed 15 characters";

return false;

} else {

}



}

</script>
       
    </html>
