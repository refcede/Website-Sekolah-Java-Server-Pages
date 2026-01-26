<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kwitansi Pembayaran</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f0f0; font-family: 'Courier New', Courier, monospace; }
        .kwitansi-box {
            width: 700px;
            background: #fff;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            position: relative;
        }
        .header { text-align: center; border-bottom: 2px dashed #333; padding-bottom: 15px; margin-bottom: 20px; }
        .info-table td { padding: 5px 10px; vertical-align: top; }
        .total-box {
            background: #e9ecef;
            padding: 10px;
            text-align: right;
            font-weight: bold;
            font-size: 1.2rem;
            margin-top: 20px;
            border: 1px solid #ddd;
        }
        .stamp {
            margin-top: 40px;
            text-align: right;
            margin-right: 50px;
        }
        .stamp p { margin-bottom: 60px; } 
        
        @media print {
            body { background: #fff; }
            .no-print { display: none; }
            .kwitansi-box { box-shadow: none; border: 2px solid #000; margin: 0; width: 100%; }
        }
    </style>
</head>
<body>

    <div class="text-center mt-3 no-print">
        <button type="button" onclick="window.print()" class="btn btn-primary">
    <i class="bi bi-printer"></i> Cetak
</button>
        <button onclick="window.close()" class="btn btn-secondary">Tutup</button>
    </div>

    <div class="kwitansi-box">
        <div class="header">
            <h3 class="fw-bold">SMK NAIRI 04 OHIO</h3>
            <p class="mb-0">Jl. Sutomo No. 12, OHIO</p>
            <p class="small">Telp: (021) 555-1234 | Email: info@smknairi04ohio.sch.id</p>
            <h4 class="mt-3 border p-1 d-inline-block">KWITANSI PEMBAYARAN</h4>
        </div>

        <table class="info-table w-100">
            <tr>
                <td width="25%">No. Transaksi</td>
                <td width="5%">:</td>
                <td>#TRX-<c:out value="${bayar.idPembayaran}"/></td>
            </tr>
            <tr>
                <td>Tanggal Bayar</td>
                <td>:</td>
                <td><fmt:formatDate value="${bayar.tanggalBayar}" pattern="dd MMMM yyyy"/></td>
            </tr>
            <tr>
                <td>Telah Terima Dari</td>
                <td>:</td>
                <td><strong><c:out value="${siswa.nama}"/></strong> (NIS: <c:out value="${siswa.nis}"/>)</td>
            </tr>
            <tr>
                <td>Kelas / Jurusan</td>
                <td>:</td>
                <td><c:out value="${siswa.namaKelas}"/> / <c:out value="${siswa.namaJurusan}"/></td>
            </tr>
            <tr>
                <td>Untuk Pembayaran</td>
                <td>:</td>
                <td>
                    <c:out value="${bayar.namaTagihan}"/> 
                    (Bulan: <c:out value="${bayar.bulan}"/>/<c:out value="${bayar.tahun}"/>)
                </td>
            </tr>
            <tr>
                <td>Metode Bayar</td>
                <td>:</td>
                <td><c:out value="${bayar.metodePembayaran}"/></td>
            </tr>
        </table>

        <div class="total-box">
            Total Bayar: Rp <fmt:formatNumber value="${bayar.jumlahBayar}" type="currency" currencySymbol=""/>
        </div>

        <div class="stamp">
            <p>Petugas Administrasi,</p>
            <span class="text-muted">( Tanda Tangan & Stempel )</span>
        </div>
        
        <div class="mt-5 small text-center text-muted fst-italic">
            * Harap simpan bukti pembayaran ini sebagai dokumen yang sah.
        </div>
    </div>

</body>
</html>