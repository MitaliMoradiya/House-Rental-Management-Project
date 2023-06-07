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
<%@ page import="jakarta.servlet.Servlet" %>
    
    
<%
    // Start a session
    session = request.getSession();
	String sessionid = (String)session.getAttribute("user_id");

    // Connect to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals", "root", "");
    if(conn == null)
    {
        out.println("Error in connection");
        return;
    }

    // Retrieve user information from the database
    String email = (String) session.getAttribute("email");
  /*   String query = "SELECT * FROM tbl_reg WHERE rid= '+sessionid+'"; */
  
  Statement s = (Statement)conn.createStatement();
  ResultSet rs = s.executeQuery("SELECT * FROM tbl_reg WHERE rid= "+sessionid+" ");
    /* PreparedStatement pstmt = conn.prepareStatement();
    pstmt.setString(1, email);
    ResultSet rs = pstmt.executeQuery(); */

    //if (rs.next()) {
        // Get user information from the result set
       // String username = rs.getString("user_name");
        // You can retrieve other fields from the result set as needed

        // Store user information in session for future use
       // session.setAttribute("user_name", username);
        // You can store other fields in session as needed
  //  } else {
   //     // If user does not exist, display an error message
       // out.println("User not found");
  //  }

    // Close the database connections
   // rs.close();
   // pstmt.close();
   // conn.close();
%>


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
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>

  <%@ include file = "afterheader.jsp" %>
  
  <div class="cart-main-area ptb-100">
            <div class="container">
                <center>
                <h3 class="page-title">Profile update</h3>
                </center>
                <div class="row">
                   
                        
                  
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                   
                        <form action="#">
                            <div class="table-content table-responsive">
                               
                                <table>
                                    <thead>
                                        <tr>
                                            
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Contact_num</th>
                                            <th>City</th>
                                            <th>Email</th>
<!--                                             <th>CHANGE PASSWORD</th>
 -->                                            <th>UPDATE PROFILE</th>    
                                               
                                         
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    
                                    
                                    

<%
    while(rs.next()) {
      //  String col1 = rs.getString(1); // assuming column index starts from 1
       // String col2 = rs.getString(2);
      //  String col3 = rs.getString(3);
       // String col4 = rs.getString(4);
%>

<tr>
    <td class="product-name"><%= rs.getString(1) %></td>
    <td class="product-name"><%= rs.getString(2) %></td>
    <td class="product-price"><%= rs.getString(3) %></td>
    <td class="product-price"><%= rs.getString(4) %></td>
        <td class="product-price"><%= rs.getString(5) %></td>
    
    <td><a href="u.jsp?update=<%= rs.getString(1)%>" class="edit">Update</a></td>

</tr>

<%
    }
%>
                                            
                                               <td class="product-addtocart">
                                                
                                                
<!--                                                 <a href="changepassword.php" class="btn btn-success">CHANGE PASSWORD</i></a>
 -->                                                
                                           </td>
                                           
                                           <td class="product-buynow">
                                                
                                                
<%--                                                <a class="btn btn-primary" href="uprofile.php?cid=<?php echo $pro[0]; ?>">UPDATE PROFILE</i></a>
 --%>                                                    
                                           </td>
                                        </tr>
                                        
                                       
                                    </tbody>
                                    <?php 
                                        }
                                    ?>
                                </table>
                            </div>
                            
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
        
        
        

</body>
</html>