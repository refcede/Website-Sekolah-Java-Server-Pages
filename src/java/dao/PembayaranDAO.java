package dao;

import model.Pembayaran;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PembayaranDAO {

    // --- 1. TAMBAH PEMBAYARAN ---
    public void tambahPembayaran(Pembayaran p) {
        String sql = "INSERT INTO pembayaran (id_siswa, id_tagihan, tanggal_bayar, bulan, tahun, jumlah_bayar, id_user_admin, status, metode_pembayaran) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, p.getIdSiswa());
            ps.setInt(2, p.getIdTagihan());
            ps.setDate(3, new java.sql.Date(p.getTanggalBayar().getTime()));
            
            if (p.getBulan() == 0) ps.setNull(4, java.sql.Types.INTEGER);
            else ps.setInt(4, p.getBulan());
            
            if (p.getTahun() == 0) ps.setNull(5, java.sql.Types.INTEGER);
            else ps.setInt(5, p.getTahun());
            
            ps.setDouble(6, p.getJumlahBayar());
            
            if (p.getIdUserAdmin() == 0) ps.setNull(7, java.sql.Types.INTEGER);
            else ps.setInt(7, p.getIdUserAdmin());

            ps.setString(8, p.getStatus());
            ps.setString(9, p.getMetodePembayaran());
            
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    // --- 2. UPDATE STATUS PEMBAYARAN ---
    public void updateStatusPembayaran(int idPembayaran, String statusBaru) {
        String sql = "UPDATE pembayaran SET status = ? WHERE id_pembayaran = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, statusBaru);
            ps.setInt(2, idPembayaran);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    // --- 3. AMBIL HISTORY PEMBAYARAN SISWA ---
    public List<Pembayaran> getPembayaranBySiswa(int idSiswa) {
        List<Pembayaran> list = new ArrayList<>();
        String sql = "SELECT p.*, t.nama_tagihan FROM pembayaran p " +
                     "JOIN tagihan t ON p.id_tagihan = t.id_tagihan " +
                     "WHERE p.id_siswa = ? ORDER BY p.tanggal_bayar DESC";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, idSiswa);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    Pembayaran p = new Pembayaran();
                    p.setIdPembayaran(rs.getInt("id_pembayaran"));
                    p.setIdSiswa(rs.getInt("id_siswa"));
                    p.setIdTagihan(rs.getInt("id_tagihan"));
                    p.setTanggalBayar(rs.getDate("tanggal_bayar"));
                    p.setBulan(rs.getInt("bulan"));
                    p.setTahun(rs.getInt("tahun"));
                    p.setJumlahBayar(rs.getDouble("jumlah_bayar"));
                    p.setNamaTagihan(rs.getString("nama_tagihan"));
                    p.setStatus(rs.getString("status"));
                    p.setMetodePembayaran(rs.getString("metode_pembayaran"));
                    list.add(p);
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    
    // --- 4. CEK STATUS PENDING ---
    public boolean isPending(int idSiswa, int bulan, int tahun) {
        String sql = "SELECT id_pembayaran FROM pembayaran " +
                     "WHERE id_siswa = ? AND bulan = ? AND tahun = ? AND status = 'pending'";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idSiswa);
            ps.setInt(2, bulan);
            ps.setInt(3, tahun);
            try(ResultSet rs = ps.executeQuery()){ return rs.next(); }
        } catch (Exception e) { return false; }
    }
// --- METODE BARU: AMBIL SEMUA PEMBAYARAN LUNAS ---
    public List<Pembayaran> getPembayaranLunasBySiswa(int idSiswa) {
        List<Pembayaran> list = new ArrayList<>();
        String sql = "SELECT p.*, t.nama_tagihan FROM pembayaran p " +
                     "JOIN tagihan t ON p.id_tagihan = t.id_tagihan " +
                     "WHERE p.id_siswa = ? AND p.status = 'lunas' " +
                     "ORDER BY p.tanggal_bayar DESC";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, idSiswa);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    Pembayaran p = new Pembayaran();
                    p.setIdPembayaran(rs.getInt("id_pembayaran"));
                    p.setTanggalBayar(rs.getDate("tanggal_bayar"));
                    p.setJumlahBayar(rs.getDouble("jumlah_bayar"));
                    p.setMetodePembayaran(rs.getString("metode_pembayaran"));
                    p.setNamaTagihan(rs.getString("nama_tagihan"));
                    p.setBulan(rs.getInt("bulan"));
                    p.setTahun(rs.getInt("tahun"));
                    list.add(p);
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
    // --- 5. METODE BARU: AMBIL DETAIL UNTUK KWITANSI ---
    public Pembayaran getPembayaranDetail(int idSiswa, int bulan, int tahun) {
        Pembayaran p = null;
        String sql = "SELECT p.*, t.nama_tagihan FROM pembayaran p " +
                     "JOIN tagihan t ON p.id_tagihan = t.id_tagihan " +
                     "WHERE p.id_siswa = ? AND p.bulan = ? AND p.tahun = ? AND p.status = 'lunas'";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, idSiswa);
            ps.setInt(2, bulan);
            ps.setInt(3, tahun);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Pembayaran();
                    p.setIdPembayaran(rs.getInt("id_pembayaran"));
                    p.setTanggalBayar(rs.getDate("tanggal_bayar"));
                    p.setJumlahBayar(rs.getDouble("jumlah_bayar"));
                    p.setMetodePembayaran(rs.getString("metode_pembayaran"));
                    p.setNamaTagihan(rs.getString("nama_tagihan"));
                    p.setBulan(rs.getInt("bulan"));
                    p.setTahun(rs.getInt("tahun"));
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return p;
    }
}