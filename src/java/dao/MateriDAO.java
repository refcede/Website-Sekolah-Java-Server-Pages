package dao;

import model.Materi;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MateriDAO {

    public void uploadMateri(Materi m) {
        String sql = "INSERT INTO materi (id_guru, id_kelas, id_mapel, judul, pertemuan_ke, nama_file) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, m.getIdGuru());
            ps.setInt(2, m.getIdKelas());
            ps.setInt(3, m.getIdMapel());
            ps.setString(4, m.getJudul());
            ps.setInt(5, m.getPertemuanKe());
            ps.setString(6, m.getNamaFile());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Materi> getAllMateri() {
        List<Materi> list = new ArrayList<>();
        // JOIN 4 Tabel sekaligus agar infonya lengkap
        String sql = "SELECT m.*, u.nama_lengkap, k.nama_kelas, mp.nama_mapel " +
                     "FROM materi m " +
                     "JOIN user u ON m.id_guru = u.id " +
                     "JOIN kelas k ON m.id_kelas = k.id_kelas " +
                     "JOIN mata_pelajaran mp ON m.id_mapel = mp.id_mapel " +
                     "ORDER BY m.tanggal_upload DESC";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while(rs.next()) {
                Materi m = new Materi();
                m.setId(rs.getInt("id"));
                m.setJudul(rs.getString("judul"));
                m.setPertemuanKe(rs.getInt("pertemuan_ke"));
                m.setNamaFile(rs.getString("nama_file"));
                m.setTanggalUpload(rs.getTimestamp("tanggal_upload"));
                
                // Data Helper
                m.setNamaGuru(rs.getString("nama_lengkap"));
                m.setNamaKelas(rs.getString("nama_kelas"));
                m.setNamaMapel(rs.getString("nama_mapel"));
                
                list.add(m);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
    public void hapusMateri(int id) {
        // Hapus record dari database (file di folder harus dihapus manual atau pakai Java File IO)
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement("DELETE FROM materi WHERE id=?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}