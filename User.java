package model;

/**
 *
 * @author congg
 */
public class User {
    int userId;
    String fullname;
    String address;
    String phone;
    int status;
    int roleId;

    public User() {
    }

    public User(int userId, String fullname, String address, String phone, int status, int roleId) {
        this.userId = userId;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.status = status;
        this.roleId = roleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
    
}
