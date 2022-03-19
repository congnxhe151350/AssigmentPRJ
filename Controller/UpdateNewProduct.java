/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.ProductDAO;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author congg
 */
@WebServlet(name = "UpdateNewProduct", urlPatterns = {"/UpdateNewProduct"})
public class UpdateNewProduct extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String total = request.getParameter("total");
        String imageUrl = request.getParameter("imageUrl");
        int id = Integer.valueOf(request.getParameter("id"));
        ProductDAO product = null;
            try {
                product = new ProductDAO();
            } catch (SQLException ex) {
                Logger.getLogger(AddnewSup.class.getName()).log(Level.SEVERE, null, ex);
            }
        Product pro = new Product(0, productName, Double.valueOf(price), Integer.valueOf(total), imageUrl, 0);
        boolean check = product.edit(pro,id);
            if (check) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("ManagerProduct.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("addnewproduct.jsp");
                dispatcher.forward(request, response);
            }
    }

}
