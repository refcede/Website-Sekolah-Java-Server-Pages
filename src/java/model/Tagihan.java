package model;

public class Tagihan {
    private int idTagihan;
    private String namaTagihan;
    private double nominal;
    private String keterangan;

    public Tagihan() {}
    
    // Getter Setter
    public int getIdTagihan() { return idTagihan; }
    public void setIdTagihan(int idTagihan) { this.idTagihan = idTagihan; }
    public String getNamaTagihan() { return namaTagihan; }
    public void setNamaTagihan(String namaTagihan) { this.namaTagihan = namaTagihan; }
    public double getNominal() { return nominal; }
    public void setNominal(double nominal) { this.nominal = nominal; }
    public String getKeterangan() { return keterangan; }
    public void setKeterangan(String keterangan) { this.keterangan = keterangan; }
}