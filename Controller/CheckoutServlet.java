/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import dal.OderDAO;
import model.Item;
import model.Order;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null || session.getAttribute("userId") == null){
            request.setAttribute("check", "Please login to check out");
            RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
            dispatcher.forward(request, response);
        }else{
            if(session.getAttribute("cart") == null){
                request.setAttribute("check", "Please select item to buy");
                RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                dispatcher.forward(request, response);
            }else{
                OderDAO obj = null;
                try {
                    obj = new OderDAO();
                } catch (SQLException ex) {
                    Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                String fullname = request.getParameter("fullname");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String userId = session.getAttribute("userId").toString();

                ArrayList<Item> objCartBean = (ArrayList<Item>) session.getAttribute("cart");
                if(objCartBean.size() <=0){
                    request.setAttribute("check", "Please select item to buy");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                    dispatcher.forward(request, response);
                }else{
                    obj.InsertOrder(Integer.valueOf(userId), address);
                    for (int i = 0; i < objCartBean.size(); i++) {
                        obj.InsertOrderItem(objCartBean.get(i), obj.getOrderID());
                    }

                    request.setAttribute("check", "Thank you for your Order!!! See you later");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
                    dispatcher.forward(request, response);
                }
                
            }
            }
            
    }
}
