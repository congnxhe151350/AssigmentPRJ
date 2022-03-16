<%-- 
    Document   : logout.jsp
    Created on : Mar 9, 2022, 2:18:15 PM
    Author     : DINHTT
--%>

<%
session.removeAttribute("username");
session.removeAttribute("cart");
response.sendRedirect("login.jsp");
%>
