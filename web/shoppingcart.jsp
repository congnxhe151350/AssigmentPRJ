<%-- 
    Document   : shoppingcart
    Created on : Jun 22, 2020, 9:56:51 AM
    Author     : congg
--%>


<%@page import="dal.ProductDAO"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Cart obj = new Cart();
    double total = 0;
    ProductDAO pm = new ProductDAO();
    ArrayList<Item> list;
    if(session.getAttribute("cart")!= null){
        list = (ArrayList<Item>) session.getAttribute("cart");
    }else{
        list = new ArrayList<Item>();
    }

%>

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
                        <li class="active"><a href="./shoppingcart.jsp">Shopping Cart</a></li>
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
                        <a href="./home.jsp"><i class="fa fa-home"></i> Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            
            <div class="row">
                <div class="col-lg-12">

                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                 <%
                                if(!list.isEmpty() || list.size()>0){
                                for (Item item : list) {
                                %>
                            <td class="cart-pic"><img src="images/<%=pm.getImage(item.getProductId())%>.jpg" alt=""></td>
                            <td class="cart-title first-row">
                                <h5><%=item.getProductName()%></h5>
                            </td>
                            <td class="p-price first-row"><%=item.getPrice()%></td>
                            <td class="qua-col first-row">
                                <div class="quantity">
                                    <form action="CartUpdate" method="POST">
                                    <div >
                                        <input hidden="" name="ID" value="<%=item.getProductId()%>">
                                        <input type="number"  min="1"  name="quantity" value="<%=item.getQuantity()%>" >
                                        <button type="submit" ><i class="ti-check"></i></button>
                                    </div>
                                    </form>
                                </div>
                            </td>
                            <td class="total-price first-row"><%=item.getPrice() * item.getQuantity()%></td>
                            <%
                                total += item.getPrice()*item.getQuantity();
                                
                            %>
                            <td class="close-td first-row">
                                <form action="CartDelete" method="POST">
                                <input hidden="" name="ID" value="<%=item.getProductId()%>">
                                <button type="submit" class="close-td first-row"><i class="ti-close"></i></button>
                                </form>
                            </td>
                            </tr>
                            <%}%>
                            <%
                                    }else{
                                    %>
                            <td class="total-price first-row">Cart is empty</td>
                            <%
}
                                %>
                            </tbody>
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="cart-total">Total <span><%=total%></span></li>
                                </ul>
                                <a href="checkout.jsp" class="proceed-btn">PROCEED TO CHECK OUT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                
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

</html>