<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bahan Ajar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>body{background-color:#f8f9fa; padding:20px;}.card{border:none;box-shadow:0 5px 15px rgba(0,0,0,0.05);}</style>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
       <h3>
    <i class="bi bi-journal-text text-primary me-2"></i> Materi Bahan Ajar
</h3>
        <a href="AdminDashboardServlet" class="btn btn-outline-secondary">Kembali ke Dasbor</a>
    </div>

    <div class="card p-4">
        <div class="mb-3">
            <a href="MateriServlet?action=new" class="btn btn-primary">
                <i class="bi bi-cloud-upload"></i> Upload Materi Baru
            </a>
        </div>
        
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>Judul</th>
                    <th>Pertemuan</th>
                    <th>Kelas/Mapel</th>
                    <th>Pengupload</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="m" items="${listMateri}">
                    <tr>
                        <td>
                            <i class="bi bi-file-earmark-text text-primary me-2"></i>
                            <strong><c:out value="${m.judul}"/></strong>
                        </td>
                        <td><span class="badge bg-info text-dark">Ke-<c:out value="${m.pertemuanKe}"/></span></td>
                        <td>
                            <small class="d-block text-muted"><c:out value="${m.namaKelas}"/></small>
                            <small class="fw-bold"><c:out value="${m.namaMapel}"/></small>
                        </td>
                        <td><c:out value="${m.namaGuru}"/></td>
                        <td>
                            <a href="bahan_ajar/<c:out value='${m.namaFile}'/>" target="_blank" class="btn btn-sm btn-success">
                                <i class="bi bi-download"></i>
                            </a>
                            <a href="MateriServlet?action=delete&id=${m.id}" class="btn btn-sm btn-danger" onclick="return confirm('Hapus materi ini?')">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listMateri}">
                    <tr><td colspan="5" class="text-center p-4 text-muted">Belum ada materi yang diupload.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</body></html>