<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="robots" content="noindex, follow" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

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
        <%
		if(session!=null){
			
			String userid=(String) session.getAttribute("user_id");
			System.out.println("Inside Session Check Code");
			
			if(session.getAttribute("user_id")==null)
			{
				response.sendRedirect("login1.jsp");
				//System.out.println("Session is not set");
				
			}
			else
			{
				//*System.out.println("Session is sett");
			}
		}
		
		//clear cache for logout
		response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0); 
		
%>
    </head>
    <body>
       
 <%@ include file = "afterheader.jsp" %>

        <div class="login-register-area ptb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-toggle="tab" href="#lg1">
                                    <h4> PROPERTY </h4>
                                </a>

                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form action="add_property" method="post" enctype="multipart/form-data" >

                                                  
                                                       <select name="prtype">
                                                            <option>Select house Type :</option>
                                                            <option>villa</option>
                                                            <option>Bunglow</option>
                                                            <option>Flat</option>
                                                        </select><br><br>
                                                property_name :<input type="text" name="pr_name"></br>
                                                address : <input type="text" name="address"></br>
                                                no_of_room : <input type="number" name="room" min="1" max="5"></br>
                                                Rent : <input type="number" name="rent" ></br>
                                                image : <input type="file" name="image"></br>
                                                owner_name :<input type="text" name="o_name"></br>
                                                facility :<input type="text" name="facility"></br>

                                
                                                <!-- <hr> -->
                                                <center>
                                                    <input type="submit" name="Insert" value="Insert">

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
       
    </body>
   
</html>

