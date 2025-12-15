<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Form</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2>Product Form</h2>

    <form method="post" action="/admin/products/save">
        <input type="hidden" name="id" value="${product.id}"/>

        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name" value="${product.name}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description" rows="3" required>${product.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Price (₹)</label>
            <input type="number" step="0.01" class="form-control" name="price" value="${product.price}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Image URL</label>
            <input type="text" class="form-control" name="imageUrl" value="${product.imageUrl}">
        </div>

        <div class="mb-3">
            <label class="form-label">Stock Quantity</label>
            <input type="number" class="form-control" name="stock"
                   value="${product.stock}" min="0" required>
        </div>


        <button type="submit" class="btn btn-primary">Save</button>
        <a href="/admin/products" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
