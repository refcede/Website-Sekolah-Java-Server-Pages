<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Pengumuman</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <h2 class="page-title">
                <c:if test="${pengumuman != null}">Edit Pengumuman</c:if>
                <c:if test="${pengumuman == null}">Tambah Pengumuman Baru</c:if>
            </h2>
            <div class="content-card">
                <form action="PengumumanServlet" method="post">
                    <input type="hidden" name="action" value="${pengumuman != null ? 'update' : 'insert'}" />
                    <c:if test="${pengumuman != null}">
                        <input type="hidden" name="id" value="${pengumuman.id}" />
                    </c:if>
                    
                    <div class="mb-3">
                        <label for="judul" class="form-label">Judul Pengumuman:</label>
                        <input type="text" class="form-control" id="judul" name="judul" value="<c:out value='${pengumuman.judul}'/>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="isi" class="form-label">Isi Pengumuman:</label>
                        <textarea class="form-control" id="isi" name="isi" rows="10" required><c:out value='${pengumuman.isi}'/></textarea>
                    </div>
                    
                    <hr class="my-4">
                    
                    <div class="d-flex justify-content-end">
                        <a href="PengumumanServlet" class="btn btn-outline-secondary me-2">Batal</a>
                        <button type="submit" class="btn btn-primary">Simpan Pengumuman</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>