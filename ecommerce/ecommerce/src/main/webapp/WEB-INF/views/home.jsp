<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
    <title>E-Shop - Home</title>
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"/>

    <style>
        body {
            background-color: #f5f5f5;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .product-card {
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            background-color: #ffffff;
        }
        .product-img {

            height: 200px;
            width: 100%;
            object-fit: contain;
            background-color: #ffffff;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">E-Shop</a>

        <!-- mobile toggle button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <!-- Search bar (left side) -->
            <form class="d-flex me-auto" action="/" method="get">
                <input class="form-control me-2" type="search" name="keyword"
                       placeholder="Search products" value="${keyword}">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>

            <!-- Right side links -->
            <ul class="navbar-nav ms-auto align-items-center">

                <!-- Cart link: visible for everyone -->
                <li class="nav-item">
                    <a class="nav-link" href="/cart">Cart</a>
                </li>

                <!-- Admin link: only for ADMIN role -->
                <sec:authorize access="hasRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/products">Admin</a>
                    </li>
                </sec:authorize>

                <!-- Logged-in user info + Logout -->
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <span class="navbar-text mx-2">
                            Hello, ${pageContext.request.userPrincipal.name}
                        </span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                </sec:authorize>

                <!-- If NOT logged in: Login/Register -->
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register">Register</a>
                    </li>
                </sec:authorize>

            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">


        <c:if test="${param.outOfStock == 'true'}">
            <div class="alert alert-danger">
                Not enough stock for that product.
            </div>
        </c:if>

        <c:forEach var="product" items="${products}">
            <div class="col-md-4 mb-4">
                <div class="card product-card">
                    <img src="${product.imageUrl}" class="card-img-top product-img" alt="${product.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.description}</p>
                        <h6 class="text-success">₹ ${product.price}</h6>

                        <p class="text-muted">Available: ${product.stock}</p>

                        <c:choose>
                            <c:when test="${product.stock <= 0}">
                                <span class="badge bg-danger">Out of stock</span>
                            </c:when>
                            <c:otherwise>
                                <form method="post" action="/cart/add">
                                    <input type="hidden" name="productId" value="${product.id}"/>

                                    <select name="quantity" class="form-select" style="width:80px;">
                                        <c:forEach var="i" begin="1" end="${product.stock}">
                                            <option value="${i}">${i}</option>
                                        </c:forEach>
                                    </select>

                                    <button type="submit" class="btn btn-primary mt-2">Add to cart</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
