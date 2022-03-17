<%-- 
    Document   : Orderlist
    Created on : Jul 19, 2020, 1:40:52 PM
    Author     : congg
--%>



<%@page import="model.Order"%>
<%@page import="dal.OderDAO"%>
<%@page import="dal.OrderItemDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
   if (session.getAttribute("usernameAdmin")==null) {
        response.sendRedirect("loginAdmin.jsp");
        }else{


    OderDAO order = new OderDAO();
    ArrayList<Order> list = order.getOrders();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Order List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <style>
            .img{
                width: 64px;
                height: 64px;
            }
            @-webkit-keyframes example {
                0%   {color: #1CDCE2FF;}
                25%  {color: #EDDB11FF;}
                50%  {color: #CB0FEFFF;}
                100% {color: green;}
            }
            @-webkit-keyframes exampleq {
                0%   {background-color: #1CDCE2FF;}
                25%  {background-color: #EDDB11FF;}
                50%  {background-color: #CB0FEFFF;}
                100% {background-color: green;}
            }
            .hihi{
                display: block;
                font-size: 30px;
                font-weight: 700;
                letter-spacing: 18px;
            }
        </style>
        <style>
            .img{
                width: 64px;
                height: 64px;
            }
            body{
                background-color: #f8f9fc;
            }
            .abc{
                background-image: url("images/BGA.jpg")
            }
        </style>
    </head>
    <body>

        <div class="container">  
            <button type="button" class="btn btn-default  btn-primary" 
                    onclick="location.href = 'dashboard.jsp'">
                <span class="glyphicon glyphicon-menu-left"></span> Back
            </button>
            <div class="abc">
                <h2 style="text-align: center; color: white;font-size: 50px" class="hihi">ORDER LIST</h2>       
                <h3 style="text-align: center; color: white;font-size: 40px" class="hihi"></h3>
            </div>

            <br>
            <div>
                <table class="table table-bordered table-hover" >
                    <thead>
                        <tr style="background: #4d72de">
                            <th>STT</th>
                            <th>Order ID</th>
                            <th>Full name</th>
                            <th>Address</th>
                            <th>DateBuy</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i = 0;
                            for (Order acc : list) {
                            i++;
                        %>
                        <tr>
                            <td><%=i%></td>      
                            <td><%=acc.getOrderId()%></td>
                            <td><%=order.getNameCus(acc.getUserId())%></td>                         
                            <td><%=acc.getAddress()%></td>
                            <td><%=acc.getDateBuy()%></td>
                            
                            <td>
                                <button onclick="window.location.href = 'orderview.jsp?orderID=<%=acc.getOrderId()%>'" class="btn btn-default btn-sm btn-danger">
                                    <span class="glyphicon glyphicon-plus"></span> 
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
<%}%>
