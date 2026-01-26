<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Pengguna</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            
            <h2 class="page-title">
                <c:if test="${user != null}">Edit Pengguna</c:if>
                <c:if test="${user == null}">Tambah Pengguna Baru</c:if>
            </h2>

            <div class="content-card">
                
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        <c:out value="${errorMessage}" />
                    </div>
                </c:if>
                
                <form action="UserServlet" method="post">
                    
                    <input type="hidden" name="action" value="${user != null ? 'update' : 'insert'}" />
                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                    </c:if>

                    <div class="mb-3">
                        <label for="namaLengkap" class="form-label">Nama Lengkap:</label>
                        <input type="text" class="form-control" id="namaLengkap" name="namaLengkap" 
                               value="<c:out value='${user.namaLengkap}' />" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" class="form-control" id="username" name="username" 
                               value="<c:out value='${user.username}' />" required>
                    </div>
                    
                    <c:if test="${user == null}">
                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                    </c:if>

                    <div class="mb-3">
                        <label for="role" class="form-label">Role (Peran):</label>
                        <select class="form-select" id="role" name="role" required onchange="toggleSiswaSelect()">
                            <option value="guru" ${user.role == 'guru' ? 'selected' : ''}>Guru</option>
                            <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                            <option value="siswa" ${user.role == 'siswa' ? 'selected' : ''}>Siswa</option>
                        </select>
                    </div>

                    <div class="mb-3" id="divSiswa">
                        <label for="idSiswa" class="form-label">Hubungkan ke Siswa (Wajib jika Role Siswa):</label>
                        <select class="form-select" id="idSiswa" name="idSiswa">
                            <option value="">-- Tidak Ada --</option>
                            <c:forEach var="siswa" items="${listSiswa}">
                                <option value="${siswa.id}" ${siswa.id == user.idSiswa ? 'selected' : ''}>
                                    <c:out value="${siswa.nama}" /> (NIS: <c:out value="${siswa.nis}" />)
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <hr class="my-4">
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="UserServlet" class="btn btn-outline-secondary">Batal</a>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleSiswaSelect() {
        var role = document.getElementById("role").value;
        var divSiswa = document.getElementById("divSiswa");
        // Logika visual sederhana (opsional)
        if (role === 'siswa') {
            divSiswa.style.display = "block";
        } else {
            // divSiswa.style.display = "none"; // Bisa disembunyikan jika mau
        }
    }
</script>

</body>
</html>