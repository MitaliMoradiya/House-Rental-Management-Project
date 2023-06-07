<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
                                    <h4> Forgot Password </h4>
                                </a>
                                
                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form action="Forgotpass" method="post" >
                                                Email : <input type="email" name="email" id="email" required="" ><br>
                                                <span id = "email-message" style="color:red"> </span>
                       
                                                
                                                    <!-- <div class="login-toggle-btn">
                                                        <input type="checkbox">
                                                        <label>Remember me</label> -->
                                                       <!--  <a href="fpassword.php">Forgot Password?</a> -->
                                                    </div> 
                                                    <button type="submit" name="submit" ><span>Get OTP</span></button>
                                                <a href="login1.jsp"  type="submit">Back to Login</a>
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