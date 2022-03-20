/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author congg
 */
public class Account {

    DBContext cn = new DBContext();
    Connection con;

    public User Login(String name, String pass) {
        User user = new User();
        try {
            con = cn.getConnectDB();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT [UserID],[password],[roleId] FROM [XuatNhapHangHoa].[dbo].[user] WHERE [user].[username] = '" + name + "' and [user].[password] = '" + pass + "'");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("UserID");
                int role = rs.getInt("roleId");
                user = new User(id, "", "", "", 1, role);
                return user;
            }
            return null;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean Register(String name, String pass) {
        boolean status = false;
        try {
            con = cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement("INSERT [dbo].[user] ([fullname], [address], [phone], [status], [roleId], [username], [password]) VALUES (N'', N'', N'', 1, 2, N'" + name + "', N'" + pass + "')");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean Delete(String ID) {
        boolean status = false;
        try {

            con = cn.getConnectDB();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM admin WHERE admin.adminId = '" + ID + "'");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}
