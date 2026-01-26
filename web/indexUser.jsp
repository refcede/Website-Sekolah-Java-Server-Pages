<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manajemen Pengguna</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.table thead{background-color:#e9ecef;color:#495057;border-color:#dee2e6}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
    </style>
</head>
<body>
<div class="container">
    
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="page-title">Manajemen Pengguna</h2>
        <div>
            <a href="AdminDashboardServlet" class="btn btn-outline-secondary">Kembali ke Dasbor</a>
            <a href="LogoutServlet" class="btn btn-outline-danger">Logout</a>
        </div>
    </div>
    
    <div class="content-card">
        <a href="UserServlet?action=new" class="btn btn-primary mb-4">
            Tambah Pengguna Baru
        </a>
        
        <table class="table table-hover align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Nama Lengkap</th>
                    <th>Role</th>
                    <th>Terhubung Siswa (ID)</th>
                    <th class="text-end">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${listUsers}">
                    <tr>
                        <td><c:out value="${user.id}" /></td>
                        <td><c:out value="${user.username}" /></td>
                        <td><c:out value="${user.namaLengkap}" /></td>
                        <td>
                            <span class="badge ${user.role == 'admin' ? 'bg-danger' : (user.role == 'guru' ? 'bg-warning text-dark' : 'bg-info text-dark')}">
                                <c:out value="${user.role}" />
                            </span>
                        </td>
                        <td>
                            <c:if test="${user.idSiswa != 0}">
                                <span class="badge bg-light text-dark border">ID: <c:out value="${user.idSiswa}" /></span>
                            </c:if>
                            <c:if test="${user.idSiswa == 0}">-</c:if>
                        </td>
                        <td class="text-end">
                            <a href="UserServlet?action=edit&id=<c:out value='${user.id}'/>" 
                               class="btn btn-sm btn-outline-primary">Edit</a>
                               
                            <c:if test="${sessionScope.authUser.id != user.id}">
                                <a href="UserServlet?action=delete&id=<c:out value='${user.id}'/>" 
                                   class="btn btn-sm btn-outline-danger ms-2" 
                                   onclick="return confirm('Yakin ingin menghapus user ini?')">Hapus</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty listUsers}">
                    <tr><td colspan="6" class="text-center text-muted p-4">Belum ada data pengguna.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>