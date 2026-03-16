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
<p align="center">
<img src="https://github.com/user-attachments/assets/b09ef84c-304a-4f38-a403-e3e148f3bd73" width="230" />
<img src="https://github.com/user-attachments/assets/3be722ee-2139-4962-b645-b34b53385df0" width="230" />
<img src="https://github.com/user-attachments/assets/27bb855f-4cd1-443a-895f-96d334706579" width="230" />
<img src="https://github.com/user-attachments/assets/923ac53f-26ab-4414-8919-d1c286cb79d5" width="230" />
</p>


### 2. Halaman Utama (Dashboard)
Setelah login berhasil, pengguna diarahkan ke Halaman Utama yang memiliki dua navigasi:
* **Tab Koleksi:** Menampilkan seluruh daftar tanaman yang telah tersimpan di cloud.
* **Tab Tugas Siram:** Menampilkan daftar tanaman yang jadwal penyiramannya jatuh pada hari ini (berdasarkan hari di sistem perangkat).
<p align="center">
<img src="https://github.com/user-attachments/assets/57ad89fe-a52e-4429-9c84-e926d8a6feeb" width="250" />
<img src="https://github.com/user-attachments/assets/c0711a79-9c6e-408c-a318-a4288ff15213" width="250" />
</p>

### 3. Tambah Data Tanaman (Create)
Pengguna menekan tombol **+** di pojok kanan bawah untuk membuka formulir. 
* Input yang tersedia: Nama Tanaman, Spesies, dan pilihan Hari Siram.
* Data dikirim ke tabel `plants` di Supabase dan secara otomatis muncul di list utama.
<p align="center">
<img src="https://github.com/user-attachments/assets/dc82c74d-a666-4a9d-b191-4a09c52b6cd5" width="250" />
<img src="https://github.com/user-attachments/assets/a7322c39-0976-4112-80d4-3c8e7e12b8e0" width="250" />
</p>


### 4. Mengubah Data Tanaman (Update)
Jika ada kesalahan input atau perubahan jadwal:
* Pengguna menekan tombol **Edit (Ikon Pensil)** pada kartu tanaman.
* Form akan terbuka kembali dengan data lama yang sudah terisi otomatis.
* Setelah diedit dan disimpan, data di database akan diperbarui secara real-time.

<p align="center">
<img src="https://github.com/user-attachments/assets/18e39966-7d7e-48c0-82ec-f14877fd90fb" width="250" />
<img src="https://github.com/user-attachments/assets/d60e554d-0a37-42d3-92e2-ba97fc02074e" width="250" />
</p>


### 5. Menghapus Data Tanaman (Delete)
Untuk menjaga keamanan data dari klik yang tidak sengaja:
* Pengguna menekan tombol **Hapus (Ikon Tong Sampah)**.
* Muncul **Pop-up Dialog** konfirmasi. 
* Jika dikonfirmasi, data dihapus dari Supabase dan daftar di aplikasi langsung terupdate secara otomatis.
<p align="center">
<img src="https://github.com/user-attachments/assets/9915b41a-ab64-4c8f-9e52-b307d1928939" width="250" />
<img src="https://github.com/user-attachments/assets/20103f4a-de23-4383-879c-ffe99c5a6efc" width="250" />
</p>


### 6. Keluar (Logout)
Pengguna dapat keluar dari akun melalui ikon logout di AppBar. Ini akan menghapus session login dan mengarahkan kembali pengguna ke halaman Login.
<p align="center">
<img src="https://github.com/user-attachments/assets/b09ef84c-304a-4f38-a403-e3e148f3bd73" width="250" />
</p>

---
