<%-- 
    Document   : checkout
    Created on : Jun 22, 2020, 9:53:05 AM
    Author     : congg
--%>

<%@page import="dal.ProductDAO"%>
<%@page import="model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ProductDAO pm = new ProductDAO();
    ArrayList<Item> list;
    if(session.getAttribute("cart")!= null){
        list = (ArrayList<Item>) session.getAttribute("cart");
    }else{
        list = new ArrayList<Item>();
    }
    float a = 0;
    %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Store</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style1.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="nav-item">
            <div class="container">
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="./home.jsp">Home</a></li>
                        <li><a href="./shoppingcart.jsp">Shopping Cart</a></li>
                        <li class="active"><a href="./checkout.jsp">Checkout</a></li>
                        <%
                            
                            if(session.getAttribute("username") == null){
                        %>
                        <li><a href="./register.jsp">Register</a></li>
                        <%
                            }
                        %>
                         <%
                            if(session.getAttribute("username") == null){
                        %>
                        <li><a href="./login.jsp">Login</a></li>
                        <%
                            }
                            else{
                        %>
                        <li><a href="./logout.jsp">Logout</a></li>
                        <%
                            }
                        %>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>Check Out</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <%
        if(request.getAttribute("check")!=null){%>
            <center style="color:red;"><%out.println(request.getAttribute("check"));%></center>
            <%}
    %>

    <section class="checkout-section spad">
        <div class="container">
            <form name="form1" action="CheckoutServlet" method="POST"  class="checkout-form">
                <div class="row">
                    <div class="col-lg-6">
                        <h4>Biiling Details</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="fir">Full Name<span>*</span></label>
                                <input type="text" name="fullname" required>
                            </div>
                            
                            <div class="col-lg-12">
                                <label for="street">Address<span>*</span></label>
                                <input type="text" id="street" class="street-first" name="address" required>
                            </div>
                            <div class="col-lg-6">
                                <label for="phone">Phone<span>*</span></label>
                                <input type="text" id="phone" name="phone" required>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-6">
                       
                        <div class="place-order">
                            <h4>Your Order</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>Product <span>Total</span></li>
                                     <%for (Item item : list) {
                                %>
                                    <li class="fw-normal"><%=item.getProductName()%> x <%=item.getQuantity()%> <span><%=item.getPrice()*item.getQuantity()%></span></li>
                                    <%
                                        a+=item.getPrice()*item.getQuantity();
                                        
                                    %>
                                   
                                    
                                    <%}%>
                                    <li class="total-price">Total <span><%=a%></span></li>
                                </ul>
                                <div class="order-btn">
                                    
                                    <button type="submit" class="site-btn place-btn" onclick="return phonenumber(document.form1.phone)">Place Order</button>
                                   
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

        <!-- Footer Section Begin -->
    <footer class="footer-section">
        
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
                        </div>
                        <div class="payment-pic">
                            <img src="img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/jquery.dd.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
<script>
function phonenumber(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.value.match(phoneno))
  {
      return true;
  }
  else
  {
     alert("Not a valid Phone Number(10 number)");
     return false;
  }
  }
</script>
</html>