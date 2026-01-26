// File: src/dao/MataPelajaranDAO.java
package dao;

import model.MataPelajaran;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MataPelajaranDAO {

    // --- CRUD untuk Mata Pelajaran (Opsional tapi bagus) ---
    
    // (Anda bisa tambahkan C, U, D untuk MataPelajaran di sini)

    // --- READ (All) ---
    public List<MataPelajaran> getAllMapel() {
        List<MataPelajaran> list = new ArrayList<>();
        String sql = "SELECT * FROM mata_pelajaran ORDER BY nama_mapel";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while(rs.next()) {
                list.add(new MataPelajaran(rs.getInt("id_mapel"), rs.getString("nama_mapel")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // --- LOGIKA KURIKULUM (PENTING) ---

    // 1. Ambil mapel yang SUDAH dimiliki jurusan
    public List<MataPelajaran> getMapelByJurusanId(int idJurusan) {
        List<MataPelajaran> list = new ArrayList<>();
        String sql = "SELECT m.id_mapel, m.nama_mapel " +
                     "FROM mata_pelajaran m " +
                     "JOIN jurusan_mapel jm ON m.id_mapel = jm.id_mapel " +
                     "WHERE jm.id_jurusan = ? ORDER BY m.nama_mapel";
                     
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idJurusan);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    list.add(new MataPelajaran(rs.getInt("id_mapel"), rs.getString("nama_mapel")));
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    // 2. Ambil mapel yang BELUM dimiliki jurusan (untuk dropdown "Tambah")
    public List<MataPelajaran> getAvailableMapel(int idJurusan) {
        List<MataPelajaran> list = new ArrayList<>();
        // Query ini menggunakan sub-query untuk mengecualikan mapel yg sudah ada
        String sql = "SELECT * FROM mata_pelajaran " +
                     "WHERE id_mapel NOT IN (" +
                     "    SELECT id_mapel FROM jurusan_mapel WHERE id_jurusan = ?" +
                     ") ORDER BY nama_mapel";
                     
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idJurusan);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    list.add(new MataPelajaran(rs.getInt("id_mapel"), rs.getString("nama_mapel")));
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // 3. Tambahkan mapel ke jurusan (INSERT ke tabel penghubung)
    public void addMapelToJurusan(int idJurusan, int idMapel) {
        String sql = "INSERT INTO jurusan_mapel (id_jurusan, id_mapel) VALUES (?, ?)";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idJurusan);
            ps.setInt(2, idMapel);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            // Abaikan error jika data sudah ada (Unique Key constraint)
            if (!e.getMessage().contains("Duplicate entry")) {
                e.printStackTrace();
            }
        }
    }

    // 4. Hapus mapel dari jurusan (DELETE dari tabel penghubung)
    public void removeMapelFromJurusan(int idJurusan, int idMapel) {
        String sql = "DELETE FROM jurusan_mapel WHERE id_jurusan = ? AND id_mapel = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idJurusan);
            ps.setInt(2, idMapel);
            ps.executeUpdate();
            
        } catch (SQLException e) { e.printStackTrace(); }
    }
}