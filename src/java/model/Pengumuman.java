package model;
import java.util.Date;
public class Pengumuman {
    private int id;
    private String judul;
    private String isi;
    private Date tanggalPost;
    
    public Pengumuman() {}
    
    // Getter & Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getJudul() { return judul; }
    public void setJudul(String judul) { this.judul = judul; }
    public String getIsi() { return isi; }
    public void setIsi(String isi) { this.isi = isi; }
    public Date getTanggalPost() { return tanggalPost; }
    public void setTanggalPost(Date tanggalPost) { this.tanggalPost = tanggalPost; }
}