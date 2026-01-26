<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manajemen Siswa</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
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
        .btn-action {
            margin-right: 3px;
            margin-bottom: 3px;
        }
        /* Style Foto di Tabel */
        .avatar-img {
            width: 45px;
            height: 45px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #e9ecef;
        }
    </style>
</head>
<body>

    <div class="container">
        
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h2 class="page-title d-inline-block me-3">Data Siswa</h2>
                <a href="AdminDashboardServlet" class="btn btn-outline-secondary btn-sm mb-2">
                    <i class="bi bi-arrow-left"></i> Kembali ke Dasbor
                </a>
            </div>
            
            <div>
                <span class="navbar-text me-3 d-none d-md-inline">
                    Halo, <strong><c:out value="${sessionScope.authUser.namaLengkap}"/></strong> 
                    (<c:out value="${sessionScope.authUser.role}"/>)
                </span>
                <a href="LogoutServlet" class="btn btn-outline-danger">Logout</a>
            </div>
        </div>
        
        <div class="content-card">
            
            <div class="mb-4">
                <c:if test="${sessionScope.authUser.role == 'admin'}">
                    <a href="SiswaServlet?action=new" class="btn btn-primary mb-2">
                        <i class="bi bi-plus-lg"></i> Tambah Siswa
                    </a>
                    <a href="JurusanServlet" class="btn btn-outline-secondary mb-2 ms-1">Kelola Jurusan</a>
                    <a href="KelasServlet" class="btn btn-outline-dark mb-2 ms-1">Kelola Kelas</a>
                    <a href="KurikulumServlet" class="btn btn-outline-success mb-2 ms-1">Kelola Kurikulum</a>
                    
                    <a href="UserServlet" class="btn btn-outline-warning mb-2 ms-1">Kelola User</a>
                </c:if>
                
                <a href="AbsensiServlet" class="btn btn-outline-info mb-2 ms-1">Kelola Absensi</a>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-12">
                    <form action="SiswaServlet" method="get" class="d-flex">
                        <input 
                            type="text" 
                            name="keyword" 
                            class="form-control me-2" 
                            placeholder="Cari nama, NIS, jurusan, atau kelas..." 
                            value="<c:out value='${keyword}' />"
                        >
                        <button type="submit" class="btn btn-outline-primary">Cari</button>
                    </form>
                </div>
            </div>
    
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th width="50">ID</th>
                            <th width="80">Foto</th> <th>NIS</th>
                            <th>Nama</th>
                            <th>Jurusan</th>
                            <th>Kelas</th>
                            <th class="text-end" style="min-width: 250px;">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${listSiswa}">
                            <tr>
                                <td><c:out value="${s.id}" /></td>
                                
                                <td>
                                    <c:choose>
                                        <%-- Jika ada foto asli --%>
                                        <c:when test="${not empty s.foto && s.foto != 'default.png'}">
                                            <img src="foto_siswa/<c:out value='${s.foto}'/>" 
                                                 alt="Foto" class="avatar-img">
                                        </c:when>
                                        <%-- Jika tidak ada, pakai UI Avatars (Huruf) --%>
                                        <c:otherwise>
                                            <img src="https://ui-avatars.com/api/?name=<c:out value='${s.nama}'/>&background=random&color=fff&size=128" 
                                                 alt="Avatar" class="avatar-img">
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td><c:out value="${s.nis}" /></td>
                                <td class="fw-bold"><c:out value="${s.nama}" /></td>
                                <td><c:out value="${s.namaJurusan}" /></td>
                                <td><span class="badge bg-light text-dark border"><c:out value="${s.namaKelas}" /></span></td>
                                
                                <td class="text-end">
                                    <a href="NilaiServlet?idSiswa=<c:out value='${s.id}'/>" 
                                       class="btn btn-sm btn-info text-white btn-action" title="Transkrip">Nilai</a>
                                    
                                    <a href="PembayaranServlet?idSiswa=<c:out value='${s.id}'/>" 
                                       class="btn btn-sm btn-success btn-action" title="Bayar SPP">Bayar</a>
                                    
                                    <a href="CetakKartuServlet?id=<c:out value='${s.id}'/>" 
                                       target="_blank" class="btn btn-sm btn-dark btn-action" title="Kartu Pelajar">Kartu</a>

                                    <span class="mx-1 text-muted">|</span>

                                    <a href="SiswaServlet?action=edit&id=<c:out value='${s.id}'/>" 
                                       class="btn btn-sm btn-outline-primary btn-action">Edit</a>
                                    
                                    <a href="SiswaServlet?action=delete&id=<c:out value='${s.id}'/>" 
                                       class="btn btn-sm btn-outline-danger btn-action" 
                                       onclick="return confirm('Hapus siswa ini beserta semua datanya?')">Hapus</a>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty listSiswa}">
                            <tr>
                                <td colspan="7" class="text-center text-muted p-5">
                                    Belum ada data siswa.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
            
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>