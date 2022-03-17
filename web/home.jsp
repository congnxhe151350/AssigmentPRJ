<%-- 
    Document   : shop
    Created on : Jun 22, 2020, 9:56:24 AM
    Author     : congg
--%>

<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ProductDAO pm = new ProductDAO();
    ArrayList<Product> list = pm.loadProduct();
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
                        <li class="active"><a href="./home.jsp">Home</a></li>
                        <li><a href="./shoppingcart.jsp">Shopping Cart</a></li>
                        <li><a href="./checkout.jsp">Checkout</a></li>
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
                    <div class="breadcrumb-text">
                        <a href="home.jsp"><i class="fa fa-home"></i> Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-20 order-5 order-lg-9">
                    <div class="product-show-option">
                    </div>
                    
                    <div class="product-list">
                        
                        <div class="row">
                            <%
                                for (int i = 0; i < list.size(); i++) {
                        %>
                  <form action="CartServlet" method="POST">
                            
                            <input hidden="" name="productId" value="<%=list.get(i).getProductId()%>">
                            <input hidden="" name="productName" value="<%=list.get(i).getProductName()%>">
                           <input hidden="" name="price" value="<%=list.get(i).getPrice()%>">
                            <div class="col-lg-12 col-sm-9">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <img src="images/<%=list.get(i).getImageUrl()%>.jpg" alt="">
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <a>
                                            <h5><%=list.get(i).getProductName()%></h5>
                                        </a>
                                        <div class="product-price">
                                             <%=list.get(i).getPrice()%>
                                        </div>
                                        <div class="product-price">
                                            <input type="submit" value="Add to cart">
                                        </div>
                                    </div>
                                </div>
                                        
                            </div>
                            
                           </form>
                                         <%}%>
                            
                        </div>
                                        
                    </div>
                
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->
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

</html>