<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>new pass</title>
</head>
<body>
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
                                            <form action="forgotpassword" method="post" >
                                                password : <input type="text" name="password" id="password"  placeholder="&#xf084; &nbsp; New Password"><br>
                                                password : <input type="password" name="confPassword" id="confPassword"  placeholder="&#xf084; &nbsp; Confirm New Password"><br>
                                               
                       	
                                                
                                                    <!-- <div class="login-toggle-btn">
                                                        <input type="checkbox">
                                                        <label>Remember me</label> -->
                                                       <!--  <a href="fpassword.php">Forgot Password?</a> -->
                                                    </div> 
                                                    <button type="submit" name="submit" value="Reset" ></button>
                                               
                                                </div>
                                                Don't have an Account?<span><a href="Reg.jsp"

> Register Now!</a></span>
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