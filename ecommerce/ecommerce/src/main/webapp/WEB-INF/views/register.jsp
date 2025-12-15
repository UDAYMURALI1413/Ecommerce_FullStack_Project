<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 400px;">
    <h3 class="mb-3 text-center">Register</h3>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form method="post" action="/register">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input class="form-control" name="username" value="${user.username}" required/>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input class="form-control" type="password" name="password" required/>
        </div>

        <button type="submit" class="btn btn-success w-100">Register</button>
    </form>

    <div class="mt-3 text-center">
        <a href="/login">Back to login</a>
    </div>
</div>
</body>
</html>
