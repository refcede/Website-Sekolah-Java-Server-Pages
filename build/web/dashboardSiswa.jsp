<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dasbor Siswa</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        /* --- Style Normal (Tampilan Layar) --- */
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .page-title {
            color: #0d6efd;
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-top: 2rem;
        }
        .content-card {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            margin-top: 2rem;
        }
        .table thead {
            background-color: #e9ecef;
            color: #495057;
            border-color: #dee2e6;
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }

        /* --- STYLE KHUSUS CETAK (MODERN BLUE) --- */
        @media print {
            @page { margin: 1cm; size: A4; } 
            
            body {
                background-color: #fff;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
                color: #333;
                /* INI KUNCI AGAR WARNA BIRU TERCETAK */
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
            
            /* 1. Sembunyikan elemen yang tidak perlu */
            .no-print, 
            .btn, 
            .modal,
            .page-title,          /* HILANGKAN JUDUL UTAMA */
            .navbar-text,         /* HILANGKAN TEKS "Halo, [Nama]" DAN "Logout" */
            a[href] {
                display: none !important;
            }

            /* 2. Sembunyikan Card Lain */
            #card-absensi, #card-pembayaran, #card-pengumuman {
                display: none !important;
            }

            /* 3. Reset Layout Container */
            .container {
                max-width: 100%;
                width: 100%;
                margin: 0;
                padding: 0;
            }
            
            .content-card {
                box-shadow: none;
                border: none;
                padding: 0;
                margin: 0;
                break-inside: avoid;
            }

            /* 4. Header Kop Surat Modern (BIRU) */
            .print-header {
                display: block !important;
                text-align: center;
                margin-bottom: 30px;
                border-bottom: 4px solid #0d6efd !important; /* Garis Biru */
                padding-bottom: 15px;
            }
            .print-header h2 {
                font-size: 22pt;
                font-weight: 900;
                color: #0d6efd !important; /* Judul Biru */
                margin-bottom: 5px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            .print-header h3 {
                font-size: 16pt;
                font-weight: bold;
                color: #333;
                margin: 0;
            }
            .print-header p {
                font-size: 10pt;
                color: #666;
                margin: 0;
            }

            /* 5. Judul Seksi Biru */
            .print-section-title {
                font-size: 14pt;
                font-weight: bold;
                color: #0d6efd !important; /* Warna Biru */
                border-left: 6px solid #0d6efd !important; /* Garis Samping Biru */
                padding-left: 12px;
                margin-top: 25px;
                margin-bottom: 15px;
                display: block !important;
                background-color: #f0f8ff !important; /* Latar Biru Sangat Muda */
                padding-top: 5px;
                padding-bottom: 5px;
            }
            
            /* 6. Tabel Data Diri */
            .info-table { width: 100%; margin-bottom: 20px; }
            .info-table td { padding: 6px 0; font-size: 11pt; border-bottom: 1px solid #eee; }
            .info-label { font-weight: bold; color: #555; width: 160px; }

            /* 7. Tabel Nilai (HEADER BIRU) */
            .table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
                font-size: 11pt;
            }
            .table thead th {
                background-color: #0d6efd !important; /* Background Biru */
                color: #ffffff !important; /* Teks Putih */
                padding: 10px;
                text-align: center;
                border: 1px solid #0b5ed7;
            }
            .table tbody td {
                padding: 10px;
                border: 1px solid #dee2e6;
                text-align: center;
            }
            .table tbody tr:nth-child(even) {
                background-color: #f8f9fa !important; /* Zebra Striping */
            }
            
            /* 8. Badge Status (Tetap Berwarna) */
            .badge {
                border: none;
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 10pt;
            }
            .bg-success { background-color: #198754 !important; color: white !important; }
            .bg-danger { background-color: #dc3545 !important; color: white !important; }
            
            /* 9. Tanda Tangan */
            .signature-area {
                display: block !important;
                margin-top: 60px;
                page-break-inside: avoid;
            }
        }
        
        /* Sembunyikan elemen print di layar biasa */
        .print-header, .print-section-title, .signature-area, .d-print-table {
            display: none;
        }
    </style>
</head>
<body>

<div class="container">
    
    <div class="d-flex justify-content-between align-items-center no-print mt-4">
        <h2 class="page-title">Dasbor Siswa</h2>
        <div>
            <span class="navbar-text me-3">Halo, <strong><c:out value="${sessionScope.authUser.namaLengkap}" /></strong> (<c:out value="${sessionScope.authUser.role}" />)</span>
            
            <button type="button" onclick="window.print()" class="btn btn-primary">
                <i class="bi bi-printer"></i> Cetak Transkrip
            </button>
            
            <a href="LogoutServlet" class="btn btn-outline-danger ms-2">Logout</a>
        </div>
    </div>

    <div class="print-header">
        <h2>TRANSKRIP NILAI AKADEMIK</h2>
        <h3>SMK NEGERI 15 OHIO</h3>
        <p>Jl. Pendidikan No. 123, Kota Contoh | Telp: (021) 555-1234 | Email: info@smk15ohio.sch.id</p>
    </div>

    <div id="card-profil" class="content-card">
        <h4 class="text-primary mb-4 no-print">Data Diri Siswa</h4>
        
        <div class="print-section-title">A. DATA PESERTA DIDIK</div>
        
        <div class="row no-print">
            <div class="col-md-6">
                <p><strong>Nama Lengkap:</strong> <c:out value="${siswa.nama}"/></p>
                <p><strong>NIS:</strong> <c:out value="${siswa.nis}"/></p>
                <p><strong>Email:</strong> <c:out value="${siswa.email}"/></p>
            </div>
            <div class="col-md-6">
                <p><strong>Jurusan:</strong> <c:out value="${siswa.namaJurusan}"/></p>
                <p><strong>Kelas:</strong> <c:out value="${siswa.namaKelas}"/></p>
                <p><strong>No. Telp:</strong> <c:out value="${siswa.noTelp}"/></p>
            </div>
        </div>

        <table class="info-table d-none d-print-table">
            <tr>
                <%-- Tambahkan spasi (padding-left) agar tidak mepet kiri --%>
                <td class="info-label ps-2">Nama Lengkap</td><td>: <c:out value="${siswa.nama}"/></td>
                <td class="info-label ps-2">Jurusan</td><td>: <c:out value="${siswa.namaJurusan}"/></td>
            </tr>
            <tr>
                <td class="info-label ps-2">NIS</td><td>: <c:out value="${siswa.nis}"/></td>
                <td class="info-label ps-2">Kelas</td><td>: <c:out value="${siswa.namaKelas}"/></td>
            </tr>
            <tr>
                <td class="info-label ps-2">Email</td><td>: <c:out value="${siswa.email}"/></td>
                <td class="info-label ps-2">No. Telp</td><td>: <c:out value="${siswa.noTelp}"/></td>
            </tr>
        </table>
    </div>

    <div id="card-transkrip" class="content-card">
        <h4 class="text-primary mb-4 no-print">Transkrip Akademik (Nilai)</h4>
        
        <div class="print-section-title">B. HASIL BELAJAR</div>
        
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th style="text-align: left;">Mata Pelajaran</th>
                    <th width="100">Nilai</th>
                    <th width="150">Keterangan</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="n" items="${listNilai}">
                    <tr>
                        <td style="text-align: left;"><c:out value="${n.namaMapel}"/></td>
                        <td class="fw-bold"><c:out value="${n.nilaiAngka}"/></td>
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
                    </tr>
                </c:forEach>
                <c:if test="${empty listNilai}">
                    <tr><td colspan="3" class="text-center text-muted p-3">Belum ada nilai.</td></tr>
                </c:if>
            </tbody>
        </table>
        
        <div class="signature-area">
            <div class="row">
                <div class="col-6"></div> <div class="col-6 text-center">
                    <p>Jakarta, <fmt:formatDate value="<%=new java.util.Date()%>" pattern="dd MMMM yyyy"/></p>
                    <p>Kepala Sekolah,</p>
                    <br><br><br><br>
                    <p class="fw-bold text-decoration-underline">Drs. H. CIBAY MAULIDINA, M.Pd.</p>
                    <p>NIP. 19800101 200012 1 001</p>
                </div>
            </div>
        </div>
    </div>

    <div id="card-absensi" class="content-card">
        <h4 class="text-primary mb-4">Riwayat Absensi</h4>
        <table class="table table-striped table-hover table-sm">
            <thead class="table-dark">
                <tr><th>Tanggal</th><th>Status Kehadiran</th></tr>
            </thead>
            <tbody>
                <c:forEach var="absen" items="${listAbsensi}">
                    <tr>
                        <td><fmt:formatDate value="${absen.tanggal}" pattern="dd-MM-yyyy"/></td>
                        <td><span class="badge bg-${absen.status == 'Hadir' ? 'success' : 'warning'}"><c:out value="${absen.status}"/></span></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="card-pembayaran" class="content-card">
        <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="text-primary mb-4">Daftar Tagihan & Pembayaran</h4>
        <a href="CetakRekapServlet?idSiswa=${siswa.id}" 
               target="_blank" 
               class="btn btn-outline-primary btn-sm no-print">
               <i class="bi bi-printer-fill me-1"></i> Cetak Rekap Lunas
            </a>
        </div>
                <div class="row">
            <c:forEach var="ts" items="${listTagihan}">
                
                <div class="col-md-3 mb-3">
                    <div class="card h-100 border-${ts.status == 'Lunas' ? 'success' : (ts.status == 'Menunggu' ? 'warning' : 'danger')}">
                        
                        <div class="card-body text-center">
                            
                            <h6 class="card-title fw-bold">
                                <c:choose>
                                    <c:when test="${ts.bulan == 1}">Januari</c:when>
                                    <c:when test="${ts.bulan == 2}">Februari</c:when>
                                    <c:when test="${ts.bulan == 3}">Maret</c:when>
                                    <c:when test="${ts.bulan == 4}">April</c:when>
                                    <c:when test="${ts.bulan == 5}">Mei</c:when>
                                    <c:when test="${ts.bulan == 6}">Juni</c:when>
                                    <c:when test="${ts.bulan == 7}">Juli</c:when>
                                    <c:when test="${ts.bulan == 8}">Agustus</c:when>
                                    <c:when test="${ts.bulan == 9}">September</c:when>
                                    <c:when test="${ts.bulan == 10}">Oktober</c:when>
                                    <c:when test="${ts.bulan == 11}">November</c:when>
                                    <c:when test="${ts.bulan == 12}">Desember</c:when>
                                    <c:otherwise>Tagihan Lain</c:otherwise>
                                </c:choose> 
                                <c:if test="${ts.bulan != 0}"><c:out value="${ts.tahun}"/></c:if>
                            </h6>
                            
                            <small class="d-block text-muted mb-2" style="font-size: 0.8rem; min-height: 2.5em;">
                                <c:out value="${ts.namaTagihan}"/>
                            </small>

                            <c:choose>
                                <c:when test="${ts.status == 'Lunas'}">
                                    <span class="badge bg-success w-100 py-2 mb-2">LUNAS</span>
                                    <a href="CetakKwitansiServlet?idSiswa=${siswa.id}&bulan=${ts.bulan}&tahun=${ts.tahun}" 
                                       target="_blank" class="btn btn-outline-success btn-sm w-100"><i class="bi bi-printer"></i> Cetak</a>
                                </c:when>
                                
                                <c:when test="${ts.status == 'Menunggu'}">
                                    <span class="badge bg-warning text-dark w-100 py-2">PENDING</span>
                                    <small class="text-muted d-block mt-1">Sedang diproses</small>
                                </c:when>
                                
                                <c:otherwise> <form action="OnlinePaymentServlet" method="post">
                                        <input type="hidden" name="idSiswa" value="${siswa.id}">
                                        <input type="hidden" name="bulan" value="${ts.bulan}">
                                        <input type="hidden" name="tahun" value="${ts.tahun}">
                                        <input type="hidden" name="totalBayar" value="${ts.nominal}">
                                        
                                        <button type="submit" class="btn btn-danger btn-sm w-100 shadow-sm">
                                            Bayar <br> Rp <fmt:formatNumber value="${ts.nominal}" type="currency" currencySymbol=""/>
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                            
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <%-- Jika tidak ada tagihan sama sekali --%>
            <c:if test="${empty listTagihan}">
                <div class="col-12 text-center text-muted py-5">
                    <p>Tidak ada tagihan yang harus dibayar saat ini.</p>
                </div>
            </c:if>
        </div>
    </div>

    <div id="card-pengumuman" class="content-card">
        <h4 class="text-primary mb-4">Pengumuman</h4>
         <div class="list-group">
            <c:forEach var="p" items="${listPengumuman}">
                <div class="list-group-item list-group-item-action flex-column align-items-start mb-2">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><c:out value="${p.judul}"/></h5>
                        <small class="text-muted"><fmt:formatDate value="${p.tanggalPost}" pattern="dd MMM yyyy"/></small>
                    </div>
                    <p class="mb-1"><c:out value="${p.isi}"/></p>
                </div>
            </c:forEach>
        </div>
    </div>

</div>

<c:if test="${not empty listPengumuman}">
    <div class="modal fade no-print" id="announcementModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header"><h5 class="modal-title">Pengumuman Terbaru!</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
                <div class="modal-body"><h4 class="text-primary"><c:out value="${listPengumuman[0].judul}" /></h4><p><c:out value="${listPengumuman[0].isi}" /></p></div>
            </div>
        </div>
    </div>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<c:if test="${not empty listPengumuman}">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            if (!sessionStorage.getItem('announcementShown')) {
                new bootstrap.Modal(document.getElementById('announcementModal')).show();
                sessionStorage.setItem('announcementShown', 'true');
            }
        });
    </script>
</c:if>

</body>
</html>