/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import model.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author congg
 */
@WebServlet(name = "CartUpdate", urlPatterns = {"/CartUpdate"})
public class CartUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int Id = Integer.valueOf(request.getParameter("ID"));
        
        int quantity = Integer.valueOf(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        ArrayList<Item> objCartBean = (ArrayList<Item>) session.getAttribute("cart");
        for (int i = 0; i < objCartBean.size(); i++) {
            if (Id==objCartBean.get(i).getProductId()) {
                Item item = new Item();
                item.setProductId(Id);
                item.setPrice(objCartBean.get(i).getPrice());
                item.setProductName(objCartBean.get(i).getProductName());
                item.setQuantity(quantity);
                objCartBean.set(i,item);
            }
        }
        response.sendRedirect("shoppingcart.jsp");
    }
}