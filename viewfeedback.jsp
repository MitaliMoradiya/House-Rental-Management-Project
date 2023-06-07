<%
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

	<title>ADMIN</title>
</head>
<body>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");

//display the data

Statement s = (Statement)con.createStatement();

ResultSet rs = s.executeQuery("select * from tbl_feedback ");

%>


	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">ADMIN</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="#">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Tenant</span>
				</a>
			</li>
			<li>
				<a href="viewproperty.jsp">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">Properties</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Owner</span>
				</a>
			</li>
			<li>
				<a href="viewpayment.jsp">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Payment</span>
				</a>
			</li>
			<li>
				<a href="viewfeedback.jsp">
					<i class='bx bxs-group' ></i>
					<span class="text">Feedback</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="logout.jsp" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			
			<form action="#">
				
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">8</span>
			</a>
			<a href="#" class="profile">
				<img src="img/people.png">
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>ADMIN</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">ADMIN</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="index.jsp">Home</a>
						</li>
					</ul>
				</div>
				<a href="#" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download bill</span>
				</a>
			</div>

			<!-- <ul class="box-info">
				<li>
					<i class='bx bxs-calendar-check' ></i>
					<span class="text">
						<h3>1020</h3>
						<p>New Properties</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>2834</h3>
						<p>Visitors</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
						<h3>$2543</h3>
						<p>Total Rents</p>
					</span>
				</li>
			</ul> -->


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Feedback</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>email</th>
								<th>Comment</th>
								
								
							</tr>
						</thead>
						<tbody>
<%						

while(rs.next())

{



%> 

<tr>

	

<td> <%= rs.getString(2) %></td>

<td> <%= rs.getString(3) %></td>

<%} %>

<%-- 
<td><a href="updateproperty.jsp?update=<%= rs.getString(1)%>" class="edit">Update</a></td>

<td><a href="deleteproduct.jsp?delete=<%= rs.getString(1)%> " class="del">Delete</a></td> --%>

</tr>


							
								
						</tbody>
					</table>
				</div>
				
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	

	<script src="dashboard.js"></script>
</body>
</html>