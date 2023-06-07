<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <!-- header start -->
     
       <%@ include file = "afterheader.jsp" %>
		
        <div class="cart-main-area ptb-100">
            <div class="container">
                <h3 class="page-title">Your cart items</h3>
                <!-- <div class="col-lg-4 col-md-12">
                    
                                <div class="grand-totall">
                                    <a href="order.php">Add to fav</a>
                                </div>
                            </div> -->
                <hr>    
                <div class="row">
                   
                        
                  
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                   
                        <form action="#">
                            <div class="table-content table-responsive">
                               
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>property Name</th>
                                            <th>addess</th>
                                            <th>RENT</th>
                                            <th>Delete</th>
                                            <th>CONFORM</th>    
                                         
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                       
                                        <tr>
                                            <td class="product-thumbnail">
                                                <a href="#"><img alt="" src="<?php echo $p[5];?>" width="200px"></a>
                                            </td>
                                            <td class="product-name"><?php echo $p[1]; ?></td>
                                            <td class="product-price"><?php echo $p[2]; ?></td>
                                            <!-- <?php
                                                $_SESSION['pprice']=$p[2];
                                            ?> -->
                                            
                                            <!-- <td class="product-quantity">
                                                <div class="pro-dec-cart">
                                                    <input class="cart-plus-minus-box" type="text" value="1" name="qtybutton">
                                                </div>
                                            </td> -->
                                            <td class="product-total"><?php echo $p[4]; ?></td>
                                            <td class="product-remove">
                                                
                                                
                                                <a class="btn btn-danger" href="delete_cart.php?pid=<?php echo $p[0]; ?>"><i class="fa fa-times">Delete</i></a>
                                           </td>
                                           
                                           <td class="product-buynow">
                                                
                                                
                                                <a class="btn btn-success" href="conform.php?pid=<?php echo $p[0]; ?>">CONFORM</i></a>
                                           </td>
                                        </tr>
                                        
                                       
                                    </tbody>
                                   
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="cart-shiping-update-wrapper">
                                        <div class="cart-shiping-update">
                                            <a href="shop_product.php">Continue Searching</a>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </form>
                          
                    </div>
                </div>
            </div>
        </div>
       

</body>
</html>