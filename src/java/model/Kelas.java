package model;

public class Kelas {
    private int idKelas;
    private int idJurusan;
    private String namaKelas;
    private String foto;
    // Helper field (untuk JOIN)
    private String namaJurusan;

    public Kelas() {}

    // Getters dan Setters
    public int getIdKelas() { return idKelas; }
    public void setIdKelas(int idKelas) { this.idKelas = idKelas; }
    public int getIdJurusan() { return idJurusan; }
    public void setIdJurusan(int idJurusan) { this.idJurusan = idJurusan; }
    public String getNamaKelas() { return namaKelas; }
    public void setNamaKelas(String namaKelas) { this.namaKelas = namaKelas; }
    public String getNamaJurusan() { return namaJurusan; }
    public void setNamaJurusan(String namaJurusan) { this.namaJurusan = namaJurusan; }
    public String getFoto() { return foto; }
    public void setFoto(String foto) { this.foto = foto; }

}