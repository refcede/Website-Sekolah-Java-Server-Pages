<%-- File: WebContent/formAbsensi.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%-- 
    ========================================
    == BAGIAN 1: <HEAD> YANG LENGKAP (CSS) ==
    ========================================
    --%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manajemen Absensi</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.table thead{background-color:#e9ecef;color:#495057;border-color:#dee2e6}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
        /* Style tambahan untuk radio button absensi */
        .radio-group .form-check { display: inline-block; margin-right: 15px; }
        .radio-group label { margin-left: 5px; }
    </style>
</head>
<body>

<%-- 
========================================
== BAGIAN 2: STRUKTUR <body> (HTML)  ==
========================================
--%>
<div class="container">
    
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="page-title">Manajemen Absensi</h2>
        <div>
            <a href="SiswaServlet" class="btn btn-outline-secondary">Kembali ke Siswa</a>
            <a href="LogoutServlet" class="btn btn-outline-danger">Logout</a>
        </div>
    </div>
    
    <div class="content-card mb-4" style="margin-top: 0;"> <%-- margin-top: 0 agar tidak terlalu jauh --%>
        <h5 class="mb-3">Pilih Kelas dan Tanggal</h5>
        <form action="AbsensiServlet" method="get" class="row g-3">
            <div class="col-md-5">
                <label for="id_kelas" class="form-label">Kelas</label>
                <select name="id_kelas" class="form-select" onchange="this.form.submit()">
                    <option value="">-- Pilih Kelas --</option>
                    <c:forEach var="kls" items="${listKelas}">
                        <option value="${kls.idKelas}" ${kls.idKelas == selectedKelasId ? 'selected' : ''}>
                            <c:out value="${kls.namaKelas}" /> (<c:out value="${kls.namaJurusan}" />)
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-5">
                <label for="tanggal" class="form-label">Tanggal</label>
                <input type="date" class="form-control" name="tanggal" value="${selectedTanggal}" onchange="this.form.submit()">
            </div>
        </form>
    </div>

    <c:if test="${not empty listSiswaAbsen}">
        <form action="AbsensiServlet" method="post">
            <input type="hidden" name="id_kelas" value="${selectedKelasId}">
            <input type="hidden" name="tanggal" value="${selectedTanggal}">
            
            <div class="content-card">
                <h5>Daftar Siswa - Kelas ${selectedKelas.namaKelas}</h5>
                <p>Tanggal: ${selectedTanggal}</p>
                
                <table class="table table-hover align-middle mt-3">
                    <thead class="table-light">
                        <tr>
                            <th>NIS</th>
                            <th>Nama Siswa</th>
                            <th class="text-center">Kehadiran</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="siswa" items="${listSiswaAbsen}">
                            <tr>
                                <td><c:out value="${siswa.nis}"/></td>
                                <td>
                                    <c:out value="${siswa.namaSiswa}"/>
                                    <input type="hidden" name="idSiswa" value="${siswa.idSiswa}">
                                </td>
                                <td class="radio-group text-center">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status_${siswa.idSiswa}" id="h_${siswa.idSiswa}" value="Hadir" ${siswa.status == 'Hadir' ? 'checked' : ''} required>
                                        <label class="form-check-label" for="h_${siswa.idSiswa}">Hadir</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status_${siswa.idSiswa}" id="i_${siswa.idSiswa}" value="Izin" ${siswa.status == 'Izin' ? 'checked' : ''}>
                                        <label class="form-check-label" for="i_${siswa.idSiswa}">Izin</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status_${siswa.idSiswa}" id="s_${siswa.idSiswa}" value="Sakit" ${siswa.status == 'Sakit' ? 'checked' : ''}>
                                        <label class="form-check-label" for="s_${siswa.idSiswa}">Sakit</al>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status_${siswa.idSiswa}" id="a_${siswa.idSiswa}" value="Alpa" ${siswa.status == 'Alpa' ? 'checked' : ''}>
                                        <label class="form-check-label" for="a_${siswa.idSiswa}">Alpa</label>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-primary mt-3">Simpan Absensi</button>
            </div>
        </form>
    </c:if>

</div> <%-- Tutup .container --%>
</body>
</html>