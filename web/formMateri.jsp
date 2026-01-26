<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Materi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#f8f9fa; display:flex; align-items:center; justify-content:center; min-height:100vh;">

<div class="card shadow" style="width: 100%; max-width: 600px;">
    <div class="card-header bg-primary text-white">
        <h5 class="mb-0">Upload Materi Bahan Ajar</h5>
    </div>
    <div class="card-body p-4">
        <form action="MateriServlet" method="post" enctype="multipart/form-data">
            
            <div class="mb-3">
                <label class="form-label">Judul Materi:</label>
                <input type="text" name="judul" class="form-control" placeholder="Contoh: Pengenalan Algoritma" required>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Kelas:</label>
                    <select name="idKelas" class="form-select" required>
                        <option value="">- Pilih Kelas -</option>
                        <c:forEach var="k" items="${listKelas}">
                            <option value="${k.idKelas}">${k.namaKelas}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Mata Pelajaran:</label>
                    <select name="idMapel" class="form-select" required>
                        <option value="">- Pilih Mapel -</option>
                        <c:forEach var="m" items="${listMapel}">
                            <option value="${m.idMapel}">${m.namaMapel}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4 mb-3">
                    <label class="form-label">Pertemuan Ke:</label>
                    <input type="number" name="pertemuanKe" class="form-control" min="1" value="1" required>
                </div>
                <div class="col-md-8 mb-3">
                    <label class="form-label">File (PDF/DOCX/PPT):</label>
                    <input type="file" name="fileMateri" class="form-control" required>
                </div>
            </div>
            
            <div class="d-flex justify-content-end mt-3">
                <a href="MateriServlet" class="btn btn-secondary me-2">Batal</a>
                <button type="submit" class="btn btn-primary">Upload Sekarang</button>
            </div>
        </form>
    </div>
</div>

</body></html>