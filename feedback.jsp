<%@page import="com.mysql.cj.Session"%>
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
<html>
<head>
<meta charset="ISO-8859-1">

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
<title>Insert title here</title>
</head>
<body>
 <%@ include file = "header-file.jsp" %>
   
<%@ page import="java.sql.*" %>
       <% 
       String user_id = (String) session.getAttribute("user_id");
try{

Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");
	
	

if(request.getParameter("submit") != null)

{

if( request.getParameter("email") != null ||request.getParameter("comment") != null )

{

Statement st =con.createStatement();


String email = request.getParameter("email");

String comment = request.getParameter("Comment");






PreparedStatement ps = con.prepareStatement("insert into tbl_feedback( email, Comment,userid) values(?,?,?);");



ps.setString(1,email);

ps.setString(2,comment);

ps.setString(3,user_id);





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
    <div class="login-register-area ptb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                    <div class="login-register-wrapper">
                        <div class="login-register-tab-list nav">
                            <a class="active" data-toggle="tab" href="#lg1">
                                <h4> Feedback </h4>
                            </a>
                            
                        </div>
                        <div class="tab-content">
                            <div id="lg1" class="tab-pane active">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="" method="post" >
                                            Email : <input type="email" name="email" id="email" ><br>
                                            <span id = "email-message" style="color:red"> </span>
                   
                                            Comment : <input type="text" name="Comment" id="Comment"  ><br>
                                            <span id = "pass-message" style="color:red"> </span>
                                            
                                           
                                                <!-- <div class="login-toggle-btn">
                                                    <input type="checkbox">
                                                    <label>Remember me</label>
                                                    <a href="fpassword.php">Forgot Password?</a>
                                                </div> -->
                                                <button type="submit" name="submit" ><span>Submit</span></button>
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
</html>