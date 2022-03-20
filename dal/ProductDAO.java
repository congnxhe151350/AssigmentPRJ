/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Product;
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
public class ProductDAO {
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
    public ProductDAO() throws SQLException {
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
    public ArrayList<Product> loadProduct() {
        products = new ArrayList<>();
        query = "SELECT * FROM product";
        try {
            rs = st.executeQuery(query);
            
                 while (rs.next()) {
                    int pId = rs.getInt("productId");
                    String name = rs.getString("productName");
                    double price = rs.getInt("price");
                    int totalkilos = rs.getInt("totalkilos");
                    String imageUrl = rs.getString("imageUrl");
                    int status = rs.getInt("status");
                    
                    if (status != 0) {
                        products.add(new Product(pId, name, price, totalkilos, imageUrl, status));
                    }

                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return products;
    }
    public Product loadProductById(int id) {
        Product pro = new Product();
        query = "SELECT * FROM product WHERE productId ="+id;
        try {
            rs = st.executeQuery(query);
            
                 if (rs.next()) {
                    int pId = rs.getInt("productId");
                    String name = rs.getString("productName");
                    double price = rs.getInt("price");
                    int totalkilos = rs.getInt("totalkilos");
                    String imageUrl = rs.getString("imageUrl");
                    int status = rs.getInt("status");
                    
                    if (status != 0) {
                        pro = new Product(pId, name, price, totalkilos, imageUrl, status);
                    }

                }
            
        } catch (SQLException ex) {
            System.out.println("Can't load data of list products");//display warning message
        } catch (Exception e) {
            System.out.println("Can't load data of list products");//display warning message
        }
        return pro;
    }
    public String getImage(int pId) throws SQLException {
        String sqlStr2 = "SELECT TOP (1) * FROM [XuatNhapHangHoa].[dbo].[product] WHERE [dbo].[product].productId = " + pId;
        this.st2 = this.con.createStatement();
        rs2 = st2.executeQuery(sqlStr2);
        String a = null;
        while (rs2.next()) {
            a = rs2.getString("imageUrl");
        }
        return a;
    }
    public String getProductNameById(int p) throws SQLException{
         String sqlStr2 = "SELECT TOP (1) * FROM [XuatNhapHangHoa].[dbo].[product] WHERE [dbo].[product].productId = " + p;
        this.st2 = this.con.createStatement();
        rs2 = st2.executeQuery(sqlStr2);
        String a = null;
        while (rs2.next()) {
            a = rs2.getString("productName");
        }
        return a;
    }
    public boolean add(Product product) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("INSERT [dbo].[product] ([productName], [price], [totalkilos], [imageUrl], [status]) VALUES (N'"+product.getProductName()+"', CAST("+product.getPrice()+" AS Decimal(18, 0)), "+product.getTotalkilos()+", N'"+product.getImageUrl()+"', N'1')");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean edit(Product product, int id) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("UPDATE product SET productName = '"+product.getProductName()+"', price= '"+product.getPrice()+"', totalkilos = "+product.getTotalkilos()+", imageUrl = '"+product.getImageUrl()+"' WHERE productId = "+id+";");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean delete(int id) {
        boolean status = false;
        try {
            con =  cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("DELETE product WHERE productId ="+id);
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}
