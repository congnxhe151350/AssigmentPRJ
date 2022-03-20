/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Item;
import model.Order;
import model.Product;
import dal.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author congg
 */
public class OderDAO {
    public static int numberPage = 10;
    DBContext cn = new DBContext();
    Connection con;
    private PreparedStatement pst;
    private Statement st;
    private Statement st2;
    private ResultSet rs;
    private ResultSet rs2;
    private String query;
    private ArrayList<Product> products;
    public OderDAO() throws SQLException {
        con = null;
        pst = null;
        st = null;
        rs = null;
        st2 = null;
        rs2 = null;
        products = new ArrayList<>();
        con = cn.getConnectDB();
        st = con.createStatement();
        st2 = con.createStatement();
    }
    public boolean InsertOrder(int userId, String adress) {
        boolean status = false;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
        LocalDateTime now = LocalDateTime.now();  
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT [dbo].[order] ([userId], [address], [dateBuy], [status]) VALUES ("+userId+", N'"+adress+"', N'"+dtf.format(now)+"', 1)");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean InsertOrderItem(Item item, int orderId) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT [dbo].[orderDetails] ([productId], [price], [quantity], [status], [orderId]) VALUES ("+item.getProductId()+", CAST("+item.getPrice()+" AS Decimal(18, 0)), "+item.getQuantity()+", 1, "+orderId+")");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public int getOrderID() {
        int Id = 0;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT MAX ([orderId]) as maxId  FROM [XuatNhapHangHoa].[dbo].[order]");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Id = rs.getInt("maxId");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Id + 1;
    }
    public ArrayList<Order> getOrders() throws SQLException{
        String sqlStr = "SELECT * FROM [XuatNhapHangHoa].[dbo].[order]";

        st = this.con.createStatement();
        rs = this.st.executeQuery(sqlStr);
        ArrayList<Order> order = new ArrayList<>();

        while (rs.next()) {
            int id = rs.getInt("orderId");
            int cusID = rs.getInt("userId");
            String add = rs.getString("address");
            Date dateBuy = rs.getDate("dateBuy");
            int status = rs.getInt("status");
            if (status != 0) {
                order.add(new Order(id, cusID, add, dateBuy, status));
            }

        }

        return order;
    }
    public String getNameCus(int ID) {
        String name = null;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM [XuatNhapHangHoa].[dbo].[user] WHERE [dbo].[user].[UserID] =" + ID + "");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString("fullname");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return name;
    }
}
