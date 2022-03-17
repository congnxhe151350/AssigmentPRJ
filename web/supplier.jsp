<%-- 
    Document   : supplier
    Created on : Mar 9, 2022, 8:52:30 PM
    Author     : congg
--%>

<%@page import="model.Supplier"%>
<%@page import="dal.SupplierDAO"%>
<<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("usernameAdmin")==null) {
        response.sendRedirect("loginAdmin.jsp");
        }else{
    SupplierDAO pm = new SupplierDAO();
    
    ArrayList<Supplier> list = pm.loadProduct();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supplier</title>
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
                background-image: url("images/BGg.png");
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
                <h2 style="text-align: center; color: white;font-size: 50px" class="hihi">PRODUCTS</h2>       
                <h3 style="text-align: center; color: white;font-size: 40px" class="hihi">(Total product have : <%= list.size()%>)</h3>
            </div>
           
            <br>
            <div>
                <a href="addnewsuplier.jsp">ADD NEW</a>
                <table class="table table-bordered table-hover" >
                    <thead>
                    <tr style="background: #4d72de">
                        <th>STT</th>
                        <th>Supplier ID</th>
                        <th>Supplier Name</th>
                        <th>Supplier Phone</th>
                        <th>Supplier Address</th>
                        <th>Supplier Status</th>
                        
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            String status;
                            for (int i = 0 ; i < list.size(); i++) {
                                status = list.get(i).getStatus() != 1 ? "<span class='glyphicon glyphicon-remove-circle text-danger'></span>"
                                        : "<span class='glyphicon glyphicon-ok-circle text-success'></span>";
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=list.get(i).getSupplierId()%></td>
                            <td><%=list.get(i).getFullname()%></td>                  
                            <td><%=list.get(i).getPhone()%></td>
                            <td><%=list.get(i).getAddress()%></td>
                            <td><%=status%></td>
                            
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
