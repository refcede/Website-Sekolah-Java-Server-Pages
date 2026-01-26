// File: src/dao/LoginDAO.java
package dao;

import model.User; // <-- Import model baru
import util.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    
    /**
     * Metode baru: Memvalidasi user dan mengembalikan data lengkapnya.
     * Menggantikan metode 'validasi(user, pass)' yang lama.
     */
    public User getUser(String username, String password) {
        User user = null;
        String sql = "SELECT id, username, nama_lengkap, role, id_siswa FROM user " + // <-- Tambah id_siswa
                 "WHERE username = ? AND password = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                // Jika data ditemukan, isi object User
                if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setNamaLengkap(rs.getString("nama_lengkap"));
                user.setRole(rs.getString("role"));
                user.setIdSiswa(rs.getInt("id_siswa")); // <-- TAMBAHKAN INI
            }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user; // Akan 'null' jika tidak ditemukan
    }
}