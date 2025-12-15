package com.example.ecommerce.model;

import jakarta.persistence.*;

@Entity
public class CartItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Many items → One product
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private int quantity;

    // NEW: Cart belongs to a user
    @ManyToOne
    @JoinColumn(name = "user_id")
    private AppUser user;

    public CartItem() {}

    public CartItem(Product product, int quantity, AppUser user) {
        this.product = product;
        this.quantity = quantity;
        this.user = user;
    }

    // ---------- GETTERS & SETTERS ----------
    public Long getId() { return id; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public AppUser getUser() { return user; }
    public void setUser(AppUser user) { this.user = user; }
}