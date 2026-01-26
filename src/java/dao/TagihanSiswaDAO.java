package dao;

import model.TagihanSiswa; // Pastikan Model ini sudah ada/diupdate
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TagihanSiswaDAO {

    // --- 1. GENERATE SPP 1 TAHUN ---
    public void generateSppSatuTahun(int idSiswa, int idTagihanSPP, int tahunMulai) {
        String sql = "INSERT INTO tagihan_siswa (id_siswa, id_tagihan, bulan, tahun, status) VALUES (?, ?, ?, ?, 'Belum Lunas')";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            int[] urutanBulan = {7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6};
            
            for (int bln : urutanBulan) {
                int thn = (bln < 7) ? (tahunMulai + 1) : tahunMulai;
                
                if (!isTagihanExist(idSiswa, idTagihanSPP, bln, thn)) {
                    ps.setInt(1, idSiswa);
                    ps.setInt(2, idTagihanSPP);
                    ps.setInt(3, bln);
                    ps.setInt(4, thn);
                    ps.executeUpdate();
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
    }    

    // Helper untuk cek duplikat
    private boolean isTagihanExist(int idSiswa, int idTagihan, int bulan, int tahun) {
        String sql = "SELECT id FROM tagihan_siswa WHERE id_siswa=? AND id_tagihan=? AND bulan=? AND tahun=?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idSiswa); ps.setInt(2, idTagihan); ps.setInt(3, bulan); ps.setInt(4, tahun);
            try (ResultSet rs = ps.executeQuery()) { return rs.next(); }
        } catch (Exception e) { return false; }
    }

    // --- 2. Admin menambahkan tagihan manual ke siswa ---
    public void tambahTagihanSiswa(int idSiswa, int idTagihan, int bulan, int tahun) {
        String sql = "INSERT INTO tagihan_siswa (id_siswa, id_tagihan, bulan, tahun, status) VALUES (?, ?, ?, ?, 'Belum Lunas')";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idSiswa);
            ps.setInt(2, idTagihan);
            ps.setInt(3, bulan);
            ps.setInt(4, tahun);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    // --- 3. Hitung TOTAL tagihan yang Belum Lunas untuk bulan tertentu ---
    public double getTotalTagihanBulanan(int idSiswa, int bulan, int tahun) {
        double total = 0;
        String sql = "SELECT SUM(t.nominal) FROM tagihan_siswa ts " +
                     "JOIN tagihan t ON ts.id_tagihan = t.id_tagihan " +
                     "WHERE ts.id_siswa = ? AND ts.bulan = ? AND ts.tahun = ? AND ts.status = 'Belum Lunas'";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idSiswa);
            ps.setInt(2, bulan);
            ps.setInt(3, tahun);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) total = rs.getDouble(1);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return total;
    }

    // --- 4. Cek Status Bulan ini (Lunas/Belum/Kosong) ---
    public String getStatusBulan(int idSiswa, int bulan, int tahun) {
        String sqlCheck = "SELECT COUNT(*) FROM tagihan_siswa WHERE id_siswa=? AND bulan=? AND tahun=?";
        String sqlBelum = "SELECT COUNT(*) FROM tagihan_siswa WHERE id_siswa=? AND bulan=? AND tahun=? AND status='Belum Lunas'";
        
        try (Connection c = KoneksiDB.getConnection()) {
            try (PreparedStatement ps = c.prepareStatement(sqlCheck)) {
                ps.setInt(1, idSiswa); ps.setInt(2, bulan); ps.setInt(3, tahun);
                ResultSet rs = ps.executeQuery();
                rs.next();
                if (rs.getInt(1) == 0) return "Kosong"; 
            }
            
            try (PreparedStatement ps = c.prepareStatement(sqlBelum)) {
                ps.setInt(1, idSiswa); ps.setInt(2, bulan); ps.setInt(3, tahun);
                ResultSet rs = ps.executeQuery();
                rs.next();
                if (rs.getInt(1) > 0) return "Belum Lunas";
                else return "Lunas";
            }
        } catch (SQLException e) { return "Error"; }
    }

    // --- 5. Update Status jadi Lunas (Via Payment Gateway) ---
    public void lunasiTagihanBulan(int idSiswa, int bulan, int tahun) {
        String sql = "UPDATE tagihan_siswa SET status = 'Lunas' WHERE id_siswa=? AND bulan=? AND tahun=?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idSiswa); ps.setInt(2, bulan); ps.setInt(3, tahun);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
    
    // --- 6. Ambil detail rincian tagihan ---
    public List<String> getRincianTagihan(int idSiswa, int bulan, int tahun) {
        List<String> rincian = new ArrayList<>();
        String sql = "SELECT t.nama_tagihan, t.nominal FROM tagihan_siswa ts " +
                     "JOIN tagihan t ON ts.id_tagihan = t.id_tagihan " +
                     "WHERE ts.id_siswa=? AND ts.bulan=? AND ts.tahun=?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idSiswa); ps.setInt(2, bulan); ps.setInt(3, tahun);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                rincian.add(rs.getString("nama_tagihan") + " (Rp " + rs.getDouble("nominal") + ")");
            }
        } catch (Exception e) {}
        return rincian;
    }

    // ============================================================
    // === FITUR BARU: UNTUK ADMIN MENGELOLA TAGIHAN ===
    // ============================================================

    // --- 7. AMBIL DAFTAR TAGIHAN PER SISWA (LENGKAP DENGAN NAMA TAGIHAN) ---
    public List<TagihanSiswa> getAllTagihanBySiswa(int idSiswa) {
        List<TagihanSiswa> list = new ArrayList<>();
        String sql = "SELECT ts.*, t.nama_tagihan, t.nominal FROM tagihan_siswa ts " +
                     "JOIN tagihan t ON ts.id_tagihan = t.id_tagihan " +
                     "WHERE ts.id_siswa = ? ORDER BY ts.tahun DESC, ts.bulan DESC";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idSiswa);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                TagihanSiswa ts = new TagihanSiswa();
                ts.setId(rs.getInt("id"));
                ts.setIdSiswa(rs.getInt("id_siswa"));
                ts.setIdTagihan(rs.getInt("id_tagihan"));
                ts.setBulan(rs.getInt("bulan"));
                ts.setTahun(rs.getInt("tahun"));
                ts.setStatus(rs.getString("status"));
                
                // Data dari JOIN (Pastikan model TagihanSiswa punya field ini)
                ts.setNamaTagihan(rs.getString("nama_tagihan"));
                ts.setNominal(rs.getDouble("nominal"));
                
                list.add(ts);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // --- 8. UPDATE STATUS TAGIHAN MANUAL (OLEH ADMIN) ---
    public void updateStatusTagihan(int id, String status) {
        String sql = "UPDATE tagihan_siswa SET status = ? WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // --- 9. HAPUS TAGIHAN (OLEH ADMIN) ---
    public void hapusTagihanSiswa(int id) {
        String sql = "DELETE FROM tagihan_siswa WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}