/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Product;
import model.Supplier;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author congg
 */
public class SupplierDAO {
    public static int numberPage = 10;
    DBContext cn = new DBContext();
    Connection con;
    private PreparedStatement pst;
    private Statement st;
    private Statement st2;
    private ResultSet rs;
    private ResultSet rs2;
    private String query;
    private ArrayList<Supplier> listSup;
    public SupplierDAO() throws SQLException {
        con = null;
        pst = null;
        st = null;
        rs = null;
        st2 = null;
        rs2 = null;
        listSup = new ArrayList<>();
        con = cn.getConnectDB();
        st = con.createStatement();
        st2 = con.createStatement();
    }
    public boolean add(Supplier sup) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("INSERT [dbo].[supplier] ([fullname], [address], [phone], [status]) VALUES (N'"+sup.getFullname()+"', N'"+sup.getAddress()+"', N'"+sup.getPhone()+"', 1)");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public ArrayList<Supplier> loadProduct() {
        listSup = new ArrayList<>();
        query = "SELECT * FROM [dbo].[supplier]";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int pId = rs.getInt("supplierId");
                    String name = rs.getString("fullname");
                    String add = rs.getString("address");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    
                    listSup.add(new Supplier(pId, name, add, phone, status));
                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return listSup;
    }
}