<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	
	<link rel="stylesheet" href="assets/css/dashboard.css">
	 <script src="assets/js/dashboard.js">  </script>

	<title>OWNER</title>
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

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");

//display the data

Statement s = (Statement)con.createStatement();

ResultSet rs = s.executeQuery("select * from tbl_property WHERE reg_id= "+session.getAttribute("user_id").toString()+"");

%>
  <%@ include file = "afterheader.jsp" %>
		
        <div class="cart-main-area ptb-100">
            <div class="container">
                <center>
                <h3 class="page-title">Property</h3>
                </center>
                <div class="row">
                   
                        
                  
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                   
                        <form action="#">
                            <div class="table-content table-responsive">
                               


					<table>
						<thead>
							<tr>
								<th>Prpoerty_type</th>
								<th>Name</th>
								<th>Address</th>
								<th>Room</th>
								<th>Rent<th>
								<th>Image</th>
								<th>Owner_name</th>
								<th>Facility</th>
								<th>Edit</th>
								<th>delete</th>
							</tr>
						</thead>
						<tbody>
 
 
 
 
     
<%

while(rs.next())

{

String imgFileName=rs.getString("image");

%>

<tr>

	

<td> <%= rs.getString(2) %></td>

<td> <%= rs.getString(3) %></td>

<td> <%= rs.getString(4) %></td>

<td> <%= rs.getString(5) %></td>

<td> <%= rs.getString(6) %></td>
<td> </td>

<td> <img src="images/<%=imgFileName%> " height="100" alt=""></td>


<td> <%= rs.getString(8) %></td>

<td> <%= rs.getString(9) %></td>

<td><a href="updateproperty.jsp?update=<%= rs.getString(1)%>" class="edit">Update</a></td>

<td><a href="deleteproperty.jsp?delete=<%= rs.getString(1)%> " class="del">Delete</a></td>

</tr>

<%

}%>

 <td class="product-addtocart">
                                                
                                                
                                               
                                           </td>
                                           
                                           <td class="product-buynow">
                                                
                                                
                                                <!--<a href="payscript.php?pid=<?php echo $pro[0]; ?>">Buy Now</i></a>-->
                                           </td>
                                        </tr>
                                        
                                       
                                    </tbody>
                                   
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="cart-shiping-update-wrapper">
                                        <div class="cart-shiping-update">
                                            <a href="shop_property.jsp">Continue Search</a>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
       


  

 </div> 
</body>
</html>