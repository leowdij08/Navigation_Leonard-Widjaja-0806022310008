# Aplikasi Hitung Mundur

Aplikasi berbasis Flutter untuk menghitung mundur waktu menuju tanggal yang dipilih dengan berbagai fitur interaktif dan navigasi yang mulus.

## Pendekatan Navigasi Lanjutan

Dalam aplikasi ini, navigasi lanjutan diterapkan untuk memungkinkan transisi yang mulus antar layar dan mengelola status aplikasi. `Navigator` dan named routes Flutter digunakan secara ekstensif untuk menciptakan pengalaman pengguna yang nyaman.

1. **Named Routes untuk Navigasi**:
   - `Navigator.pushNamed()` dan `Navigator.pushReplacementNamed()` digunakan untuk berpindah antar layar. Pendekatan ini membantu menjaga logika navigasi lebih bersih dan lebih mudah dikelola seiring dengan berkembangnya aplikasi.

2. **Melewatkan Argumen Antar Layar**:
   - Aplikasi ini menggunakan pengiriman argumen antar layar dengan `Navigator.pushNamed()` dan ekstraksi argumen melalui `ModalRoute.of(context)!.settings.arguments`. Ini memungkinkan layar `CountdownScreen` menerima tanggal yang dipilih dari layar sebelumnya (`HomeScreen`) untuk menghitung mundur.

3. **Manajemen Status dengan Provider**:
   - Paket `Provider` digunakan untuk mengelola status yang dibagikan di seluruh aplikasi. Ini memungkinkan tanggal yang dipilih di `HomeScreen` untuk dengan mudah diakses di bagian lain aplikasi (misalnya, `CountdownScreen`) tanpa memerlukan solusi manajemen status yang rumit.

4. **Bottom Navigation Bar**:
   - Bar navigasi bawah diimplementasikan menggunakan `BottomNavigationBar` dengan logika navigasi kustom. Status tab yang dipilih dilacak dan digunakan untuk menavigasi ke berbagai bagian aplikasi (Home, History, dan Feedback).

## Tantangan yang Dihadapi

1. **Manajemen Status Antar Layar**:
   - Salah satu tantangan utama adalah mengelola status antar layar, terutama saat mengirimkan data antara layar. Penggunaan paket `Provider` membuat manajemen status menjadi lebih sederhana dan lebih mudah dikelola, terutama dalam menangani tanggal yang dipilih di berbagai layar.

2. **Validasi Tanggal dan Logika Hitung Mundur**:
   - Tantangan lainnya adalah memastikan logika hitung mundur berfungsi dengan benar, terutama jika tanggal yang dipilih sudah lewat.

3. **Menangani Kesalahan dengan Baik**:
   - Sepanjang aplikasi, saya harus memastikan bahwa penanganan kesalahan diterapkan dengan baik, terutama ketika pengguna gagal memilih tanggal sebelum memulai hitung mundur. Ini diatasi dengan menampilkan dialog peringatan untuk memberi tahu pengguna tentang masalah atau tindakan yang tidak valid.

4. **Responsivitas UI**:
   - Memastikan bahwa UI aplikasi responsif dan bekerja dengan baik di berbagai ukuran layar merupakan tantangan lain. Saya menggunakan `MediaQuery` dan struktur layout yang fleksibel seperti `Column` dan `Row` untuk membuat aplikasi lebih adaptif di berbagai perangkat.

## Fitur yang Diimplementasikan

1. **Timer Hitung Mundur**:
   - Fitur utama aplikasi ini adalah timer hitung mundur, yang menghitung waktu yang tersisa antara tanggal saat ini dan tanggal yang dipilih oleh pengguna. Hitung mundur ditampilkan dalam hari, jam, menit, dan detik.

2. **Pemilih Tanggal**:
   - Pengguna dapat memilih tanggal menggunakan pemilih tanggal bawaan (`showDatePicker()`), yang memungkinkan mereka memilih tanggal apa saja dalam satu tahun ke depan.

3. **UI Interaktif**:
   - Aplikasi ini memiliki antarmuka interaktif dengan teks, tombol, dan kotak tanggal kustom yang menampilkan hari, bulan, dan tahun dari tanggal yang dipilih.

4. **Animasi Lottie**:
   - Animasi Lottie kustom ditambahkan di layar utama untuk memberikan pengalaman visual yang menarik. Animasi ini dimuat dari file `assets/animasi1.json`.

5. **Penanganan Kesalahan**:
   - Penanganan kesalahan diterapkan di seluruh aplikasi. Jika pengguna mencoba melanjutkan tanpa memilih tanggal terlebih dahulu, dialog kesalahan akan ditampilkan yang menginformasikan mereka untuk memilih tanggal terlebih dahulu.

6. **Navigasi Bawah**:
   - Aplikasi ini menyertakan bar navigasi bawah dengan tiga tab: Home, History, dan Feedback. Setiap tab memungkinkan navigasi mudah ke bagian yang berbeda dari aplikasi.

7. **Manajemen Status Berbasis Provider**:
   - Status tanggal yang dipilih dikelola menggunakan paket `Provider`, membuatnya lebih mudah untuk membagikan status antar layar dan memastikan konsistensi di seluruh aplikasi.

8. **Desain Responsif**:
   - UI aplikasi dioptimalkan untuk dapat menyesuaikan dengan berbagai ukuran layar, memastikan aplikasi terlihat baik di perangkat ponsel dan tablet.
  
9. **Countdown**
    - User akan dipindahkan ke halaman, sesuai dengan jangka waktu hari ke tanggal yang dipilih. Apabila jangka waktunya 100 hari, maka akan ada 100 halaman aplikasi yang menanti user untuk ditelusuri.
  
10. **History**
    - User dapat melihat semua list tanggal yang di search sebelumnya, lalu kembali melakukan countdown ketika memencet tanggalnya.
    
11. **Feedback**
    - User dapat memberikan feedback untuk aplikasi dengan mengisi nama, e-mail, serta masukannya, agar kelak kami dapat memperbaiki apa yang masih dianggap kurang untuk aplikasi.
## Cara Menjalankan Aplikasi

1. Clone repository ini:

   ```bash
   https://github.com/leowdij08/Navigation_Leonard-Widjaja-0806022310008.git

2. Masuk ke folder proyek:
   ```
   cd aplikasi-hitung-mundur

3. Instal depedensi:
   ```
   flutter pub get

4. Jalankan aplikasi
   ```
   flutter run
