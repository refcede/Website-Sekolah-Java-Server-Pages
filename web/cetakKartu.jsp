<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kartu Pelajar - ${siswa.nama}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f0f0; font-family: 'Segoe UI', Arial, sans-serif; }
        .id-card {
            width: 400px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            overflow: hidden;
            margin: 50px auto;
            border: 1px solid #e0e0e0;
            position: relative;
        }
        .header {
            background: linear-gradient(135deg, #0d6efd 0%, #0043a8 100%);
            color: white;
            padding: 25px 20px;
            text-align: center;
        }
        .photo-area {
            text-align: center;
            margin-top: -50px; /* Membuat foto menumpuk di atas header */
            position: relative;
            z-index: 10;
        }
        .profile-img {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            background-color: #f8f9fa;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        .info-area {
            padding: 10px 20px 20px;
            text-align: center;
        }
        .qr-area {
            display: flex;
            justify-content: center;
            margin-bottom: 25px;
            margin-top: 10px;
        }
        /* Agar saat dicetak background warnanya tetap muncul */
        @media print {
            body { 
                -webkit-print-color-adjust: exact; 
                background-color: white;
            }
            .no-print { display: none; }
            .id-card { 
                box-shadow: none; 
                border: 1px solid #ccc; 
                margin: 0 auto;
            }
        }
    </style>
</head>
<body>

    <div class="text-center mt-4 no-print gap-2">
        <button onclick="window.print()" class="btn btn-primary">🖨️ Cetak Kartu</button>
        <button onclick="window.close()" class="btn btn-secondary">Tutup</button>
    </div>

    <div class="id-card">
        <div class="header">
            <h4 class="m-0 fw-bold" style="letter-spacing: 1px;">KARTU PELAJAR</h4>
            <small style="opacity: 0.9;">SMK NEGERI 04 NAIRI OHIO</small>
            <div style="height: 40px;"></div> </div>
        
        <div class="photo-area">
            <img src="foto_siswa/${siswa.foto}" 
                 onerror="this.onerror=null; this.src='https://ui-avatars.com/api/?name=${siswa.nama}&background=random&color=fff&size=150&bold=true';"
                 alt="Foto Siswa"
                 class="profile-img">
        </div>

        <div class="info-area">
            <h4 class="fw-bold mb-1 text-uppercase" style="color: #333;"><c:out value="${siswa.nama}" /></h4>
            <p class="text-muted mb-3" style="font-size: 14px;">NIS: <c:out value="${siswa.nis}" /></p>
            
            <div class="card p-2 bg-light border-0">
                <p class="mb-1 small text-muted">JURUSAN</p>
                <p class="mb-2 fw-bold text-dark"><c:out value="${siswa.namaJurusan}" /></p>
                
                <p class="mb-1 small text-muted">KELAS</p>
                <p class="mb-0 fw-bold text-dark"><c:out value="${siswa.namaKelas}" /></p>
            </div>
        </div>

        <div class="qr-area">
            <div id="qrcode"></div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
    
    <script>
        var nisSiswa = "${siswa.nis}";
        
        // Cek jika NIS kosong agar tidak error
        if(nisSiswa && nisSiswa.trim() !== "") {
            var qrcode = new QRCode(document.getElementById("qrcode"), {
                text: nisSiswa,
                width: 100,
                height: 100,
                colorDark : "#000000",
                colorLight : "#ffffff",
                correctLevel : QRCode.CorrectLevel.H
            });
        } else {
            document.getElementById("qrcode").innerHTML = "<small class='text-muted'>No QR Data</small>";
        }
    </script>

</body>
</html>