package model;
import java.util.Date;

public class Materi {
    private int id;
    private int idGuru;
    private int idKelas;
    private int idMapel;
    private String judul;
    private int pertemuanKe;
    private String namaFile;
    private Date tanggalUpload;
    
    // Helper fields (untuk menampilkan nama, bukan ID)
    private String namaGuru;
    private String namaKelas;
    private String namaMapel;

    public Materi() {}

    // Getter Setter Lengkap
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdGuru() { return idGuru; }
    public void setIdGuru(int idGuru) { this.idGuru = idGuru; }
    public int getIdKelas() { return idKelas; }
    public void setIdKelas(int idKelas) { this.idKelas = idKelas; }
    public int getIdMapel() { return idMapel; }
    public void setIdMapel(int idMapel) { this.idMapel = idMapel; }
    public String getJudul() { return judul; }
    public void setJudul(String judul) { this.judul = judul; }
    public int getPertemuanKe() { return pertemuanKe; }
    public void setPertemuanKe(int pertemuanKe) { this.pertemuanKe = pertemuanKe; }
    public String getNamaFile() { return namaFile; }
    public void setNamaFile(String namaFile) { this.namaFile = namaFile; }
    public Date getTanggalUpload() { return tanggalUpload; }
    public void setTanggalUpload(Date tanggalUpload) { this.tanggalUpload = tanggalUpload; }
    
    public String getNamaGuru() { return namaGuru; }
    public void setNamaGuru(String namaGuru) { this.namaGuru = namaGuru; }
    public String getNamaKelas() { return namaKelas; }
    public void setNamaKelas(String namaKelas) { this.namaKelas = namaKelas; }
    public String getNamaMapel() { return namaMapel; }
    public void setNamaMapel(String namaMapel) { this.namaMapel = namaMapel; }
}