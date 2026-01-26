// File: src/model/Jurusan.java
package model;

public class Jurusan {
    private int idJurusan;
    private String namaJurusan;

    // Konstruktor
    public Jurusan() {}
    
    public Jurusan(int idJurusan, String namaJurusan) {
        this.idJurusan = idJurusan;
        this.namaJurusan = namaJurusan;
    }

    // Getter dan Setter
    public int getIdJurusan() {
        return idJurusan;
    }
    public void setIdJurusan(int idJurusan) {
        this.idJurusan = idJurusan;
    }
    public String getNamaJurusan() {
        return namaJurusan;
    }
    public void setNamaJurusan(String namaJurusan) {
        this.namaJurusan = namaJurusan;
    }
}