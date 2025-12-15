# 🛒 E-Commerce Web Application (Spring Boot)

A full-stack *E-Commerce web application* built using *Spring Boot, **Spring Security, **JSP, and **MySQL*.  
This project focuses on backend fundamentals like authentication, authorization, cart handling, and order processing, along with a clean and responsive UI.

---

## 📌 Project Overview

This application allows users to browse products, search items, add them to a cart, and place orders securely.  
Authentication and authorization are handled using *Spring Security, and data is persisted using **MySQL* with *Spring Data JPA*.

---

## ✨ Features

### 👤 User Authentication & Authorization
- User registration and login
- Secure password encryption using *BCrypt*
- Role-based access control (USER / ADMIN)
- Default Spring Security login page

### 🏠 Home & Product Management
- View all products on the home page
- Search products by name (case-insensitive)
- Product details include name, price, stock, description, and image
- Out-of-stock product handling

### 🔍 Search Functionality
- Search products directly from the navbar
- Dynamic filtering based on product name
- Displays all products when search input is empty

### 🛒 Cart Management
- User-specific cart
- Add products to cart with quantity selection
- View cart items and total price
- Cart accessible only to logged-in users

### 📦 Checkout & Orders
- Checkout page with order summary
- Shipping address input
- Place order functionality
- Order confirmation page after successful checkout
- Cart cleared after placing an order

### 🔐 Security
- Spring Security–based authentication
- Public access to home and registration pages
- Protected routes for cart and checkout
- Secure session handling

---

## 🛠 Tech Stack

### Backend
- Java
- Spring Boot
- Spring MVC
- Spring Security
- Spring Data JPA (Hibernate)

### Frontend
- JSP
- JSTL
- HTML
- CSS
- Bootstrap

### Database
- MySQL

### Tools
- Maven
- IntelliJ IDEA
- Git & GitHub

---

## 🗄 Database Configuration

The application uses *MySQL* as the primary database.

Example configuration (application.properties):

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/ecommerceDb
spring.datasource.username=your_username
spring.datasource.password=your_password

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect



## 📸 Screenshots

### 🏠 Home Page
Displays all available products with search functionality.
![Home Page](screenshots/home.png)

### 🛒 Cart Page
User-specific cart showing selected products and total price.
![Cart](screenshots/cart.png)

### 📦 Checkout Page
Checkout page with order summary and shipping address.
![Checkout](screenshots/checkout.png)

### ✅ Order Confirmation
Order confirmation page after successful checkout.
![Order Confirmation](screenshots/order-confirm.png)
