package model;

public class TagihanSiswa {
    private int id;
    private int idSiswa;
    private int idTagihan;
    private int bulan;
    private int tahun;
    private String status; // 'Lunas', 'Belum Lunas'
    
    // Helper Fields (Untuk Data JOIN)
    private String namaTagihan;
    private double nominal;

    public TagihanSiswa() {}

    // Getter & Setter Standar
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdSiswa() { return idSiswa; }
    public void setIdSiswa(int idSiswa) { this.idSiswa = idSiswa; }
    public int getIdTagihan() { return idTagihan; }
    public void setIdTagihan(int idTagihan) { this.idTagihan = idTagihan; }
    public int getBulan() { return bulan; }
    public void setBulan(int bulan) { this.bulan = bulan; }
    public int getTahun() { return tahun; }
    public void setTahun(int tahun) { this.tahun = tahun; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    // Getter & Setter Helper
    public String getNamaTagihan() { return namaTagihan; }
    public void setNamaTagihan(String namaTagihan) { this.namaTagihan = namaTagihan; }
    public double getNominal() { return nominal; }
    public void setNominal(double nominal) { this.nominal = nominal; }
}