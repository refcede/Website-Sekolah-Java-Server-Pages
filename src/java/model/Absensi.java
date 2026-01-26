/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

public class Absensi {
    private int idAbsensi;
    private int idSiswa;
    private Date tanggal;
    private String status;
    
    // Helper fields
    private String namaSiswa;
    private String nis;

    public Absensi() {}
    
    public String getNis() {
        return nis;
    }
    public void setNis(String nis) {
        this.nis = nis;
    }
      public int getIdAbsensi() {
        return idAbsensi;
    }
    public void setIdAbsensi(int idAbsensi) {
        this.idAbsensi = idAbsensi;
    }
    public int getIdSiswa() { return idSiswa; }
    public void setIdSiswa(int idSiswa) { this.idSiswa = idSiswa; }
    public Date getTanggal() { return tanggal; }
    public void setTanggal(Date tanggal) { this.tanggal = tanggal; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getNamaSiswa() { return namaSiswa; }
    public void setNamaSiswa(String namaSiswa) { this.namaSiswa = namaSiswa; }
  
}