<%-- File: WebContent/formKelas.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Kelas</title>
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
                    <c:if test="${kelas != null}">Edit Kelas</c:if>
                    <c:if test="${kelas == null}">Tambah Kelas Baru</c:if>
                </h2>

                <div class="content-card">
                    
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            <c:out value="${errorMessage}" />
                        </div>
                    </c:if>
                    
                    <form action="KelasServlet" method="post">
                        
                        <c:if test="${kelas != null}">
                            <input type="hidden" name="idKelas" value="<c:out value='${kelas.idKelas}' />" />
                            <input type="hidden" name="action" value="update" />
                        </c:if>
                        <c:if test="${kelas == null}">
                            <input type="hidden" name="action" value="insert" />
                        </c:if>
                        
                        <div class="mb-3">
                            <label for="idJurusan" class="form-label">Jurusan:</label>
                            <select class="form-select" id="idJurusan" name="idJurusan" required>
                                <option value="">-- Pilih Jurusan --</option>
                                <c:forEach var="jur" items="${listJurusan}">
                                    <option value="${jur.idJurusan}" ${jur.idJurusan == kelas.idJurusan ? 'selected' : ''}>
                                        <c:out value="${jur.namaJurusan}" />
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="namaKelas" class="form-label">Nama Kelas:</label>
                            <input type="text" class="form-control" id="namaKelas" name="namaKelas" 
                                   value="<c:out value='${kelas.namaKelas}' />" 
                                   placeholder="Contoh: 10-RPL-1" required>
                        </div>
                        
                        <hr class="my-4">
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="KelasServlet" class="btn btn-outline-secondary">Batal</a>
                            <button type="submit" class="btn btn-primary">Simpan Kelas</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>