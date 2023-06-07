

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
</head>
<!-- <link rel="stylesheet" href="assets/css/viewproperty.css">
 -->
<body>
 <%@ include file = "afterheader.jsp" %>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentals","root","");

try{

if(request.getParameter("update")!= null)

{

String update = request.getParameter("update");

//display the data

Statement s = (Statement)con.createStatement();

ResultSet rs = s.executeQuery("select * from tbl_property where prid ="+update+"");

while(rs.next())

{

%>
<div class="login-register-area ptb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-toggle="tab" href="#lg1">
                                    <h4> Update PROPERTY </h4>
                                </a>

                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form action="add_property" method="post" enctype="multipart/form-data" >
												<input type= "hidden" value="<%= request.getParameter("update") %>" name="update">
                                                  
                                                Update property :
                                                  
                                                       <select name="prtype">
                                                            <option>Select house Type :</option>
                                                            <option>villa</option>
                                                            <option>Bunglow</option>
                                                            <option>Flat</option>
                                                        </select><br><br>
                                                property_name :<input type="hidden"  value="<%= rs.getString("pr_name") %>" name="pr_name" required></br>
                                                address : <input type="text" name="address"  value="<%= rs.getString("address") %>" required></br>
                                                no_of_room : <input type="number" name="room" min="1" max="5"  value="<%= rs.getString("room") %>"  required></br>
                                                Rent : <input type="number" name="rent"  value="<%= rs.getString("rent") %>" required></br>
                                                image : <input type="file" name="image" accept="image/png, image/jpg, image/jpeg" value="<%= rs.getString("image") %>"></br>
                                                owner_name :<input type="text" name="o_name"  value="<%= rs.getString("owner_name") %>" required ></br>
                                                facility :<input type="text" name="facility"  value="<%= rs.getString("facility") %>" required></br>

                                
                                                <!-- <hr> -->
                                                <center>
                                                
                                                    <input type="submit" name="Insert" value="Insert">
															<a href="manageproduct.jsp" class="back_button">Back</a>
                                                   <!--  <input type="submit" name="Select" value="Select"> -->

                                                </center>


                                            </form>
<!--                                             </center>
 -->                                        </div>
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
<%

if(request.getParameter("add_property") != null)

{

}

%>

<%

}

}

}

catch(Exception e)

{

//out.println(e);

}

%>
     
</body>
</html>