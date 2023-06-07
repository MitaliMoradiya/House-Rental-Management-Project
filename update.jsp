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

String sessionid = (String)session.getAttribute("user_id");

/* out.print("Hi "+session_name);

out.print("Hi "+sessionid); */

%>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");
try{

if(request.getParameter("update")!= null)

{
	Statement st =con.createStatement();

	String uname = request.getParameter("uname");

	String contact = request.getParameter("contact");

	String city = request.getParameter("city");

	String email = request.getParameter("email");

	String update = request.getParameter("update");
System.out.println(update);
PreparedStatement ps = con.prepareStatement("update tbl_reg set rid=?,uname=?,contact=?,city=?,email=? where rid =" + update);

ps.setString(1,update);
ps.setString(2,uname);
ps.setString(3,contact);
ps.setString(4,city);
ps.setString(5,email);



int x = ps.executeUpdate();
response.sendRedirect("profile.jsp");

/* response.sendRedirect("index.jsp"); */

}

}

catch(Exception e)

{

out.println(e);

}

%>


</body>
</html>