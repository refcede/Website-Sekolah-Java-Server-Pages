<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rekap Pembayaran - ${siswa.nama}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f3f4f6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            padding-top: 20px;
        }

        /* --- CONTAINER UTAMA (KERTAS) --- */
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
            background-color: white;
            font-size: 14px;
            line-height: 24px;
            color: #555;
            position: relative;
        }

        /* --- HEADER --- */
        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #0d6efd; /* Garis Biru Modern */
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        
        .school-info h2 {
            margin: 0;
            color: #0d6efd;
            font-weight: 800;
            text-transform: uppercase;
            font-size: 24px;
        }
        
        .school-info p {
            margin: 0;
            font-size: 12px;
            color: #777;
        }

        .invoice-title {
            text-align: right;
        }
        .invoice-title h3 {
            margin: 0;
            font-weight: 700;
            color: #333;
        }
        .invoice-title span {
            font-size: 12px;
            color: #888;
        }

        /* --- INFO SISWA --- */
        .student-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 5px solid #0d6efd;
        }
        .student-info table { width: 100%; }
        .student-info td { padding: 2px 0; font-size: 13px; }
        .label { font-weight: bold; color: #333; width: 120px; }

        /* --- TABEL DATA --- */
        .recap-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        .recap-table th {
            background-color: #0d6efd;
            color: white;
            text-align: left;
            padding: 12px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 12px;
        }
        
        .recap-table td {
            padding: 10px 12px;
            border-bottom: 1px solid #eee;
        }
        
        .recap-table tr:last-child td {
            border-bottom: 2px solid #333; /* Garis penutup tebal */
        }
        
        .recap-table tr:nth-child(even) {
            background-color: #fcfcfc;
        }

        /* --- TOTAL --- */
        .total-section {
            text-align: right;
            margin-top: 10px;
        }
        .total-label {
            font-size: 14px;
            font-weight: bold;
            color: #555;
            margin-right: 15px;
        }
        .total-amount {
            font-size: 20px;
            font-weight: 800;
            color: #0d6efd;
        }

        /* --- FOOTER / TTD --- */
        .footer-sign {
            margin-top: 50px;
            display: flex;
            justify-content: flex-end;
        }
        .sign-box {
            text-align: center;
            width: 200px;
        }
        .sign-box p { margin: 0; font-size: 12px; }
        .sign-box .name {
            margin-top: 60px;
            font-weight: bold;
            text-decoration: underline;
            font-size: 14px;
        }

        /* --- TOMBOL CETAK --- */
        .action-buttons {
            text-align: center;
            margin-bottom: 20px;
        }

        /* --- MODE CETAK --- */
        @media print {
            body { 
                background-color: #fff; 
                padding: 0;
                -webkit-print-color-adjust: exact; 
                print-color-adjust: exact;
            }
            .invoice-box {
                box-shadow: none;
                border: none;
                width: 100%;
                max-width: 100%;
                padding: 0;
                margin: 0;
            }
            .no-print { display: none !important; }
            /* Memastikan background header tabel tetap biru saat dicetak */
            .recap-table th {
                background-color: #0d6efd !important;
                color: white !important;
            }
        }
    </style>
</head>
<body>

    <div class="action-buttons no-print">
        <button onclick="window.print()" class="btn btn-primary px-4 shadow-sm">🖨️ Cetak Rekap</button>
        <button onclick="window.close()" class="btn btn-outline-secondary px-4">Tutup</button>
    </div>

    <div class="invoice-box">
        
        <div class="invoice-header">
            <div class="school-info">
                <h2>SMK NEGERI CONTOH</h2>
                <p>Jl. Pendidikan No. 123, Kota Contoh</p>
                <p>Telp: (021) 555-1234 | Email: admin@smkcontoh.sch.id</p>
            </div>
            <div class="invoice-title">
                <h3>REKAPITULASI PEMBAYARAN</h3>
                <span>Dicetak pada: <fmt:formatDate value="<%=new java.util.Date()%>" pattern="dd MMMM yyyy HH:mm"/></span>
            </div>
        </div>

        <div class="student-info">
            <table>
                <tr>
                    <td class="label">NAMA SISWA</td>
                    <td>: <strong><c:out value="${siswa.nama}"/></strong></td>
                    <td class="label">KELAS</td>
                    <td>: <c:out value="${siswa.namaKelas}"/></td>
                </tr>
                <tr>
                    <td class="label">NIS</td>
                    <td>: <c:out value="${siswa.nis}"/></td>
                    <td class="label">JURUSAN</td>
                    <td>: <c:out value="${siswa.namaJurusan}"/></td>
                </tr>
            </table>
        </div>

        <table class="recap-table">
            <thead>
                <tr>
                    <th width="5%" class="text-center">No</th>
                    <th width="15%">Tanggal Bayar</th>
                    <th width="40%">Uraian Pembayaran</th>
                    <th width="20%">Metode</th>
                    <th width="20%" class="text-end">Jumlah</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="no" value="1" />
                <c:forEach var="p" items="${listLunas}">
                    <tr>
                        <td class="text-center">${no}</td>
                        <td><fmt:formatDate value="${p.tanggalBayar}" pattern="dd/MM/yyyy"/></td>
                        <td>
                            <span style="font-weight: 500; color: #333;"><c:out value="${p.namaTagihan}"/></span>
                            <c:if test="${p.bulan != 0}">
                                <br><small class="text-muted" style="font-size: 11px;">Periode: <c:out value="${p.bulan}"/>/<c:out value="${p.tahun}"/></small>
                            </c:if>
                        </td>
                        <td><span class="badge bg-light text-dark border"><c:out value="${p.metodePembayaran}"/></span></td>
                        <td class="text-end fw-bold">Rp <fmt:formatNumber value="${p.jumlahBayar}" type="currency" currencySymbol=""/></td>
                    </tr>
                    <c:set var="no" value="${no + 1}" />
                </c:forEach>
                
                <c:if test="${empty listLunas}">
                    <tr>
                        <td colspan="5" class="text-center py-4 text-muted">Belum ada riwayat pembayaran yang lunas.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <div class="total-section">
            <span class="total-label">TOTAL PEMBAYARAN LUNAS</span>
            <div class="total-amount">Rp <fmt:formatNumber value="${totalBayar}" type="currency" currencySymbol=""/></div>
        </div>

        <div class="footer-sign">
            <div class="sign-box">
                <p>Jakarta, <fmt:formatDate value="<%=new java.util.Date()%>" pattern="dd MMMM yyyy"/></p>
                <p>Bagian Keuangan,</p>
                <div class="name">Staff Administrasi</div>
            </div>
        </div>

        <div style="margin-top: 40px; border-top: 1px dashed #ddd; padding-top: 10px; font-size: 10px; color: #999; text-align: center;">
            Dokumen ini dicetak secara otomatis oleh sistem komputer dan sah tanpa tanda tangan basah jika terdapat kode verifikasi sistem.
        </div>

    </div>

</body>
</html>