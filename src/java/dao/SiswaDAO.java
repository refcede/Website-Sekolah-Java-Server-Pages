package dao;

import model.Siswa;
import util.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SiswaDAO {

    // --- 1. CREATE (Tambah Siswa) ---
    public void tambahSiswa(Siswa siswa) {
        // Query lengkap dengan email, no_telp, dan foto
        String sql = "INSERT INTO siswa (nis, nama, email, no_telp, id_jurusan, id_kelas, foto) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, siswa.getNis());
            ps.setString(2, siswa.getNama());
            ps.setString(3, siswa.getEmail());
            ps.setString(4, siswa.getNoTelp());
            ps.setInt(5, siswa.getIdJurusan());

            // Logika: Jika idKelas 0 (tidak dipilih), simpan sebagai NULL di database
            if (siswa.getIdKelas() == 0) {
                ps.setNull(6, java.sql.Types.INTEGER);
            } else {
                ps.setInt(6, siswa.getIdKelas());
            }

            ps.setString(7, siswa.getFoto()); // Nama file foto
            
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --- 2. READ ALL (Ambil Semua Siswa dengan JOIN) ---
    public List<Siswa> getAllSiswa() {
        List<Siswa> listSiswa = new ArrayList<>();
        // JOIN dengan tabel jurusan dan kelas untuk mendapatkan nama aslinya
        String sql = "SELECT s.*, j.nama_jurusan, k.nama_kelas " +
                     "FROM siswa s " +
                     "LEFT JOIN jurusan j ON s.id_jurusan = j.id_jurusan " +
                     "LEFT JOIN kelas k ON s.id_kelas = k.id_kelas " +
                     "ORDER BY s.nama ASC";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Siswa siswa = new Siswa();
                siswa.setId(rs.getInt("id"));
                siswa.setNis(rs.getString("nis"));
                siswa.setNama(rs.getString("nama"));
                siswa.setEmail(rs.getString("email"));
                siswa.setNoTelp(rs.getString("no_telp"));
                
                siswa.setIdJurusan(rs.getInt("id_jurusan"));
                siswa.setNamaJurusan(rs.getString("nama_jurusan")); // Dari JOIN
                
                siswa.setIdKelas(rs.getInt("id_kelas"));
                siswa.setNamaKelas(rs.getString("nama_kelas")); // Dari JOIN
                
                siswa.setFoto(rs.getString("foto"));
                
                listSiswa.add(siswa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listSiswa;
    }

    // --- 3. READ BY ID (Untuk Form Edit - Tanpa JOIN) ---
    public Siswa getSiswaById(int id) {
        Siswa siswa = null; 
        String sql = "SELECT * FROM siswa WHERE id = ?"; 

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                // Perbaikan: Pastikan semua setter ada DI DALAM blok if
                if (rs.next()) {
                    siswa = new Siswa(); 
                    siswa.setId(rs.getInt("id"));
                    siswa.setNis(rs.getString("nis"));
                    siswa.setNama(rs.getString("nama"));
                    siswa.setEmail(rs.getString("email"));
                    siswa.setNoTelp(rs.getString("no_telp"));
                    siswa.setIdJurusan(rs.getInt("id_jurusan"));
                    siswa.setIdKelas(rs.getInt("id_kelas"));
                    siswa.setFoto(rs.getString("foto"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return siswa; 
    }

    // --- 4. READ BY ID WITH JOIN (Untuk Profil/Dasbor - Lengkap) ---
    public Siswa getSiswaByIdWithJoin(int id) {
        Siswa siswa = null; 
        String sql = "SELECT s.*, j.nama_jurusan, k.nama_kelas " +
                     "FROM siswa s " +
                     "LEFT JOIN jurusan j ON s.id_jurusan = j.id_jurusan " +
                     "LEFT JOIN kelas k ON s.id_kelas = k.id_kelas " +
                     "WHERE s.id = ?"; 

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    siswa = new Siswa();
                    siswa.setId(rs.getInt("id"));
                    siswa.setNis(rs.getString("nis"));
                    siswa.setNama(rs.getString("nama"));
                    siswa.setEmail(rs.getString("email"));
                    siswa.setNoTelp(rs.getString("no_telp"));
                    
                    siswa.setIdJurusan(rs.getInt("id_jurusan"));
                    siswa.setNamaJurusan(rs.getString("nama_jurusan")); 
                    
                    siswa.setIdKelas(rs.getInt("id_kelas"));
                    siswa.setNamaKelas(rs.getString("nama_kelas"));
                    
                    siswa.setFoto(rs.getString("foto"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return siswa;
    }
    
    // --- 5. READ BY NIS (Khusus Fitur Scan Absensi) ---
    public Siswa getSiswaByNis(String nis) {
        Siswa siswa = null;
        String sql = "SELECT * FROM siswa WHERE nis = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, nis);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    siswa = new Siswa();
                    siswa.setId(rs.getInt("id"));
                    siswa.setNis(rs.getString("nis"));
                    siswa.setNama(rs.getString("nama"));
                    // Data lain tidak wajib untuk keperluan absensi
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return siswa;
    }

    // --- 6. UPDATE (Edit Siswa) ---
    // Method untuk Mengupdate Data Siswa
    public boolean updateSiswa(Siswa siswa) {
        // PERBAIKAN: Menggunakan 'id' bukan 'id_siswa' sesuai database Anda
        String sql = "UPDATE siswa SET nis = ?, nama = ?, id_jurusan = ?, id_kelas = ?, email = ?, no_telp = ?, foto = ? WHERE id = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, siswa.getNis());
            ps.setString(2, siswa.getNama());
            ps.setInt(3, siswa.getIdJurusan());
            ps.setInt(4, siswa.getIdKelas());
            ps.setString(5, siswa.getEmail());
            ps.setString(6, siswa.getNoTelp());
            ps.setString(7, siswa.getFoto());
            
            ps.setInt(8, siswa.getId()); // WHERE id = ...

            // Debugging: Tampilkan query di console agar tahu query jalan atau tidak
            System.out.println("Menjalankan UPDATE Siswa ID: " + siswa.getId());
            
            int rowUpdated = ps.executeUpdate();
            return rowUpdated > 0;
            
        } catch (SQLException e) {
            // Tampilkan error SQL di console NetBeans
            System.err.println("Error Update Siswa: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // --- 7. DELETE (Hapus Siswa) ---
    public void hapusSiswa(int id) {
        String sql = "DELETE FROM siswa WHERE id = ?";
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // --- 8. SEARCH (Pencarian Kompleks) ---
    public List<Siswa> cariSiswa(String keyword) {
        List<Siswa> listSiswa = new ArrayList<>();
        // Mencari di tabel siswa, jurusan, dan kelas
        String sql = "SELECT s.*, j.nama_jurusan, k.nama_kelas " +
                     "FROM siswa s " +
                     "LEFT JOIN jurusan j ON s.id_jurusan = j.id_jurusan " +
                     "LEFT JOIN kelas k ON s.id_kelas = k.id_kelas " +
                     "WHERE s.nis LIKE ? OR s.nama LIKE ? OR j.nama_jurusan LIKE ? OR k.nama_kelas LIKE ?";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            String keywordLike = "%" + keyword + "%";
            ps.setString(1, keywordLike);
            ps.setString(2, keywordLike);
            ps.setString(3, keywordLike);
            ps.setString(4, keywordLike); 
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Siswa siswa = new Siswa();
                    siswa.setId(rs.getInt("id"));
                    siswa.setNis(rs.getString("nis"));
                    siswa.setNama(rs.getString("nama"));
                    siswa.setEmail(rs.getString("email"));
                    siswa.setNoTelp(rs.getString("no_telp"));
                    
                    siswa.setIdJurusan(rs.getInt("id_jurusan"));
                    siswa.setNamaJurusan(rs.getString("nama_jurusan"));
                    
                    siswa.setIdKelas(rs.getInt("id_kelas"));
                    siswa.setNamaKelas(rs.getString("nama_kelas"));
                    
                    siswa.setFoto(rs.getString("foto"));
                    
                    listSiswa.add(siswa);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listSiswa;
    }
}