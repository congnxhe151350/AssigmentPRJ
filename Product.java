/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author congg
 */
public class Product {
    int productId;
    String productName;
    double price;
    int totalkilos;
    String imageUrl;
    int status;

    public Product() {
    }

    public Product(int productId, String productName, double price, int totalkilos, String imageUrl, int status) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.totalkilos = totalkilos;
        this.imageUrl = imageUrl;
        this.status = status;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getTotalkilos() {
        return totalkilos;
    }

    public void setTotalkilos(int totalkilos) {
        this.totalkilos = totalkilos;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
