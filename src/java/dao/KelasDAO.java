/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Kelas;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KelasDAO {

    // Ambil semua kelas dengan nama jurusannya
    public List<Kelas> getAllKelas() {
        List<Kelas> list = new ArrayList<>();
        String sql = "SELECT k.*, j.nama_jurusan FROM kelas k " +
                     "JOIN jurusan j ON k.id_jurusan = j.id_jurusan " +
                     "ORDER BY k.nama_kelas";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while(rs.next()) {
                Kelas k = new Kelas();
                k.setIdKelas(rs.getInt("id_kelas"));
                k.setIdJurusan(rs.getInt("id_jurusan"));
                k.setNamaKelas(rs.getString("nama_kelas"));
                k.setNamaJurusan(rs.getString("nama_jurusan"));
                list.add(k);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public Kelas getKelasById(int id) {
        Kelas k = null;
        String sql = "SELECT * FROM kelas WHERE id_kelas = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if(rs.next()) {
                    k = new Kelas();
                    k.setIdKelas(rs.getInt("id_kelas"));
                    k.setIdJurusan(rs.getInt("id_jurusan"));
                    k.setNamaKelas(rs.getString("nama_kelas"));
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return k;
    }
    
    public void tambahKelas(Kelas k) {
        String sql = "INSERT INTO kelas (id_jurusan, nama_kelas) VALUES (?, ?)";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, k.getIdJurusan());
            ps.setString(2, k.getNamaKelas());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
    
    public void updateKelas(Kelas k) {
        String sql = "UPDATE kelas SET id_jurusan = ?, nama_kelas = ? WHERE id_kelas = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, k.getIdJurusan());
            ps.setString(2, k.getNamaKelas());
            ps.setInt(3, k.getIdKelas());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    public void hapusKelas(int id) {
        String sql = "DELETE FROM kelas WHERE id_kelas = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
    
    // (Opsional) Ambil kelas berdasarkan jurusan, berguna untuk dropdown
    public List<Kelas> getKelasByJurusan(int idJurusan) {
        List<Kelas> list = new ArrayList<>();
        String sql = "SELECT * FROM kelas WHERE id_jurusan = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idJurusan);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    Kelas k = new Kelas();
                    k.setIdKelas(rs.getInt("id_kelas"));
                    k.setIdJurusan(rs.getInt("id_jurusan"));
                    k.setNamaKelas(rs.getString("nama_kelas"));
                    list.add(k);
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
}