import 'package:flutter/material.dart';  // Mengimpor package material untuk komponen UI Flutter

class ErrorScreen extends StatelessWidget {
  final String routeName;  // Menyimpan nama rute yang menyebabkan error
  final String errorMessage;  // Menyimpan pesan error yang akan ditampilkan

  // Konstruktor untuk menerima parameter routeName dan errorMessage
  ErrorScreen({required this.routeName, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),  // Judul halaman yang menampilkan informasi error
        backgroundColor: Colors.red,  // Warna latar belakang app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Menyusun elemen-elemen di tengah secara vertikal
          children: [
            const Icon(Icons.error, size: 80, color: Colors.red),  // Ikon error dengan warna merah
            const SizedBox(height: 20),  // Memberikan jarak vertikal antara ikon dan teks
            const Text(
              'Halaman tidak ditemukan!',  // Pesan utama yang menandakan bahwa halaman tidak ditemukan
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // Gaya teks untuk pesan utama
            ),
            const SizedBox(height: 10),  // Memberikan jarak vertikal setelah pesan utama
            Text(
              'Rute: $routeName',  // Menampilkan nama rute yang menyebabkan error
              style: const TextStyle(fontSize: 16, color: Colors.grey),  // Gaya teks untuk nama rute
            ),
            const SizedBox(height: 10),  // Memberikan jarak vertikal setelah nama rute
            Text(
              'Pesan Error: $errorMessage',  // Menampilkan pesan error yang diterima dari parameter
              style: const TextStyle(fontSize: 16, color: Colors.grey),  // Gaya teks untuk pesan error
            ),
            const SizedBox(height: 20),  // Memberikan jarak vertikal sebelum tombol
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  // Menutup halaman error dan kembali ke halaman sebelumnya
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),  // Padding untuk tombol
                backgroundColor: Colors.red,  // Warna latar belakang tombol
              ),
              child: const Text(
                'Kembali',  // Teks tombol untuk kembali ke halaman sebelumnya
                style: TextStyle(color: Colors.white, fontSize: 16),  // Gaya teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
