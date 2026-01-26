package model;
import java.util.Date;

public class Pembayaran {
    private int idPembayaran;
    private int idSiswa;
    private int idTagihan;
    private Date tanggalBayar;
    private int bulan;
    private int tahun;
    private double jumlahBayar;
    private int idUserAdmin;
    
    // Helper
    private String namaTagihan;
    private String status;
    private String metodePembayaran;

    public Pembayaran() {}
    
    // Getter Setter Lengkap...
    public int getIdPembayaran() { return idPembayaran; }
    public void setIdPembayaran(int id) { this.idPembayaran = id; }
    public int getIdSiswa() { return idSiswa; }
    public void setIdSiswa(int id) { this.idSiswa = id; }
    public int getIdTagihan() { return idTagihan; }
    public void setIdTagihan(int id) { this.idTagihan = id; }
    public Date getTanggalBayar() { return tanggalBayar; }
    public void setTanggalBayar(Date d) { this.tanggalBayar = d; }
    public int getBulan() { return bulan; }
    public void setBulan(int b) { this.bulan = b; }
    public int getTahun() { return tahun; }
    public void setTahun(int t) { this.tahun = t; }
    public double getJumlahBayar() { return jumlahBayar; }
    public void setJumlahBayar(double j) { this.jumlahBayar = j; }
    public int getIdUserAdmin() { return idUserAdmin; }
    public void setIdUserAdmin(int id) { this.idUserAdmin = id; }
    public String getNamaTagihan() { return namaTagihan; }
    public void setNamaTagihan(String n) { this.namaTagihan = n; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getMetodePembayaran() { return metodePembayaran; }
    public void setMetodePembayaran(String mp) { this.metodePembayaran = mp; }
}