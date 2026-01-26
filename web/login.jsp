<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Manajemen Siswa</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
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
            border-radius: 15px; /* Sedikit lebih bulat */
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08); /* Bayangan lebih halus */
            width: 100%;
            max-width: 420px;
        }
        .login-title {
            color: #0d6efd;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-align: center;
        }
        .login-subtitle {
            text-align: center;
            color: #6c757d;
            margin-bottom: 2rem;
            font-size: 0.9rem;
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
            padding: 12px 20px;
            font-weight: 600;
            border-radius: 8px;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        /* Style untuk Input Group agar menyatu rapi */
        .input-group-text {
            background-color: #f8f9fa;
            border-right: none;
        }
        .form-control {
            border-left: none;
        }
        /* Fokus pada input membuat ikon ikut berwarna (opsional, efek visual) */
        .form-control:focus {
            box-shadow: none;
            border-color: #dee2e6; 
        }
        .input-group:focus-within {
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            border-radius: 0.375rem;
        }
        .input-group:focus-within .form-control, 
        .input-group:focus-within .input-group-text {
            border-color: #86b7fe;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="text-center mb-3">
            <img src="https://i.postimg.cc/8kyYZDJ9/1762972172485.png" 
                 alt="Logo Tut Wuri Handayani" 
                 style="width: 150px; height: auto;">
        </div>

        <h2 class="login-title">Selamat Datang</h2>
        <p class="login-subtitle">Silakan login ke Sistem Manajemen Siswa</p>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                <div><c:out value="${errorMessage}" /></div>
            </div>
        </c:if>
        
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i>
                <div><c:out value="${sessionScope.successMessage}" /></div>
            </div>
            <c:remove var="successMessage" scope="session" />
        </c:if>
        
        <form action="LoginServlet" method="post">
            
            <div class="mb-3">
                <label class="form-label visually-hidden" for="username">Username</label>
                <div class="input-group">
                    <span class="input-group-text text-muted"><i class="bi bi-person-fill"></i></span>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label visually-hidden" for="password">Password</label>
                <div class="input-group">
                    <span class="input-group-text text-muted"><i class="bi bi-lock-fill"></i></span>
                    
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                    
                    <button class="btn btn-outline-secondary" type="button" id="togglePassword" style="border-left: none; border-color: #dee2e6;">
                        <i class="bi bi-eye-slash" id="eyeIcon"></i>
                    </button>
                </div>
            </div>
            
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login Masuk</button>
            </div>
            
            <div class="text-center mt-4">
                <a href="GantiPasswordServlet" class="text-decoration-none small">Lupa atau ingin ganti password?</a>
            </div>

        </form>
    </div>

    <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        const eyeIcon = document.querySelector('#eyeIcon');

        togglePassword.addEventListener('click', function (e) {
            // 1. Toggle tipe input antara 'password' dan 'text'
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            
            // 2. Toggle ikon mata (buka/tutup)
            if (type === 'password') {
                eyeIcon.classList.remove('bi-eye');
                eyeIcon.classList.add('bi-eye-slash'); // Mata tertutup
            } else {
                eyeIcon.classList.remove('bi-eye-slash');
                eyeIcon.classList.add('bi-eye'); // Mata terbuka
            }
        });
    </script>

</body>
</html>