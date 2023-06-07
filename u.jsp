<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

        <%@ page import="java.sql.*"%>

<%@ page import="java.util.Base64" %>

<%@ page import="java.io.*"%>

<%@ page import="java.math.*"%>

<%@ page import="java.security.MessageDigest"%>

<%@ page import="java.util.Calendar"%>

<%@ page import="java.text.SimpleDateFormat"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
            


 
 <script src="nav.js"></script>
</head>
<body>
 <%@ include file = "afterheader.jsp" %>

<%

response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");

response.setDateHeader("Expires", 0);

response.setHeader("Pragma","no-cache");

if(session.getAttribute("user_id")== null)

{

response.sendRedirect("login1.jsp");

}

%>

<%

String session_name = (String)session.getAttribute("user_email");

String session_user = (String)session.getAttribute("user_name");

String sessionid = (String)session.getAttribute("user_id");

/* out.print("Hi "+session_name);

out.print("Hi "+sessionid); */

%>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");

try{
	/* String[] SHIFT={"Morning","Afternoon","Evening"};
	
	String[] cat={
			"classical","bollywood","salsa","hip hop"
	
	}; */

	
if(request.getParameter("update")!= null)

{

String update = request.getParameter("update");
out.println(update);
//display the data

Statement s = (Statement)con.createStatement();

ResultSet rs = s.executeQuery("select * from tbl_reg where rid ="+update+"");

while(rs.next())

{

%>


    
     <div class="login-register-area ptb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                            <div class="login-register-wrapper">
                                <div class="login-register-tab-list nav">
                                    
                                    <a class="active" data-toggle="tab" href="#lg2">
                                        <h4> Update Profile </h4>
                                    </a>
                                </div>
                                <div class="tab-content">
                                    <div id="lg1" class="tab-pane active">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
   <form class="form" id="form1" method = "post" action="update.jsp" >
      
       <p class="name">
   </p>

 <input type="hidden"  name = "update"  value="<%= rs.getString("rid") %>">
 Name : <input type="text" name="uname" pattern="[A-Z a-z]*" id="uname" value="<%= rs.getString("uname") %>"required><br>
                          <span id = "uname-message" style="color:red"> </span>
                            
                                                    Contact  : <input type="text" name="contact" pattern="[6789][0-9]*" min="10" max="12" id="contact" value="<%= rs.getString("contact") %>"><br>
                                                    <span id = "phone-message" style="color:red"> </span>
                            
                                                    City  : <input type="text" name="city"  pattern="[a-z]*" id="city" value="<%= rs.getString("city") %>"required><br></br>
                            						<span id = "city-message" style="color:red"> </span>
                                                    
                                                    Email  : <input type="email" name="email"  pattern=".+@gmail\.com" size="30" id="email" value="<%= rs.getString("email") %>" required><br>
													<span id = "email-message" style="color:red"> </span>
                                                    
                                                    password   : <input type="password" name="password" id="password"><br>
                                                    <span id = "pass-message" style="color:red"> </span>
                                                    
                                                    <input type="submit" name="submit" value="Update"><span></span> 
<!-- Form Start -->

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

			
				
				<!-- <button class="button login__submit" name="enroll" type="submit">
					<span class="button__text">Enroll Now</span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button> -->				
		<!-- 	</form>
			
			<div class="social-login">
					
				<div class="social-icons">
					<a href="#" class="social-login__icon fab fa-instagram"></a>
					<a href="#" class="social-login__icon fab fa-facebook"></a>
					<a href="#" class="social-login__icon fab fa-twitter"></a>
				</div>
			</div>
		</div>
		
		
		<div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
</div> -->

<%

if(request.getParameter("update")!= null)

{

Statement st =con.createStatement();

String uname = request.getParameter("uname");

String contact = request.getParameter("contact");

String city = request.getParameter("city");

String email = request.getParameter("email");

String id = request.getParameter("update");

PreparedStatement ps = con.prepareStatement("update tbl_reg set uname=?,contact=?,city=?, email=?,address=? where rid = ?;");

ps.setString(1,uname);

ps.setString(2,contact);

ps.setString(3,city);

ps.setString(4,email);

ps.setString(5,id);


int x = ps.executeUpdate();

response.sendRedirect("profile.jsp");

}

%>

<!-- Form Close -->



<!-- Form Wrap Close -->



<!-- Container Close -->

<%

}

}

}

catch(Exception e)

{

//out.println(e);

}
%>  </div>
   <%@ include file = "footer-file.jsp" %>

</body>
</html>