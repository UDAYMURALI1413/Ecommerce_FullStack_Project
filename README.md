# 🛒 E-Commerce Web Application (Spring Boot)

A full-stack <b>"E-Commerce web application"</b> built using Spring Boot, Spring Security, JSP, and MySQL.  
This project focuses on backend fundamentals like authentication, authorization, cart handling, and order processing, along with a clean and responsive UI.

---

## 📌 Project Overview

This application allows users to browse products, search items, add them to a cart, and place orders securely.  
Authentication and authorization are handled using Spring Security, and data is persisted using MySQL with Spring Data JPA.

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

## 📸 Screenshots

### 🏠 Home Page
Displays all available products with search functionality.

<img width="1917" height="1008" alt="home png" src="https://github.com/user-attachments/assets/7797b432-ed4f-4c69-958e-12236f2828de" />
<img width="1916" height="874" alt="home2" src="https://github.com/user-attachments/assets/654ed283-83ec-4493-a371-561429a57a92" />


### 🔍 Product Search
Search products by name using the navbar search bar.

<img width="1919" height="948" alt="search" src="https://github.com/user-attachments/assets/5cd2e9b1-38e8-4902-8167-113baaa8c955" />


### 🛒 Cart Page
User-specific cart showing selected products and total price.

<img width="1919" height="936" alt="cart png" src="https://github.com/user-attachments/assets/689e7109-fdae-4dfc-8db7-49db3c9bf486" />

### 📦 Checkout Page
Checkout page with order summary and shipping address.

<img width="1915" height="940" alt="checkout png" src="https://github.com/user-attachments/assets/6918ea09-4b24-4d76-83fa-5b49e653c2a6" />


### ✅ Order Confirmation
Order confirmation page after successful checkout.

<img width="1919" height="952" alt="order-confirm png" src="https://github.com/user-attachments/assets/16abf164-04e8-41f9-adf9-aaeca4dee0b5" />


### Admin Access

From here admin can 
- CREATE (ADD)
- READ
- UPDATE
- DELETE
and modify the products.
<img width="1919" height="945" alt="admin-access" src="https://github.com/user-attachments/assets/065d3da3-0cd4-4cbc-bb7c-ea05112cca12" />
<img width="1919" height="944" alt="product (1)" src="https://github.com/user-attachments/assets/0cca5f60-42cf-434b-bcbe-7329a0f43860" />


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


