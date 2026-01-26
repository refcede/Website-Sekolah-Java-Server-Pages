<%-- File: WebContent/gantiPassword.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ganti Password</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .login-card {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            width: 100%;
            max-width: 450px;
        }
        .login-title {
            color: #0d6efd;
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
            padding: 10px 20px;
            font-weight: 500;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h2 class="login-title">Ganti Password</h2>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                <c:out value="${errorMessage}" />
            </div>
        </c:if>
        
        <form action="GantiPasswordServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="oldPassword" class="form-label">Password Lama</label>
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
            </div>
            <hr>
            <div class="mb-3">
                <label for="newPassword" class="form-label">Password Baru</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Konfirmasi Password Baru</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            </div>
            
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <a href="login.jsp" class="btn btn-outline-secondary">Batal</a>
                <button type="submit" class="btn btn-primary">Ubah Password</button>
            </div>
        </form>
    </div>
</body>
</html>