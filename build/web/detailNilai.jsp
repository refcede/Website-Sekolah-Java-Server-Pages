<%-- File: WebContent/detailNilai.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transkrip Nilai Siswa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.table thead{background-color:#e9ecef;color:#495057;border-color:#dee2e6}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
    </style>
</head>
<body style="background-color: #f8f9fa;">

<div class="container mt-5">
    <a href="SiswaServlet" class="btn btn-outline-secondary mb-3">&larr; Kembali ke Daftar Siswa</a>

    <div class="row">
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Profil Siswa</h5>
                </div>
                <div class="card-body">
                    <p><strong>Nama:</strong> <c:out value="${siswa.nama}"/></p>
                    <p><strong>NIS:</strong> <c:out value="${siswa.nis}"/></p>
                    <%-- Memanggil namaJurusan dari SiswaDAO.getSiswaById --%>
                    <p><strong>Jurusan:</strong> <c:out value="${siswa.namaJurusan}"/></p> 
                    <p><strong>Kelas:</strong> <c:out value="${siswa.namaKelas}"/></p>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">Input / Update Nilai</h5>
                </div>
                <div class="card-body">
                    <form action="NilaiServlet" method="post">
                        <input type="hidden" name="idSiswa" value="${siswa.id}">
                        
                        <div class="mb-3">
                            <label class="form-label">Mata Pelajaran</label>
                            <select name="idMapel" class="form-select" required>
                                <option value="">-- Pilih Mata Pelajaran --</option>
                                <c:forEach var="mapel" items="${listMapel}">
                                    <option value="${mapel.idMapel}">
                                        <c:out value="${mapel.namaMapel}" />
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Nilai (0-100)</label>
                            <input type="number" name="nilaiAngka" class="form-control" min="0" max="100" required>
                        </div>
                        
                        <button type="submit" class="btn btn-success w-100">Simpan Nilai</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-8">
    
            <div class="card shadow-sm">
                <div class="card-body">
                    <h4 class="card-title text-primary mb-4">Transkrip Akademik (Nilai)</h4>
                    
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Mata Pelajaran</th>
                                <th>Nilai</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="n" items="${listNilai}">
                                <tr>
                                    <td><c:out value="${n.namaMapel}"/></td>
                                    <td><span class="fw-bold"><c:out value="${n.nilaiAngka}"/></span></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${n.nilaiAngka >= 75}">
                                                <span class="badge bg-success">Lulus</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Remedial</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="NilaiServlet?action=delete&idNilai=${n.idNilai}&idSiswa=${siswa.id}" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Hapus nilai ini?')">Hapus</a>
                                    </td>
                                </tr>
                            </c:forEach> <%-- PERBAIKAN: Penutup tag listNilai --%>
                            
                            <c:if test="${empty listNilai}">
                                <tr><td colspan="4" class="text-center">Belum ada nilai yang diinput.</td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card shadow-sm mt-4"> 
                <div class="card-body">
                    <h4 class="card-title text-primary mb-4">Riwayat Absensi</h4>
                    
                    <table class="table table-striped table-hover table-sm">
                        <thead class="table-dark">
                            <tr>
                                <th>Tanggal</th>
                                <th>Status Kehadiran</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="absen" items="${listAbsensi}">
                                <tr>
                                    <td><c:out value="${absen.tanggal}"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${absen.status == 'Hadir'}">
                                                <span class="badge bg-success">Hadir</span>
                                            </c:when>
                                            <c:when test="${absen.status == 'Sakit'}">
                                                <span class="badge bg-warning text-dark">Sakit</span>
                                            </c:when>
                                            <c:when test="${absen.status == 'Izin'}">
                                                <span class="badge bg-info text-dark">Izin</span>
                                            </c:when>
                                            <c:when test="${absen.status == 'Alpa'}">
                                                <span class="badge bg-danger">Alpa</span>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${absen.status}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach> <%-- PERBAIKAN: Penutup tag listAbsensi --%>
                            
                            <c:if test="${empty listAbsensi}">
                                <tr>
                                    <td colspan="2" class="text-center text-muted p-3">
                                        Belum ada riwayat absensi.
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>