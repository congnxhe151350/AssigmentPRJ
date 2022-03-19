/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.ProductDAO;
import dal.SupplierDAO;
import model.Product;
import model.Supplier;
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
@WebServlet(name = "AddNewProduct", urlPatterns = {"/AddNewProduct"})
public class AddNewProduct extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String total = request.getParameter("total");
        String imageUrl = request.getParameter("imageUrl");
        ProductDAO product = null;
            try {
                product = new ProductDAO();
            } catch (SQLException ex) {
                Logger.getLogger(AddnewSup.class.getName()).log(Level.SEVERE, null, ex);
            }
        Product pro = new Product(0, productName, Double.valueOf(price), Integer.valueOf(total), imageUrl, 0);
        boolean check = product.add(pro);
            if (check) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("ManagerProduct.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("addnewproduct.jsp");
                dispatcher.forward(request, response);
            }
    }

}
