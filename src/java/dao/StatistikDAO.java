// File: src/dao/StatistikDAO.java
package dao;

import util.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class StatistikDAO {

    public Map<String, Integer> getAttendanceTotals() {
        Map<String, Integer> totals = new HashMap<>();
        // Hitung status ALPA, SAKIT, IZIN dari seluruh tabel absensi
        String sql = "SELECT status, COUNT(*) as count FROM absensi WHERE status IN ('Alpa', 'Sakit', 'Izin') GROUP BY status";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                totals.put(rs.getString("status"), rs.getInt("count"));
            }
            // Pastikan semua status punya nilai 0 jika tidak ada data
            totals.putIfAbsent("Alpa", 0);
            totals.putIfAbsent("Sakit", 0);
            totals.putIfAbsent("Izin", 0);
            
        } catch (Exception e) { e.printStackTrace(); }
        return totals;
    }
    
    private int getCount(String query) {
        int count = 0;
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getTotalSiswa() {
        return getCount("SELECT COUNT(*) FROM siswa");
    }

    public int getTotalJurusan() {
        return getCount("SELECT COUNT(*) FROM jurusan");
    }

    public int getTotalKelas() {
        return getCount("SELECT COUNT(*) FROM kelas");
    }

    public int getSiswaBaruHariIni() {
        // Query ini membandingkan tanggal_pendaftaran dengan tanggal hari ini
        return getCount("SELECT COUNT(*) FROM siswa WHERE DATE(tanggal_pendaftaran) = CURDATE()");
    }
}