<%-- File: WebContent/kelolaKurikulum.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kelola Kurikulum Jurusan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;background-color:#f8f9fa}.page-title{color:#0d6efd;font-weight:600;margin-bottom:1.5rem;padding-top:2rem}.content-card{background:#fff;padding:2.5rem;border-radius:12px;box-shadow:0 8px 16px rgba(0,0,0,.05);margin-top:2rem}.table thead{background-color:#e9ecef;color:#495057;border-color:#dee2e6}.btn-primary{background-color:#0d6efd;border:none;padding:10px 20px;font-weight:500;border-radius:8px}.btn-primary:hover{background-color:#0b5ed7}
    </style>
</head>
<body>

<div class="container">
    
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="page-title">Kelola Kurikulum Jurusan</h2>
        <div>
            <a href="JurusanServlet" class="btn btn-outline-secondary">Kembali ke Jurusan</a>
            <a href="LogoutServlet" class="btn btn-outline-danger">Logout</a>
        </div>
    </div>

    <div class="content-card mb-4">
        <h5 class="mb-3">Pilih Jurusan</h5>
        <form action="KurikulumServlet" method="get">
            <div class="input-group">
                <select name="idJurusan" class="form-select" onchange="this.form.submit()">
                    <option value="">-- Pilih Jurusan untuk Dikelola --</option>
                    <c:forEach var="jur" items="${listJurusan}">
                        <option value="${jur.idJurusan}" ${jur.idJurusan == jurusan.idJurusan ? 'selected' : ''}>
                            <c:out value="${jur.namaJurusan}" />
                        </option>
                    </c:forEach>
                </select>
            </div>
        </form>
    </div>
    
    <c:if test="${jurusan != null}">
        <div class="row">
            <div class="col-md-6">
                <div class="content-card">
                    <h5>Tambah Mata Pelajaran</h5>
                    <p>Mapel berikut **belum** ada di jurusan <c:out value="${jurusan.namaJurusan}"/></p>
                    
                    <form action="KurikulumServlet" method="post" class="mt-3">
                        <input type="hidden" name="idJurusan" value="${jurusan.idJurusan}">
                        <div class="input-group">
                            <select name="idMapel" class="form-select" required>
                                <option value="">-- Pilih Mapel untuk Ditambah --</option>
                                <c:forEach var="mapel" items="${availableMapel}">
                                    <option value="${mapel.idMapel}">
                                        <c:out value="${mapel.namaMapel}" />
                                    </option>
                                </c:forEach>
                            </select>
                            <button type="submit" class="btn btn-primary">Tambah</button>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="content-card">
                    <h5>Mata Pelajaran Saat Ini</h5>
                    <p>Mapel untuk jurusan <c:out value="${jurusan.namaJurusan}"/></p>
                    
                    <table class="table table-sm table-hover mt-3">
                        <tbody>
                            <c:forEach var="mapel" items="${assignedMapel}">
                                <tr>
                                    <td><c:out value="${mapel.namaMapel}" /></td>
                                    <td class="text-end">
                                        <a href="KurikulumServlet?action=remove&idJurusan=${jurusan.idJurusan}&idMapel=${mapel.idMapel}" 
                                           class="btn btn-sm btn-outline-danger"
                                           onclick="return confirm('Hapus ${mapel.namaMapel} dari jurusan ini?')">
                                           Hapus
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty assignedMapel}">
                                <tr><td class="text-center text-muted">Belum ada mapel</td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </c:if>

</div>
</body>
</html>