<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <c:if test="${siswa != null}">Edit Siswa</c:if>
        <c:if test="${siswa == null}">Tambah Siswa</c:if>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; background-color: #f8f9fa; }
        .page-title { color: #0d6efd; font-weight: 600; margin-bottom: 1.5rem; padding-top: 2rem; }
        .content-card { background: #fff; padding: 2.5rem; border-radius: 12px; box-shadow: 0 8px 16px rgba(0,0,0,0.05); margin-top: 2rem; }
        .btn-primary { background-color: #0d6efd; border: none; padding: 10px 20px; font-weight: 500; border-radius: 8px; }
        .btn-primary:hover { background-color: #0b5ed7; }
        
        /* Style untuk gambar thumbnail BULAT */
        .img-thumbnail-preview { 
            width: 120px; /* Saya perbesar sedikit agar lebih jelas */
            height: 120px; 
            object-fit: cover; 
            border: 3px solid #dee2e6; /* Sedikit dipertebal bordernya */
            padding: .25rem; 
            border-radius: 50%; /* INI YANG MEMBUAT FOTO JADI BULAT */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <h2 class="page-title">
                <c:if test="${siswa != null}">Edit Siswa</c:if>
                <c:if test="${siswa == null}">Tambah Siswa</c:if>
            </h2>
            <div class="content-card">
                <form action="SiswaServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="${siswa != null ? 'update' : 'insert'}" />
                    <c:if test="${siswa != null}">
                        <input type="hidden" name="id" value="${siswa.id}" />
                        <input type="hidden" name="fotoLama" value="${siswa.foto}" /> 
                    </c:if>
                    
                    <div class="mb-3">
                        <label for="nis" class="form-label">NIS:</label>
                        <input type="text" class="form-control" id="nis" name="nis" 
                               value="<c:out value='${siswa.nis}'/>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="nama" class="form-label">Nama Siswa:</label>
                        <input type="text" class="form-control" id="nama" name="nama" 
                               value="<c:out value='${siswa.nama}'/>" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" 
                               value="<c:out value='${siswa.email}' />" placeholder="siswa@sekolah.sch.id">
                    </div>

                    <div class="mb-3">
                        <label for="noTelp" class="form-label">Nomor Telepon / WA:</label>
                        <input type="text" class="form-control" id="noTelp" name="noTelp" 
                               value="<c:out value='${siswa.noTelp}' />" placeholder="08xxxxxxxxxx">
                    </div>

                    <%-- Dropdown Jurusan --%>
                    <div class="mb-3">
                        <label for="id_jurusan" class="form-label">Jurusan:</label>
                        <select class="form-select" id="id_jurusan" name="id_jurusan" required>
                            <option value="">Pilih Jurusan</option>
                            <c:forEach var="jurusan" items="${listJurusan}">
                                <option value="<c:out value='${jurusan.idJurusan}'/>"
                                    <c:if test="${siswa != null && siswa.idJurusan == jurusan.idJurusan}">selected</c:if>>
                                    <c:out value='${jurusan.namaJurusan}'/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <%-- Dropdown Kelas --%>
                    <div class="mb-3">
                        <label for="id_kelas" class="form-label">Kelas:</label>
                        <select class="form-select" id="id_kelas" name="id_kelas">
                            <option value="0">Pilih Kelas (Opsional)</option>
                            <c:forEach var="kelas" items="${listKelas}">
                                <option value="<c:out value='${kelas.idKelas}'/>"
                                    <c:if test="${siswa != null && siswa.idKelas == kelas.idKelas}">selected</c:if>>
                                    <c:out value='${kelas.namaKelas}'/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label for="foto" class="form-label">Foto Siswa:</label>
                        <input type="file" class="form-control" id="foto" name="foto" accept="image/*">
                        <small class="text-muted">Format: JPG/PNG. Max 2MB.</small>
                    </div>

                    <%-- Bagian Preview Foto --%>
                    <div class="d-flex justify-content-center mb-4">
                        <c:if test="${not empty siswa.foto}">
                            <div class="text-center">
                                <label class="form-label d-block fw-bold mb-2">Foto Saat Ini:</label>
                                <img src="foto_siswa/<c:out value='${siswa.foto}' />" 
                                     alt="Foto Siswa" 
                                     class="img-thumbnail-preview shadow-sm">
                            </div>
                        </c:if>
                        
                        <c:if test="${empty siswa.foto}">
                            <div class="text-center">
                                <label class="form-label d-block fw-bold mb-2">Foto Saat Ini:</label>
                                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" 
                                     alt="Default Avatar" 
                                     class="img-thumbnail-preview shadow-sm opacity-50">
                            </div>
                        </c:if>
                    </div>

                    <hr class="my-4">
                    
                    <div class="d-flex justify-content-end">
                        <a href="SiswaServlet" class="btn btn-outline-secondary me-2">Batal</a>
                        <button type="submit" class="btn btn-primary">Simpan Siswa</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>