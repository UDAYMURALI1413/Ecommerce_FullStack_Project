<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 400px;">
    <h3 class="mb-3 text-center">Login</h3>

    <c:if test="${param.error != null}">
        <div class="alert alert-danger">Invalid username or password</div>
    </c:if>

    <c:if test="${param.registered != null}">
        <div class="alert alert-success">Registration successful. Please login.</div>
    </c:if>

    <form method="post" action="/login">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input class="form-control" name="username" required/>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input class="form-control" type="password" name="password" required/>
        </div>

        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <div class="mt-3 text-center">
        <a href="/register">Register as new user</a>
    </div>
</div>
</body>
</html>
