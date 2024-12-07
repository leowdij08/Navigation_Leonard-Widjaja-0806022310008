import 'package:flutter/material.dart';  // Mengimpor package material untuk komponen UI Flutter
import 'package:provider/provider.dart';  // Mengimpor package provider untuk state management
import 'package:lottie/lottie.dart';  // Mengimpor Lottie untuk menampilkan animasi JSON
import 'date_provider.dart';  // Mengimpor DateProvider untuk manajemen status tanggal
import 'countdown_screen.dart';  // Mengimpor halaman hitung mundur
import 'bottom_nav_bar.dart';  // Mengimpor bottom navigation bar

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();  // Membuat state untuk halaman utama
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _selectedDate;  // Menyimpan tanggal yang dipilih oleh pengguna

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alat Penghitung Tanggal'),  // Judul aplikasi di bar atas
        backgroundColor: Colors.brown,  // Warna latar belakang app bar
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),  // Menampilkan bottom navigation bar
      body: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade100,  // Warna latar belakang body
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),  // Memberikan jarak di sekitar konten
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Menyusun widget secara vertikal di tengah
              children: [
                // Animasi Lottie di atas teks
                Lottie.asset(
                  'assets/animasi1.json', // Pastikan animasi1.json ada di folder assets
                  width: 200,  // Ukuran animasi
                  height: 200, // Ukuran animasi
                ),
                SizedBox(height: 2), // Memberikan ruang antara animasi dan teks
                Text(
                  'Selamat Datang di Aplikasi Hitung Mundur!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
                  textAlign: TextAlign.center,  // Menyelaraskan teks di tengah
                ),
                SizedBox(height: 20),  // Memberikan ruang setelah teks
                Text(
                  'Input Tanggal yang Ingin Kamu Hitung Mundur',
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                  textAlign: TextAlign.center,  // Menyelaraskan teks di tengah
                ),
                SizedBox(height: 20),  // Memberikan ruang setelah teks
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,  // Menyusun widget dalam baris secara horizontal di tengah
                  children: [
                    _buildDateBox('Hari', _selectedDate?.day ?? '--'),  // Menampilkan box untuk hari
                    SizedBox(width: 8),  // Memberikan ruang antar box
                    _buildDateBox('Bulan', _selectedDate?.month ?? '--'),  // Menampilkan box untuk bulan
                    SizedBox(width: 8),  // Memberikan ruang antar box
                    _buildDateBox('Tahun', _selectedDate?.year ?? '----'),  // Menampilkan box untuk tahun
                  ],
                ),
                SizedBox(height: 20),  // Memberikan ruang setelah row tanggal
                ElevatedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,  // Menampilkan dialog pemilihan tanggal
                      initialDate: DateTime.now(),  // Tanggal awal yang ditampilkan
                      firstDate: DateTime.now(),  // Tanggal pertama yang bisa dipilih
                      lastDate: DateTime.now().add(Duration(days: 365)),  // Tanggal terakhir yang bisa dipilih
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;  // Menyimpan tanggal yang dipilih
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,  // Warna tombol
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),  // Padding tombol
                  ),
                  child: Text(
                    'Pilih Tanggal',
                    style: TextStyle(fontSize: 16, color: Colors.white),  // Gaya teks tombol
                  ),
                ),
                SizedBox(height: 20),  // Memberikan ruang setelah tombol
                ElevatedButton(
                  onPressed: () {
                    if (_selectedDate != null) {
                      // Jika tanggal sudah dipilih, simpan tanggal dan arahkan ke halaman countdown
                      Provider.of<DateProvider>(context, listen: false)
                          .addDate(_selectedDate!);

                      Navigator.pushNamed(
                        context,
                        '/countdown',
                        arguments: CountdownArgs(selectedDate: _selectedDate!),
                      );
                    } else {
                      _showErrorDialog(context, 'Silakan pilih tanggal terlebih dahulu.');  // Menampilkan dialog error jika tanggal belum dipilih
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade600,  // Warna tombol
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),  // Padding tombol
                  ),
                  child: Text(
                    'Hitung Mundur',
                    style: TextStyle(fontSize: 16, color: Colors.white),  // Gaya teks tombol
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak tanggal (hari, bulan, tahun)
  Widget _buildDateBox(String label, dynamic value) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.brown),  // Border dengan warna coklat
            borderRadius: BorderRadius.circular(8),  // Membuat sudut melengkung
          ),
          child: Text(
            value.toString(),  // Menampilkan nilai (hari, bulan, tahun)
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),  // Gaya teks
          ),
        ),
        SizedBox(height: 8),  // Memberikan ruang antara kotak dan label
        Text(
          label,  // Menampilkan label (Hari/Bulan/Tahun)
          style: TextStyle(fontSize: 14, color: Colors.brown),  // Gaya teks label
        ),
      ],
    );
  }

  // Fungsi untuk menampilkan dialog kesalahan
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Kesalahan'),  // Judul dialog
        content: Text(message),  // Pesan kesalahan
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),  // Menutup dialog ketika tombol OK ditekan
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
