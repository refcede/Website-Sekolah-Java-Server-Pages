package dao;

import model.Absensi;
import model.Siswa;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AbsensiDAO {

    /**
     * Mengambil daftar siswa per kelas, di-JOIN dengan status absensi mereka
     * pada tanggal tertentu.
     */
    public List<Absensi> getAbsensiByKelasAndDate(int idKelas, String tanggal) {
        List<Absensi> list = new ArrayList<>();
        // Query ini mengambil SEMUA siswa di kelas, lalu LEFT JOIN status absensi
        String sql = "SELECT s.id, s.nis, s.nama, a.status " +
                     "FROM siswa s " +
                     "LEFT JOIN absensi a ON s.id = a.id_siswa AND a.tanggal = ? " +
                     "WHERE s.id_kelas = ? " +
                     "ORDER BY s.nama";
                     
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setString(1, tanggal); // Tanggal dalam format 'YYYY-MM-DD'
            ps.setInt(2, idKelas);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                Absensi a = new Absensi();
                a.setIdSiswa(rs.getInt("id"));
                a.setNis(rs.getString("nis")); // (Helper)
                a.setNamaSiswa(rs.getString("nama")); // (Helper)
                a.setStatus(rs.getString("status")); // Akan NULL jika belum absen
                list.add(a);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    public List<Absensi> getAbsensiBySiswaId(int idSiswa) {
        List<Absensi> list = new ArrayList<>();
        // Urutkan berdasarkan tanggal, dari yang terbaru
        String sql = "SELECT * FROM absensi WHERE id_siswa = ? ORDER BY tanggal DESC";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, idSiswa);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                Absensi a = new Absensi();
                a.setIdAbsensi(rs.getInt("id_absensi"));
                a.setIdSiswa(rs.getInt("id_siswa"));
                // Pastikan field 'tanggal' di Absensi.java adalah java.util.Date
                a.setTanggal(rs.getDate("tanggal")); 
                a.setStatus(rs.getString("status"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Menyimpan absensi. Menggunakan ON DUPLICATE KEY UPDATE
     * untuk (INSERT jika baru, UPDATE jika sudah ada).
     */
    public void saveAbsensi(int idSiswa, String tanggal, String status) {
        String sql = "INSERT INTO absensi (id_siswa, tanggal, status) VALUES (?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE status = VALUES(status)";
                     
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, idSiswa);
            ps.setString(2, tanggal);
            ps.setString(3, status);
            ps.executeUpdate();
            
        } catch (SQLException e) { e.printStackTrace(); }
    }
}