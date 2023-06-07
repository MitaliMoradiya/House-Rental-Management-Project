<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

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
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
    <%@ include file = "header-file.jsp" %>
    
    <%

response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setHeader("Pragma","no-cache");
%>

<!-- cookies -->
 <%
    Cookie[] cookies = request.getCookies();
    String username="";
    String passw = "";
    if(cookies!=null)
    {
      for(int i=0;i<cookies.length;i++){
        Cookie cookie = cookies[i];
        if(cookie.getName().equals("username-cookie"))
        {
            username= cookie.getValue();
        }
        else if(cookie.getName().equals("password-cookie"))
        {
            passw= cookie.getValue();
        }
      }
    }
   %>
   
   <%
    String user=request.getParameter("email");
    String pass=request.getParameter("password");

    String rememberMe=  request.getParameter("rememberMe");
    if(rememberMe!=null)
    {
        Cookie usernameCookie = new Cookie("username-cookie", user);
        Cookie passwordCookie = new Cookie("password-cookie", pass);
        usernameCookie.setMaxAge(24*60*60);
        passwordCookie.setMaxAge(24*60*60);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
        }
    %> 
<!-- end --> 



<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("email") != null || request.getParameter("password") != null)
		{
			String uname = request.getParameter("email");
			String password = request.getParameter("password");

			// Hash the entered password
			MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(password.getBytes());
				byte[] hash = md.digest();
				String hashpass = new String(Base64.getEncoder().encode(hash));

			PreparedStatement ps = con.prepareStatement("SELECT * FROM tbl_reg WHERE email = ? and password = ?");
			ps.setString(1, uname);
			ps.setString(2, hashpass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
			session.setAttribute("user_email", uname);
			session.setAttribute("user_id", rs.getString("rid"));
			session.setAttribute("user_name", rs.getString("uname"));
			
			 response.sendRedirect("index.jsp"); 
		} else {
			
			%>
			<p class="er"><%out.println("invalid username and password!"); %></p>
			<% 
			
		}
		}  
		else
		{
			%>
			<p class="er"><%out.println("invalid username and password!"); %></p>
			<% 
			

		}
		
	}
	
	}
catch(Exception e)
{
 out.println("error" +e);
}
%>

        <div class="login-register-area ptb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-toggle="tab" href="#lg1">
                                    <h4> login </h4>
                                </a>
                                
                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form action="" method="post" onsubmit = "return check()">
                                                Email : <input type="email" name="email" id="email"  value =" <%= username %>"><br>
                                                <span id = "email-message" style="color:red"> </span>
                       
                                                Password  : <input type="password" name="password" id="password"  value ="<%= passw %>"><br>
                                                <span id = "pass-message" style="color:red"> </span>
                                                
                                                Remember me: <input type="checkbox"  name = "rememberMe" value = "true" >
                                                <div class="button-box">
                                                    <!-- <div class="login-toggle-btn">
                                                        <input type="checkbox">
                                                        <label>Remember me</label>
                                                        <a href="fpassword.php">Forgot Password?</a>
                                                    </div> -->
                                                    <button type="submit" name="submit" ><span>Login</span></button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div id="lg2" class="tab-pane">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       

    </body>
    
    
   <script>  
function check() {  
	var uname = document.getElementById("email").value;
	if(uname == ""){
  		document.getElementById("email-message").innerHTML = "**Fill the username please!";  
     	return false;
  	}
	
  	var pw = document.getElementById("password").value;  
  	//check empty password field  
  	if(pw == "") {  
     	document.getElementById("pass-message").innerHTML = "**Fill the password please!";  
     	return false;  
  	}  
  if(uname != null || pw != null)
	  {
	    document.getElementById("er-message").innerHTML = "**Incorrect Username and Password!";  
     	return false;
	  
	  }
  	
  }

</script>
   

</html>

