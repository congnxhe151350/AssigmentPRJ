<%-- 
    Document   : login
    Created on : Jun 22, 2020, 9:54:33 AM
    Author     : DINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DITALO SHOES</title>

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
                        <li><a href="./checkout.jsp">Checkout</a></li>
                        <li><a href="./register.jsp">Register</a></li>
                        <li  class="active"><a href="./login.jsp">Login</a></li>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>Login</h2>
                        <form action="UserLoginServlet" method="POST">
                            <div class="group-input">
                                <label>Username *</label>
                                <input type="text" name="username">
                            </div>
                            <div class="group-input">
                                <label>Password *</label>
                                <input type="password" name="pass">
                            </div>
                            <button type="submit" class="site-btn login-btn">Sign In</button>
                        </form>
                        <script>

                            function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
                                console.log('statusChangeCallback');
                                console.log(response);                   // The current login status of the person.
                                if (response.status === 'connected') {   // Logged into your webpage and Facebook.
                                   
                                    testAPI();
                                } else {                                 // Not logged into your webpage or we are unable to tell.
                                    document.getElementById('status').innerHTML = 'Please log ' +
                                            'into this webpage.';
                                }
                            }


                            function checkLoginState() {               // Called when a person is finished with the Login Button.
                                FB.getLoginStatus(function (response) {   // See the onlogin handler
                                    statusChangeCallback(response);

                                });
                            }


                            window.fbAsyncInit = function () {
                                FB.init({
                                    appId: '{2665531046998908}',
                                    cookie: true, // Enable cookies to allow the server to access the session.
                                    xfbml: true, // Parse social plugins on this webpage.
                                    version: '{api-version}'           // Use this Graph API version for this call.
                                });


                                FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
                                    statusChangeCallback(response);        // Returns the login status.
                                });
                            };

                            function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
                                console.log('Welcome!  Fetching your information.... ');
                                FB.api('/me', function (response) {
                                    console.log('Successful login for: ' + response.name);


                                    document.getElementById('status').innerHTML =
                                            'Thanks for logging in, ' + response.name + '!';
                                });
                            }

                        </script>


                        <!-- The JS SDK Login Button -->
                        
                        <div class="fb-login-button" data-size="small" data-button-type="continue_with" data-layout="rounded" data-auto-logout-link="true" data-use-continue-as="true"  data-width="" ></div>


                        <div id="status">
                        </div>

                        <!-- Load the JS SDK asynchronously -->
                        
                        <div class="switch-login">
                            <a href="./register.jsp" class="or-login">Or Create An Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->



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