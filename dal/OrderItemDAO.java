/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;


import model.Item;
import dal.DBContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author congg
 */
public class OrderItemDAO {

    DBContext cn = new DBContext();
    Connection con;
    public ArrayList<Item> getOrderItem(int ID) {
        ArrayList<Item> list = new ArrayList<>();
        try {
           con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM orderDetails WHERE orderDetails.orderId = '" + ID + "'");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int orderDetailsId = rs.getInt("orderDetailsId");
                int productId = rs.getInt("productId");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int orderId = rs.getInt("orderId");
                
                list.add(new Item(productId, orderId, price, quantity));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

}
