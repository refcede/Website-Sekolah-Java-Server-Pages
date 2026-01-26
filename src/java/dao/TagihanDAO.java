package dao;
import model.Tagihan;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TagihanDAO {
    public List<Tagihan> getAllTagihan() {
        List<Tagihan> list = new ArrayList<>();
        try (Connection c = KoneksiDB.getConnection();
             Statement s = c.createStatement();
             ResultSet rs = s.executeQuery("SELECT * FROM tagihan ORDER BY nama_tagihan")) {
            while(rs.next()) {
                Tagihan t = new Tagihan();
                t.setIdTagihan(rs.getInt("id_tagihan"));
                t.setNamaTagihan(rs.getString("nama_tagihan"));
                t.setNominal(rs.getDouble("nominal"));
                t.setKeterangan(rs.getString("keterangan"));
                list.add(t);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    // Tambahkan method tambahTagihan, updateTagihan, hapusTagihan jika perlu
    public Tagihan getTagihanById(int id) {
        Tagihan t = null;
        String sql = "SELECT * FROM tagihan WHERE id_tagihan = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    t = new Tagihan();
                    t.setIdTagihan(rs.getInt("id_tagihan"));
                    t.setNamaTagihan(rs.getString("nama_tagihan"));
                    t.setNominal(rs.getDouble("nominal"));
                    t.setKeterangan(rs.getString("keterangan"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }
}