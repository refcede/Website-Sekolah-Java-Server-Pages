<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dasbor Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.table thead{background-color:#e9ecef;color:#495057;border-color:#dee2e6}
        
        /* Penyesuaian Style untuk Logo */
        .header-logo-container {
            padding-top: 2rem;
            margin-bottom: 1.5rem;
        }
        .header-logo-container .school-name {
            color: #0d6efd;
            font-weight: 700;
            font-size: 1.7rem;
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<div class="container">
    
    <div class="d-flex justify-content-between align-items-center header-logo-container">
        
        <div class="d-flex align-items-center">
            <img src="images/school_logo.png" onerror="this.src='https://i.postimg.cc/8kyYZDJ9/1762972172485.png'" alt="Logo Sekolah" style="height: 55px; margin-right: 15px; border-radius: 50%;">
            
            <div>
                <h5 class="text-secondary fw-bold mb-0" style="font-size: 0.9rem;">DASBOR ADMINISTRASI</h5>
                <h2 class="school-name">SMA Negeri 04 NAIRI OHIO</h2>
            </div>
        </div>
        
        <div>
            <span class="navbar-text me-3">
                Halo, <strong><c:out value="${sessionScope.authUser.namaLengkap}"/></strong> 
                (<c:out value="${sessionScope.authUser.role}"/>)
            </span>
            <a href="LogoutServlet" class="btn btn-outline-danger">Logout</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title display-6 fw-bold">${totalSiswa}</h5>
                    <p class="card-text">Total Siswa</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title display-6 fw-bold">${totalJurusan}</h5>
                    <p class="card-text">Total Jurusan</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h5 class="card-title display-6 fw-bold">${totalKelas}</h5>
                    <p class="card-text">Total Kelas</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title display-6 fw-bold">${siswaBaru}</h5>
                    <p class="card-text">Siswa Baru Hari Ini</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="content-card" style="margin-top:0;">
                <h4 class="mb-3 text-secondary">Menu Navigasi</h4>
                <div class="list-group">
                    <a href="AbsensiServlet" class="list-group-item list-group-item-action">
                        <i class="bi bi-calendar-check me-2"></i> Kelola Absensi
                    </a>
                    <a href="scanAbsensi.jsp" target="_blank" class="list-group-item list-group-item-action list-group-item-primary">
                        <i class="bi bi-qr-code-scan me-2"></i> Mode Kiosk (Scan QR)
                    </a>
                    <a href="MateriServlet" class="list-group-item list-group-item-action list-group-item-info">
                        <i class="bi bi-journal-text me-2"></i> Kelola Materi Ajar
                    </a>

                    <c:if test="${sessionScope.authUser.role == 'admin'}">
                        <div class="mt-3 mb-1 text-muted small fw-bold text-uppercase">Administrasi Inti</div>
                        
                        <a href="SiswaServlet" class="list-group-item list-group-item-action">
                            <i class="bi bi-people me-2"></i> Kelola Data Siswa
                        </a>
                        <a href="JurusanServlet" class="list-group-item list-group-item-action">
                            <i class="bi bi-mortarboard me-2"></i> Kelola Jurusan
                        </a>
                        <a href="KelasServlet" class="list-group-item list-group-item-action">
                            <i class="bi bi-door-open me-2"></i> Kelola Kelas
                        </a>
                        <a href="KurikulumServlet" class="list-group-item list-group-item-action">
                            <i class="bi bi-book me-2"></i> Kelola Kurikulum Mapel
                        </a>
                        <a href="UserServlet" class="list-group-item list-group-item-action list-group-item-warning">
                            <i class="bi bi-person-gear me-2"></i> Kelola User (Admin/Guru/Siswa)
                        </a>
                        <a href="PengumumanServlet" class="list-group-item list-group-item-action list-group-item-danger">
                            <i class="bi bi-megaphone me-2"></i> Kelola Pengumuman
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
        
        <div class="col-md-8">
            <div class="content-card" style="margin-top:0;">
                <h4 class="mb-3 text-secondary">Pengumuman Terbaru</h4>
                <div class="list-group">
                    <c:forEach var="p" items="${listPengumuman}">
                        <div class="list-group-item list-group-item-action flex-column align-items-start mb-2">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1 text-primary"><c:out value="${p.judul}"/></h5>
                                <small class="text-muted"><fmt:formatDate value="${p.tanggalPost}" pattern="dd MMMM yyyy HH:mm" /></small>
                            </div>
                            <p class="mb-1"><c:out value="${p.isi}"/></p>
                        </div>
                    </c:forEach>
                    <c:if test="${empty listPengumuman}">
                        <p class="text-muted text-center py-4">Belum ada pengumuman.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty listPengumuman}">
    <div class="modal fade" id="announcementModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Pengumuman Terbaru!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <c:set var="latest" value="${listPengumuman[0]}" />
                    <h4 class="text-primary"><c:out value="${latest.judul}" /></h4>
                    <small class="text-muted"><fmt:formatDate value="${latest.tanggalPost}" pattern="dd MMMM yyyy HH:mm" /></small>
                    <hr>
                    <p><c:out value="${latest.isi}" /></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<c:if test="${not empty listPengumuman}">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var hasSeen = sessionStorage.getItem('announcementShown');
            if (!hasSeen) {
                var myModal = new bootstrap.Modal(document.getElementById('announcementModal'));
                myModal.show();
                sessionStorage.setItem('announcementShown', 'true');
            }
        });
    </script>
</c:if>

</body>
</html>