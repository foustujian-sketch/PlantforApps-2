# PlantCare Pro: Management Koleksi Tanaman 🌿

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

---

##  Deskripsi Aplikasi
**PlantCare Pro** adalah aplikasi manajemen tanaman berbasis mobile yang membantu pengguna mengelola koleksi tanaman harian mereka. Aplikasi ini dirancang untuk mempermudah pemantauan jadwal perawatan (penyiraman) secara terorganisir dengan memanfaatkan teknologi database cloud dari **Supabase**.

---

##  Fitur Aplikasi
Aplikasi ini mendukung fungsionalitas **CRUD** penuh yang terintegrasi secara real-time:

1. **Manajemen Koleksi (Create & Read):** Menambahkan tanaman baru ke dalam database dan menampilkannya dalam bentuk list kartu yang rapi.
2. **Sistem Jadwal Siram Otomatis:** Aplikasi secara cerdas memfilter dan menampilkan daftar tanaman yang perlu disiram **hanya pada hari ini** sesuai jadwal yang ditentukan.
3. **Pembaruan Data (Update):** Fitur untuk mengubah informasi tanaman (Nama, Spesies, atau Jadwal) jika terdapat perubahan.
4. **Penghapusan Data (Delete):** Menghapus data tanaman dari koleksi dengan sistem konfirmasi (Dialog) untuk mencegah terhapus secara tidak sengaja.
5. **Dark/Light Mode:** Mendukung perpindahan tema aplikasi secara dinamis untuk kenyamanan mata pengguna.

---

##  Widget yang Digunakan
Aplikasi ini dibangun menggunakan berbagai widget inti Flutter untuk memastikan antarmuka yang responsif:

* **`DefaultTabController` & `TabBar`**: Digunakan untuk memisahkan antara halaman Koleksi dan halaman Tugas Siram dalam satu layar.
* **`ListView.builder`**: Menampilkan daftar tanaman dalam jumlah banyak secara efisien.
* **`Card` & `ListTile`**: Digunakan untuk membungkus data tanaman agar tampilan terlihat modern dan terstruktur.
* **`FloatingActionButton`**: Sebagai tombol utama yang menonjol untuk menambahkan data tanaman baru.
* **`StatefulBuilder`**: Digunakan untuk mengelola perubahan data secara lokal agar UI tetap responsif.
* **`Get.defaultDialog` & `Get.snackbar`**: Memberikan umpan balik visual kepada pengguna saat melakukan aksi hapus atau simpan.

---

##  Dokumentasi Alur
### 1. Autentikasi Pengguna (Register & Login)
Sebelum masuk ke aplikasi, pengguna diwajibkan memiliki akun. 
* **Register:** Pengguna mendaftarkan email dan password yang akan disimpan secara aman di **Supabase Auth**.
* **Login:** Pengguna masuk menggunakan kredensial yang telah didaftarkan. Aplikasi menggunakan session sehingga pengguna tidak perlu login berulang kali.

### 2. Halaman Utama (Dashboard)
Setelah login berhasil, pengguna diarahkan ke Halaman Utama yang memiliki dua navigasi:
* **Tab Koleksi:** Menampilkan seluruh daftar tanaman yang telah tersimpan di cloud.
* **Tab Tugas Siram:** Menampilkan daftar tanaman yang jadwal penyiramannya jatuh pada hari ini (berdasarkan hari di sistem perangkat).

### 3. Tambah Data Tanaman (Create)
Pengguna menekan tombol **+** di pojok kanan bawah untuk membuka formulir. 
* Input yang tersedia: Nama Tanaman, Spesies, dan pilihan Hari Siram.
* Data dikirim ke tabel `plants` di Supabase dan secara otomatis muncul di list utama.

### 4. Mengubah Data Tanaman (Update)
Jika ada kesalahan input atau perubahan jadwal:
* Pengguna menekan tombol **Edit (Ikon Pensil)** pada kartu tanaman.
* Form akan terbuka kembali dengan data lama yang sudah terisi otomatis.
* Setelah diedit dan disimpan, data di database akan diperbarui secara real-time.

### 5. Menghapus Data Tanaman (Delete)
Untuk menjaga keamanan data dari klik yang tidak sengaja:
* Pengguna menekan tombol **Hapus (Ikon Tong Sampah)**.
* Muncul **Pop-up Dialog** konfirmasi. 
* Jika dikonfirmasi, data dihapus dari Supabase dan daftar di aplikasi langsung terupdate secara otomatis.

### 6. Keluar (Logout)
Pengguna dapat keluar dari akun melalui ikon logout di AppBar. Ini akan menghapus session login dan mengarahkan kembali pengguna ke halaman Login.
<div align="center">
  <img width="285" height="628" alt="image" src="https://github.com/user-attachments/assets/307bb5c4-34fb-4a73-b975-d626683e4bf6" />
  <p><i>Tampilan Tab Koleksi dan Tab Tugas Siram</i></p>
</div>

---
