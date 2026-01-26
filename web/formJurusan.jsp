<%-- File: WebContent/formJurusan.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Jurusan</title>
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
                    <c:if test="${jurusan != null}">Edit Jurusan</c:if>
                    <c:if test="${jurusan == null}">Tambah Jurusan Baru</c:if>
                </h2>

                <div class="content-card">
                    
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            <c:out value="${errorMessage}" />
                        </div>
                    </c:if>
                    
                    <form action="JurusanServlet" method="post">
                        
                        <c:if test="${jurusan != null}">
                            <input type="hidden" name="idJurusan" value="<c:out value='${jurusan.idJurusan}' />" />
                            <input type="hidden" name="action" value="update" />
                        </c:if>
                        <c:if test="${jurusan == null}">
                            <input type="hidden" name="action" value="insert" />
                        </c:if>
                        
                        <div class="mb-3">
                            <label for="namaJurusan" class="form-label">Nama Jurusan:</label>
                            <input type="text" class="form-control" id="namaJurusan" name="namaJurusan" 
                                   value="<c:out value='${jurusan.namaJurusan}' />" required>
                        </div>
                        
                        <hr class="my-4">
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="JurusanServlet" class="btn btn-outline-secondary">Batal</a>
                            <button type="submit" class="btn btn-primary">Simpan Jurusan</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>