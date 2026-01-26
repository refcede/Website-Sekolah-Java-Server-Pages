// File: src/dao/UserDAO.java
package dao;

import model.User;
import util.KoneksiDB; // Pastikan package util Anda benar
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // --- CREATE ---
    // (Digunakan oleh fitur "Manajemen User")
    public void tambahUser(User user) {
        // id_siswa bisa NULL (untuk admin/guru) atau berisi ID (untuk siswa)
        String sql = "INSERT INTO user (id_siswa, username, password, role, nama_lengkap) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            if (user.getIdSiswa() == 0) {
                ps.setNull(1, java.sql.Types.INTEGER);
            } else {
                ps.setInt(1, user.getIdSiswa());
            }
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword()); // PERINGATAN: Password teks biasa!
            ps.setString(4, user.getRole());
            ps.setString(5, user.getNamaLengkap());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- READ (All) ---
    // (Digunakan oleh fitur "Manajemen User")
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        // Ambil data user, dan juga data 'nis' siswa jika terhubung
        String sql = "SELECT u.*, s.nis FROM user u " +
                     "LEFT JOIN siswa s ON u.id_siswa = s.id " +
                     "ORDER BY u.role, u.username";
                     
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setIdSiswa(rs.getInt("id_siswa"));
                user.setUsername(rs.getString("username"));
                user.setNamaLengkap(rs.getString("nama_lengkap"));
                user.setRole(rs.getString("role"));
                // (Kita tidak mengambil password demi keamanan)
                
                // (Anda perlu menambahkan 'nis' ke model User.java jika ingin ini berfungsi)
                // user.setNis(rs.getString("nis")); 
                
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    // --- READ (by ID) ---
    // (Digunakan oleh fitur "Manajemen User")
    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM user WHERE id = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setIdSiswa(rs.getInt("id_siswa"));
                    user.setUsername(rs.getString("username"));
                    user.setNamaLengkap(rs.getString("nama_lengkap"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // --- UPDATE ---
    // (Digunakan oleh fitur "Manajemen User")
    public void updateUser(User user) {
        // Update data user. Password tidak di-update di sini
        String sql = "UPDATE user SET id_siswa = ?, username = ?, role = ?, nama_lengkap = ? WHERE id = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            if (user.getIdSiswa() == 0) {
                ps.setNull(1, java.sql.Types.INTEGER);
            } else {
                ps.setInt(1, user.getIdSiswa());
            }
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getRole());
            ps.setString(4, user.getNamaLengkap());
            ps.setInt(5, user.getId());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- DELETE ---
    // (Digunakan oleh fitur "Manajemen User")
    public void hapusUser(int id) {
        String sql = "DELETE FROM user WHERE id = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // --- UPDATE PASSWORD ---
    /**
     * METODE BARU:
     * Mengubah password user berdasarkan username.
     * Dibutuhkan untuk fitur "Ganti Password".
     */
    public void updatePassword(String username, String newPassword) {
        // PERINGATAN: Menyimpan password sebagai teks biasa sangat tidak aman!
        String sql = "UPDATE user SET password = ? WHERE username = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}