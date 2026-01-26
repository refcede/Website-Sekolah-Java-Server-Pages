/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Jurusan;
import util.KoneksiDB; // Sesuaikan dengan package util Anda
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JurusanDAO {

    // --- CREATE ---
    public void tambahJurusan(Jurusan jurusan) {
        String sql = "INSERT INTO jurusan (nama_jurusan) VALUES (?)";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, jurusan.getNamaJurusan());
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- READ (All) ---
    public List<Jurusan> getAllJurusan() {
        List<Jurusan> listJurusan = new ArrayList<>();
        String sql = "SELECT * FROM jurusan ORDER BY nama_jurusan"; // Urutkan A-Z
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                int id = rs.getInt("id_jurusan");
                String nama = rs.getString("nama_jurusan");
                listJurusan.add(new Jurusan(id, nama));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listJurusan;
    }

    // --- READ (By ID) ---
    public Jurusan getJurusanById(int id) {
        Jurusan jurusan = null;
        String sql = "SELECT * FROM jurusan WHERE id_jurusan = ?";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String nama = rs.getString("nama_jurusan");
                    jurusan = new Jurusan(id, nama);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jurusan;
    }

    // --- UPDATE ---
    public void updateJurusan(Jurusan jurusan) {
        String sql = "UPDATE jurusan SET nama_jurusan = ? WHERE id_jurusan = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, jurusan.getNamaJurusan());
            ps.setInt(2, jurusan.getIdJurusan());
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- DELETE ---
    public void hapusJurusan(int id) {
        // PENTING: Pikirkan apa yg terjadi pada siswa di jurusan ini.
        // Berdasarkan SQL kita (ON DELETE SET NULL), id_jurusan siswa akan jadi NULL.
        String sql = "DELETE FROM jurusan WHERE id_jurusan = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}