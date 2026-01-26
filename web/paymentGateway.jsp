<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Gateway - Simulasi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body { 
            background-color: #f0f2f5; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 20px;
        }
        .payment-container {
            max-width: 800px;
            margin: 0 auto;
        }
        .payment-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .left-panel {
            background-color: #fff;
            padding: 30px;
        }
        .right-panel {
            background: linear-gradient(135deg, #0d6efd 0%, #0043a8 100%);
            color: white;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .bank-option {
            cursor: pointer;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 10px;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .bank-option:hover {
            border-color: #0d6efd;
            background-color: #f8f9fa;
        }
        .bank-option.active {
            border-color: #0d6efd;
            background-color: #e7f1ff;
        }
        .bank-logo {
            font-weight: bold;
            font-size: 1.1rem;
        }
        .va-box {
            background-color: rgba(255,255,255,0.2);
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: center;
            font-family: monospace;
            font-size: 1.4rem;
            letter-spacing: 2px;
            border: 1px dashed rgba(255,255,255,0.5);
        }
        .total-amount {
            font-size: 2.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="payment-container d-flex align-items-center" style="min-height: 90vh;">
    <div class="card payment-card w-100">
        <div class="row g-0">
            
            <div class="col-md-7 left-panel">
                <h4 class="mb-4 fw-bold text-secondary">Pilih Metode Pembayaran</h4>
                
                <div class="bank-list">
                    <div class="bank-option active" onclick="selectBank('BCA', '8800', this)">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-bank me-3 text-primary" style="font-size: 1.5rem;"></i>
                            <div>
                                <div class="bank-logo text-primary">BCA</div>
                                <small class="text-muted">Virtual Account</small>
                            </div>
                        </div>
                        <i class="bi bi-check-circle-fill text-primary fs-4"></i>
                    </div>

                    <div class="bank-option" onclick="selectBank('BRI', '7777', this)">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-bank me-3 text-success" style="font-size: 1.5rem;"></i>
                            <div>
                                <div class="bank-logo text-success">BRI</div>
                                <small class="text-muted">BRIVA</small>
                            </div>
                        </div>
                        <i class="bi bi-circle text-muted fs-4 check-icon"></i>
                    </div>

                    <div class="bank-option" onclick="selectBank('Mandiri', '9000', this)">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-bank me-3 text-warning" style="font-size: 1.5rem;"></i>
                            <div>
                                <div class="bank-logo text-warning">Mandiri</div>
                                <small class="text-muted">Livin' Bill</small>
                            </div>
                        </div>
                        <i class="bi bi-circle text-muted fs-4 check-icon"></i>
                    </div>
                    
                    <div class="bank-option" onclick="selectBank('BNI', '8000', this)">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-bank me-3 text-danger" style="font-size: 1.5rem;"></i>
                            <div>
                                <div class="bank-logo text-danger">BNI</div>
                                <small class="text-muted">Virtual Account</small>
                            </div>
                        </div>
                        <i class="bi bi-circle text-muted fs-4 check-icon"></i>
                    </div>
                </div>

                <div class="mt-4">
                    <a href="DashboardSiswaServlet" class="text-decoration-none text-muted">
                        <i class="bi bi-arrow-left"></i> Batalkan Pembayaran
                    </a>
                </div>
            </div>

            <div class="col-md-5 right-panel">
                <div>
                    <small class="text-white-50 text-uppercase">Total Tagihan</small>
                    <div class="total-amount">
                        Rp <fmt:formatNumber value="${param.nominal}" type="currency" currencySymbol=""/>
                    </div>
                    <div class="mt-3 text-white-50">
                        Tagihan SPP Bulan ${param.bulan}/${param.tahun}
                    </div>
                </div>

                <div>
                    <p class="mb-1 text-white-50">Bank Tujuan:</p>
                    <h5 class="fw-bold" id="selectedBankName">BCA Virtual Account</h5>
                    
                    <p class="mb-1 mt-3 text-white-50">Nomor Virtual Account:</p>
                    <div class="va-box" id="vaNumber">
                        8800 ${param.idSiswa} ${param.bulan}${param.tahun}
                    </div>
                    
                    <div class="alert alert-warning text-dark mt-3 d-flex align-items-center p-2">
                        <i class="bi bi-info-circle-fill me-2"></i>
                        <small style="font-size: 0.75rem; line-height: 1.2;">
                            Ini adalah simulasi. Klik tombol di bawah untuk memproses pembayaran.
                        </small>
                    </div>

                    <a href="OnlinePaymentServlet?action=success&idSiswa=${param.idSiswa}&bulan=${param.bulan}&tahun=${param.tahun}" 
                       class="btn btn-light w-100 fw-bold text-primary py-2 mt-2 shadow-sm">
                       <i class="bi bi-credit-card-2-front me-2"></i> Pay
                    </a>
                </div>
            </div>
            
        </div>
    </div>
</div>

<script>
    // Data ID Siswa, Bulan, Tahun diambil dari parameter URL (JSP)
    const idSiswa = "${param.idSiswa}";
    const bulan = "${param.bulan}";
    const tahun = "${param.tahun}";

    function selectBank(bankName, bankCode, element) {
        // 1. Update Tampilan Pilihan (Highlight)
        // Reset semua tombol jadi tidak aktif
        const options = document.querySelectorAll('.bank-option');
        options.forEach(opt => {
            opt.classList.remove('active');
            // Ubah icon centang jadi bulat kosong
            const icon = opt.querySelector('.bi');
            if(opt.querySelector('.check-icon')) { // Jika bukan elemen yg diklik, reset icon
                 // Logic reset icon manual agak rumit, cara mudah:
                 // Kita biarkan CSS active menghandle border/bg
            }
            // Reset icon (kasar tapi efektif)
            const iconElem = opt.lastElementChild;
            iconElem.className = 'bi bi-circle text-muted fs-4 check-icon';
        });

        // Set tombol yang diklik jadi aktif
        element.classList.add('active');
        // Ubah icon tombol yang diklik jadi centang
        element.lastElementChild.className = 'bi bi-check-circle-fill text-primary fs-4';

        // 2. Update Teks di Panel Kanan
        document.getElementById('selectedBankName').innerText = bankName + " Virtual Account";
        
        // 3. Update Nomor VA (Kode Bank + ID + Bulan + Tahun)
        // Contoh: 8800 18 72025
        document.getElementById('vaNumber').innerText = bankCode + " " + idSiswa + " " + bulan + tahun;
    }
</script>

</body>
</html>