<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Your Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
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

            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h3>Your Cart</h3>

    <c:if test="${empty items}">
        <div class="alert alert-info">Your cart is empty.</div>
    </c:if>

    <c:if test="${not empty items}">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Subtotal</th>
                <th>Remove</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${items}" var="item">
                <tr>
                    <td>${item.product.name}</td>
                    <td>₹ ${item.product.price}</td>
                    <td>${item.quantity}</td>
                    <td>₹ ${item.product.price * item.quantity}</td>

                    <td>
                        <form method="post" action="/cart/remove">
                            <input type="hidden" name="cartItemId" value="${item.id}"/>
                            <button class="btn btn-danger btn-sm">X</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <h4>Total: ₹ ${total}</h4>
    </c:if>
</div>

</body>
</html>