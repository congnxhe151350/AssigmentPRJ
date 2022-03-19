/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.Account;
import dal.SupplierDAO;
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
@WebServlet(name = "AddnewSup", urlPatterns = {"/AddnewSup"})
public class AddnewSup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        SupplierDAO supDAO = null;
            try {
                supDAO = new SupplierDAO();
            } catch (SQLException ex) {
                Logger.getLogger(AddnewSup.class.getName()).log(Level.SEVERE, null, ex);
            }
        Supplier sup = new Supplier(0, username, address, phone, 0);
        boolean check = supDAO.add(sup);
            if (check) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("supplier.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("addnewsupplier.jsp");
                dispatcher.forward(request, response);
            }
    }

}
