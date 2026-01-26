// File: src/model/Siswa.java
package model;

public class Siswa {
    private int id;
    private String nis;
    private String nama;
    private String email;
    private String noTelp;
    private int idJurusan;
    private String namaJurusan;
    private int idKelas;
    private String namaKelas;
    
    // --- TAMBAHAN BARU UNTUK FOTO ---
    private String foto;
    // --------------------------------

    public Siswa() {}

    // ... (Getter/Setter untuk id, nis, nama, email, noTelp, dll yang sudah ada) ...

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNis() { return nis; }
    public void setNis(String nis) { this.nis = nis; }
    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getNoTelp() { return noTelp; }
    public void setNoTelp(String noTelp) { this.noTelp = noTelp; }
    public int getIdJurusan() { return idJurusan; }
    public void setIdJurusan(int idJurusan) { this.idJurusan = idJurusan; }
    public String getNamaJurusan() { return namaJurusan; }
    public void setNamaJurusan(String namaJurusan) { this.namaJurusan = namaJurusan; }
    public int getIdKelas() { return idKelas; }
    public void setIdKelas(int idKelas) { this.idKelas = idKelas; }
    public String getNamaKelas() { return namaKelas; }
    public void setNamaKelas(String namaKelas) { this.namaKelas = namaKelas; }

    // --- TAMBAHKAN GETTER & SETTER UNTUK FOTO INI ---
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    // ------------------------------------------------
}   