package dao;
import model.Pengumuman;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PengumumanDAO {
    
    public List<Pengumuman> getAllPengumuman() {
        List<Pengumuman> list = new ArrayList<>();
        // Ambil 10 terbaru
        String sql = "SELECT * FROM pengumuman ORDER BY tanggal_post DESC LIMIT 10";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Pengumuman p = new Pengumuman();
                p.setId(rs.getInt("id"));
                p.setJudul(rs.getString("judul"));
                p.setIsi(rs.getString("isi"));
                p.setTanggalPost(rs.getTimestamp("tanggal_post"));
                list.add(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public Pengumuman getPengumumanById(int id) {
        Pengumuman p = null;
        String sql = "SELECT * FROM pengumuman WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Pengumuman();
                    p.setId(rs.getInt("id"));
                    p.setJudul(rs.getString("judul"));
                    p.setIsi(rs.getString("isi"));
                    p.setTanggalPost(rs.getTimestamp("tanggal_post"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return p;
    }

    public void tambahPengumuman(Pengumuman p) {
        String sql = "INSERT INTO pengumuman (judul, isi) VALUES (?, ?)";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getJudul());
            ps.setString(2, p.getIsi());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void updatePengumuman(Pengumuman p) {
        String sql = "UPDATE pengumuman SET judul = ?, isi = ? WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getJudul());
            ps.setString(2, p.getIsi());
            ps.setInt(3, p.getId());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void hapusPengumuman(int id) {
        String sql = "DELETE FROM pengumuman WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}