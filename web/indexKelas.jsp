<%-- File: WebContent/indexKelas.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manajemen Kelas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.table thead{background-color:#e9ecef;color:#495057;border-color:#dee2e6}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
    </style>
</head>
<body>

    <div class="container">
        
        <div class="d-flex justify-content-between align-items-center">
            <h2 class="page-title">Manajemen Kelas</h2>
            <div>
                <a href="SiswaServlet" class="btn btn-outline-secondary">Kembali ke Siswa</a>
                <a href="LogoutServlet" class="btn btn-outline-danger">Logout</a>
            </div>
        </div>
        
        <div class="content-card">
            
            <a href="KelasServlet?action=new" class="btn btn-primary mb-4">
                Tambah Kelas Baru
            </a>
    
            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th>ID Kelas</th>
                        <th>Nama Kelas</th>
                        <th>Jurusan</th>
                        <th class="text-end">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="kls" items="${listKelas}">
                        <tr>
                            <td><c:out value="${kls.idKelas}" /></td>
                            <td><c:out value="${kls.namaKelas}" /></td>
                            <td><c:out value="${kls.namaJurusan}" /></td>
                            <td class="text-end">
                                <a href="KelasServlet?action=edit&id=<c:out value='${kls.idKelas}'/>" 
                                   class="btn btn-sm btn-outline-primary">Edit</a>
                                <a href="KelasServlet?action=delete&id=<c:out value='${kls.idKelas}'/>" 
                                   class="btn btn-sm btn-outline-danger ms-2" 
                                   onclick="return confirm('Yakin ingin menghapus kelas ini? Siswa di kelas ini akan kehilangan referensi kelas.')">Hapus</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty listKelas}">
                        <tr>
                            <td colspan="4" class="text-center text-muted p-4">
                                Belum ada data kelas.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>