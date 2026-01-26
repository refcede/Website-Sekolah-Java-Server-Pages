<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pembayaran SPP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body{background-color:#f8f9fa}
        .content-card{background:#fff;padding:2rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}
    </style>
</head>
<body>
<div class="container">
    <a href="SiswaServlet" class="btn btn-outline-secondary my-3">&larr; Kembali ke Daftar Siswa</a>
    
    <div class="row">
        <div class="col-md-5">
            
            <div class="content-card mb-4" style="border-left: 5px solid #ffc107; margin-top: 0;">
                <h5 class="text-warning text-dark fw-bold">Setup Tagihan Siswa Baru</h5>
                <p class="small text-muted mb-2">Klik ini jika tabel tagihan siswa masih kosong (-).</p>
                
                <form action="PembayaranServlet" method="post">
                    <input type="hidden" name="action" value="generate_spp">
                    <input type="hidden" name="idSiswa" value="${siswa.id}">
                    
                    <div class="input-group">
                        <span class="input-group-text">Tahun Ajaran</span>
                        <input type="number" name="tahunMulai" class="form-control" value="2025" placeholder="2025">
                        <button type="submit" class="btn btn-warning fw-bold">Generate</button>
                    </div>
                    <small class="text-muted" style="font-size: 0.75rem">*Akan membuat tagihan Juli - Juni</small>
                </form>
            </div>

            <div class="content-card mb-4" style="border-left: 5px solid #0d6efd; margin-top: 0;">
                <h5 class="text-primary fw-bold">Tambah Tagihan Lain</h5>
                <p class="small text-muted mb-2">Tambahkan tagihan spesifik (misal: Ujian, Buku) ke siswa ini.</p>
                
                <form action="PembayaranServlet" method="post">
                    <input type="hidden" name="action" value="assign_tagihan">
                    <input type="hidden" name="idSiswa" value="${siswa.id}">
                    
                    <div class="mb-2">
                        <label class="form-label small fw-bold">Pilih Tagihan:</label>
                        <select name="idTagihan" class="form-select form-select-sm" required>
                            <option value="">-- Pilih --</option>
                            <c:forEach var="t" items="${listTagihan}">
                                <option value="${t.idTagihan}">
                                    <c:out value="${t.namaTagihan}"/> 
                                    (Rp <fmt:formatNumber value="${t.nominal}" type="currency" currencySymbol=""/>)
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="row mb-2">
                        <div class="col-7">
                            <label class="form-label small fw-bold">Bulan:</label>
                            <select name="bulan" class="form-select form-select-sm">
                                <option value="0">-- Bebas --</option>
                                <option value="1">Januari</option>
                                <option value="2">Februari</option>
                                <option value="3">Maret</option>
                                <option value="4">April</option>
                                <option value="5">Mei</option>
                                <option value="6">Juni</option>
                                <option value="7">Juli</option>
                                <option value="8">Agustus</option>
                                <option value="9">September</option>
                                <option value="10">Oktober</option>
                                <option value="11">November</option>
                                <option value="12">Desember</option>
                            </select>
                        </div>
                        <div class="col-5">
                            <label class="form-label small fw-bold">Tahun:</label>
                            <input type="number" name="tahun" class="form-control form-control-sm" value="2025">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-sm w-100">
                        <i class="bi bi-plus-circle"></i> Tambahkan Tagihan
                    </button>
                </form>
            </div>

            <div class="content-card" style="margin-top: 0;">
                <h4 class="text-primary">Catat Pembayaran Manual</h4>
                <p>Siswa: <strong><c:out value="${siswa.nama}"/></strong></p>
                
                <form action="PembayaranServlet" method="post">
                    <input type="hidden" name="idSiswa" value="${siswa.id}">
                    
                    <div class="mb-3">
                        <label class="form-label">Jenis Tagihan:</label>
                        <select name="idTagihan" class="form-select" required>
                            <option value="">-- Pilih Jenis --</option>
                            <c:forEach var="t" items="${listTagihan}">
                                <option value="${t.idTagihan}"><c:out value="${t.namaTagihan}"/> (Rp <fmt:formatNumber value="${t.nominal}" type="currency" currencySymbol=""/>)</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Jumlah Bayar (Rp):</label>
                        <input type="number" name="jumlahBayar" class="form-control" required>
                    </div>
                    
                    <small class="text-muted">Isi HANYA untuk SPP Bulanan:</small>
                    <div class="row">
                        <div class="col-7">
                            <select name="bulan" class="form-select">
                                <option value="0">-- Non-SPP --</option>
                                <option value="1">Januari</option>
                                <option value="2">Februari</option>
                                <option value="3">Maret</option>
                                <option value="4">April</option>
                                <option value="5">Mei</option>
                                <option value="6">Juni</option>
                                <option value="7">Juli</option>
                                <option value="8">Agustus</option>
                                <option value="9">September</option>
                                <option value="10">Oktober</option>
                                <option value="11">November</option>
                                <option value="12">Desember</option>
                            </select>
                        </div>
                        <div class="col-5">
                            <input type="number" name="tahun" class="form-control" placeholder="Thn" value="2025">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-100 mt-4">Simpan Pembayaran</button>
                </form>
            </div>
        </div>
        
        <div class="col-md-7">
            <div class="content-card" style="margin-top: 0;">
                <h4 class="text-primary">Histori Pembayaran</h4>
                <table class="table table-striped table-sm mt-3">
                    <thead><tr><th>Tanggal</th><th>Tagihan</th><th>Bulan</th><th>Jumlah</th></tr></thead>
                    <tbody>
                        <c:forEach var="h" items="${histori}">
                            <tr>
                                <td><fmt:formatDate value="${h.tanggalBayar}" pattern="dd-MM-yyyy"/></td>
                                <td><c:out value="${h.namaTagihan}"/></td>
                                <td>
                                    <c:if test="${h.bulan != 0}"><c:out value="${h.bulan}/${h.tahun}"/></c:if>
                                    <c:if test="${h.bulan == 0}">-</c:if>
                                </td>
                                <td>Rp <fmt:formatNumber value="${h.jumlahBayar}" type="currency" currencySymbol=""/></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty histori}"><tr><td colspan="4" class="text-center">Belum ada histori</td></tr></c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="row mt-4 mb-5">
        <div class="col-12">
            <div class="content-card" style="margin-top: 0;">
                <h4 class="text-primary mb-3">Manajemen Tagihan Siswa</h4>
                <p class="text-muted small">Daftar tagihan yang harus dibayar siswa ini. Anda bisa menghapus tagihan yang salah atau mengubah status secara manual.</p>
                
                <div class="table-responsive">
                    <table class="table table-hover align-middle border">
                        <thead class="table-light">
                            <tr>
                                <th>Jenis Tagihan</th>
                                <th>Bulan/Tahun</th>
                                <th>Nominal</th>
                                <th>Status</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ts" items="${listRencanaTagihan}">
                                <tr>
                                    <td><c:out value="${ts.namaTagihan}"/></td>
                                    <td>
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
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                        <c:if test="${ts.bulan != 0}"> <c:out value="${ts.tahun}"/></c:if>
                                    </td>
                                    <td>Rp <fmt:formatNumber value="${ts.nominal}" type="currency" currencySymbol=""/></td>
                                    
                                    <td style="width: 200px;">
                                        <form action="PembayaranServlet" method="post" class="d-flex gap-1 m-0">
                                            <input type="hidden" name="action" value="update_status_tagihan">
                                            <input type="hidden" name="idSiswa" value="${siswa.id}">
                                            <input type="hidden" name="idTagihanSiswa" value="${ts.id}">
                                            
                                            <select name="status" class="form-select form-select-sm" onchange="this.form.submit()">
                                                <option value="Belum Lunas" ${ts.status == 'Belum Lunas' ? 'selected' : ''}>Belum Lunas</option>
                                                <option value="Lunas" ${ts.status == 'Lunas' ? 'selected' : ''}>Lunas</option>
                                            </select>
                                        </form>
                                    </td>
                                    
                                    <td class="text-center">
                                        <button type="button" 
                                                class="btn btn-sm btn-outline-danger" 
                                                onclick="hapusTagihanAJAX(this, ${ts.id}, ${siswa.id})">
                                            <i class="bi bi-trash"></i> Hapus
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty listRencanaTagihan}">
                                <tr><td colspan="5" class="text-center py-4 text-muted">Siswa ini belum memiliki tagihan.</td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function hapusTagihanAJAX(btnElement, idTagihanSiswa, idSiswa) {
        // 1. Konfirmasi Dulu
        if (!confirm('Yakin ingin menghapus tagihan ini?')) {
            return;
        }

        // 2. Ubah tombol jadi "Loading..."
        var originalText = btnElement.innerHTML;
        btnElement.innerHTML = '<span class="spinner-border spinner-border-sm"></span>';
        btnElement.disabled = true;

        // 3. Kirim Request ke Server (AJAX)
        fetch('PembayaranServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            // Kirim data yang sama seperti form sebelumnya
            body: 'action=delete_tagihan_siswa&idTagihanSiswa=' + idTagihanSiswa + '&idSiswa=' + idSiswa
        })
        .then(response => response.json()) // Baca respon JSON dari Servlet
        .then(data => {
            if (data.status === 'success') {
                // 4. JIKA SUKSES: Hapus baris tabel (TR) secara visual
                var row = btnElement.closest('tr');
                row.style.transition = "all 0.5s";
                row.style.opacity = "0"; // Efek memudar
                
                setTimeout(() => {
                    row.remove(); // Hapus dari HTML
                }, 500);
            } else {
                alert("Gagal menghapus tagihan.");
                btnElement.innerHTML = originalText;
                btnElement.disabled = false;
            }
        })
        .catch(error => {
            console.error('Error:', error);
            // alert("Terjadi kesalahan koneksi."); // Optional
            // Jika error JSON parsing (mungkin karena redirect), coba reload manual
            window.location.reload();
        });
    }
</script>

</body>
</html>