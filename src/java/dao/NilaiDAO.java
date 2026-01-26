package dao;

import model.Nilai;
import model.MataPelajaran; // Pastikan Anda buat model ini
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NilaiDAO {

    // Ambil semua nilai milik Siswa X
    public List<Nilai> getNilaiBySiswa(int idSiswa) {
        List<Nilai> listNilai = new ArrayList<>();
        String sql = "SELECT n.*, m.nama_mapel " +
                     "FROM nilai n " +
                     "JOIN mata_pelajaran m ON n.id_mapel = m.id_mapel " +
                     "WHERE n.id_siswa = ?";
                     
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idSiswa);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Nilai n = new Nilai();
                n.setIdNilai(rs.getInt("id_nilai"));
                n.setIdSiswa(rs.getInt("id_siswa"));
                n.setIdMapel(rs.getInt("id_mapel"));
                n.setNilaiAngka(rs.getInt("nilai_angka"));
                n.setNamaMapel(rs.getString("nama_mapel")); // Dari JOIN
                listNilai.add(n);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return listNilai;
    }

    // Simpan Nilai (Cek dulu: jika sudah ada mapel tsb, UPDATE. Jika belum, INSERT)
    public void simpanNilai(Nilai nilai) {
        if (isNilaiExist(nilai.getIdSiswa(), nilai.getIdMapel())) {
            updateNilai(nilai);
        } else {
            insertNilai(nilai);
        }
    }

    private boolean isNilaiExist(int idSiswa, int idMapel) {
        String sql = "SELECT id_nilai FROM nilai WHERE id_siswa=? AND id_mapel=?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idSiswa);
            ps.setInt(2, idMapel);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    private void insertNilai(Nilai nilai) {
        String sql = "INSERT INTO nilai (id_siswa, id_mapel, nilai_angka) VALUES (?, ?, ?)";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, nilai.getIdSiswa());
            ps.setInt(2, nilai.getIdMapel());
            ps.setInt(3, nilai.getNilaiAngka());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    private void updateNilai(Nilai nilai) {
        String sql = "UPDATE nilai SET nilai_angka = ? WHERE id_siswa = ? AND id_mapel = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, nilai.getNilaiAngka());
            ps.setInt(2, nilai.getIdSiswa());
            ps.setInt(3, nilai.getIdMapel());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
    
    public void hapusNilai(int idNilai) {
        String sql = "DELETE FROM nilai WHERE id_nilai = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idNilai);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
    
    // Helper: Ambil daftar semua Mapel untuk Dropdown
   public List<MataPelajaran> getMapelByJurusanId(int idJurusan) {
        List<MataPelajaran> list = new ArrayList<>();
        
        // Query ini menggunakan JOIN 3 tabel
        String sql = "SELECT m.id_mapel, m.nama_mapel " +
                     "FROM mata_pelajaran m " +
                     "JOIN jurusan_mapel jm ON m.id_mapel = jm.id_mapel " +
                     "WHERE jm.id_jurusan = ?";
                     
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idJurusan);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                // Pastikan Anda punya model MataPelajaran.java
                list.add(new MataPelajaran(rs.getInt("id_mapel"), rs.getString("nama_mapel")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}