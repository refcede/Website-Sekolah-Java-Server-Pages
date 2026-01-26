/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// File: src/model/MataPelajaran.java
package model;

public class MataPelajaran {

    // 1. Fields (Sesuai dengan tabel 'mata_pelajaran' di database)
    private int idMapel;
    private String namaMapel;

    // 2. Constructors
    
    /**
     * Konstruktor default (kosong).
     * Dibutuhkan oleh beberapa framework dan untuk membuat objek baru.
     */
    public MataPelajaran() {
    }

    /**
     * Konstruktor lengkap.
     * Berguna saat mengambil data dari DAO.
     */
    public MataPelajaran(int idMapel, String namaMapel) {
        this.idMapel = idMapel;
        this.namaMapel = namaMapel;
    }

    // 3. Getters and Setters
    // Dibutuhkan agar JSP (dengan <c:out>) dan Servlet bisa mengakses data.
    
    public int getIdMapel() {
        return idMapel;
    }

    public void setIdMapel(int idMapel) {
        this.idMapel = idMapel;
    }

    public String getNamaMapel() {
        return namaMapel;
    }

    public void setNamaMapel(String namaMapel) {
        this.namaMapel = namaMapel;
    }
}
