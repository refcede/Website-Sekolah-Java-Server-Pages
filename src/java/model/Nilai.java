/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Nilai {
    private int idNilai;
    private int idSiswa;
    private int idMapel;
    private int nilaiAngka;
    
    // Helper field (untuk tampilan)
    private String namaMapel;

    public Nilai() {}

    public Nilai(int idNilai, int idSiswa, int idMapel, int nilaiAngka) {
        this.idNilai = idNilai;
        this.idSiswa = idSiswa;
        this.idMapel = idMapel;
        this.nilaiAngka = nilaiAngka;
    }

    // Getter Setter Lengkap (termasuk namaMapel)
    public int getIdNilai() { return idNilai; }
    public void setIdNilai(int idNilai) { this.idNilai = idNilai; }
    public int getIdSiswa() { return idSiswa; }
    public void setIdSiswa(int idSiswa) { this.idSiswa = idSiswa; }
    public int getIdMapel() { return idMapel; }
    public void setIdMapel(int idMapel) { this.idMapel = idMapel; }
    public int getNilaiAngka() { return nilaiAngka; }
    public void setNilaiAngka(int nilaiAngka) { this.nilaiAngka = nilaiAngka; }
    
    public String getNamaMapel() { return namaMapel; }
    public void setNamaMapel(String namaMapel) { this.namaMapel = namaMapel; }
}