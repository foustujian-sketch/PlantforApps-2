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

<div align="center">
  <img width="250" alt="Halaman Utama" src="https://github.com/user-attachments/assets/bb58223a-122c-4646-91ca-e59b942d64d9" />
  <p><i>Tampilan Tab Koleksi dan Tab Tugas Siram</i></p>
</div>

---
