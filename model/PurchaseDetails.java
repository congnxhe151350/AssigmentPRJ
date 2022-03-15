/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author congg
 */
public class PurchaseDetails {
    int detailsPurchaseId;
    int productId;
    int purchaseId;
    int quantity;
    double price;
    int status;

    public PurchaseDetails() {
    }

    public PurchaseDetails(int detailsPurchaseId, int productId, int purchaseId, int quantity, double price, int status) {
        this.detailsPurchaseId = detailsPurchaseId;
        this.productId = productId;
        this.purchaseId = purchaseId;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
    }

    public int getDetailsPurchaseId() {
        return detailsPurchaseId;
    }

    public void setDetailsPurchaseId(int detailsPurchaseId) {
        this.detailsPurchaseId = detailsPurchaseId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(int purchaseId) {
        this.purchaseId = purchaseId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
