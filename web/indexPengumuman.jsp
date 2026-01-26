<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manajemen Pengumuman</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.table thead{background-color:#e9ecef;color:#495057;border-color:#dee2e6}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
    </style>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="page-title">Manajemen Pengumuman</h2>
        <div>
            <a href="AdminDashboardServlet" class="btn btn-outline-secondary">Kembali ke Dasbor</a>
            <a href="LogoutServlet" class="btn btn-outline-danger">Logout</a>
        </div>
    </div>
    <div class="content-card">
        <a href="PengumumanServlet?action=new" class="btn btn-primary mb-4">Tambah Pengumuman Baru</a>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Tanggal</th>
                    <th>Judul</th>
                    <th class="text-end">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${listPengumuman}">
                    <tr>
                        <td><fmt:formatDate value="${p.tanggalPost}" pattern="dd MMMM yyyy HH:mm"/></td>
                        <td><c:out value="${p.judul}"/></td>
                        <td class="text-end">
                            <a href="PengumumanServlet?action=edit&id=${p.id}" class="btn btn-sm btn-outline-primary">Edit</a>
                            <a href="PengumumanServlet?action=delete&id=${p.id}" class="btn btn-sm btn-outline-danger ms-2" onclick="return confirm('Hapus pengumuman ini?')">Hapus</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listPengumuman}">
                    <tr><td colspan="3" class="text-center text-muted">Belum ada pengumuman.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>