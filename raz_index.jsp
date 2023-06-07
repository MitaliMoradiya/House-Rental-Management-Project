<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- !-- all css here -->
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
        
        <!-- jQuery cdn  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- razorpay -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


 <%--  <%@ include file = "header-file.jsp" %>   --%> 
 <div class="login-register-area ptb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-toggle="tab" href="#lg1">
                                    <h4> PAY NOW </h4>
                                </a>
                                
                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form action="" method="post" >
                                                Name : <input type="text" name="name" id="name"  ><br>
                                                <span id = "email-message" style="color:red"> </span>
                       
                                                Amount  : <input type="text" name="amt" id="amt"  ><br>
                                                <span id = "pass-message" style="color:red"> </span>
                                                
                                                
                                                    <!-- <div class="login-toggle-btn">
                                                        <input type="checkbox">
                                                        <label>Remember me</label> -->
                                                       
                                                    </div> 
                                                    <!-- <button type="submit" name="submit" ><span>Login</span></button> -->
                                                   <div onclick="pay_now()">
                                                   pay now</div>
                                                  
                                                <div class="button-box"> 
                                                </div>
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
       
        
       <script>
       function pay_now() {
           
          
         	var name=document.getElementById("name").value;
         	var price=document.getElementById("amt").value;
         	
          	console.log(name);
          	console.log(price);
           
                   var options = {
                       "key": "rzp_test_HcLrivzAR5rGdZ",
                       "amount": price * 100,
                       "currency": "INR",
                       "name": "House rental ",
                       "description": "Test Transaction",
                       "image": "https://image.freepik.com/free-vector/logo-sample-text_355-558.jpg",
                       "handler": function (response) {
                    	   
                    	   //when payment is success then redirect to another page
                    	   window.location.href="payment_process.jsp";
                       
	                       		
                       	
                       	
                       	
                           
       					}
                   };
       var rzp1 = new Razorpay(options);
       rzp1.open();
       }
</script> 
</body>

</html>