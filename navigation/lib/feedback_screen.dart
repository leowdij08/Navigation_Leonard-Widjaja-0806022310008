import 'package:flutter/material.dart';  // Mengimpor package material untuk komponen UI Flutter
import 'bottom_nav_bar.dart';  // Mengimpor bottom navigation bar

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Ulasan'),  // Judul halaman
        backgroundColor: Colors.brown,  // Warna latar belakang app bar
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),  // Menampilkan Bottom Navigation Bar dengan indeks yang menandakan halaman Feedback
      body: Container(
        color: Colors.brown.shade100,  // Warna latar belakang body
        padding: const EdgeInsets.all(16.0),  // Padding untuk form
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,  // Agar elemen-elemen kolom terisi penuh secara horizontal
          children: [
            // Input nama
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama',  // Label untuk input nama
                labelStyle: TextStyle(color: Colors.brown),  // Warna label
                border: OutlineInputBorder(),  // Border di sekitar text field
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),  // Warna border saat text field aktif
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2),  // Warna border saat text field fokus
                ),
              ),
            ),
            const SizedBox(height: 16),  // Memberikan jarak antar elemen
            // Input email
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',  // Label untuk input email
                labelStyle: TextStyle(color: Colors.brown),  // Warna label
                border: OutlineInputBorder(),  // Border di sekitar text field
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),  // Warna border saat text field aktif
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2),  // Warna border saat text field fokus
                ),
              ),
            ),
            const SizedBox(height: 16),  // Memberikan jarak antar elemen
            // Input ulasan
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ulasan',  // Label untuk input ulasan
                labelStyle: TextStyle(color: Colors.brown),  // Warna label
                border: OutlineInputBorder(),  // Border di sekitar text field
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),  // Warna border saat text field aktif
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2),  // Warna border saat text field fokus
                ),
              ),
              maxLines: 5,  // Membatasi jumlah baris input untuk ulasan
            ),
            const SizedBox(height: 20),  // Memberikan jarak sebelum tombol kirim
            // Tombol kirim
            ElevatedButton(
              onPressed: () {
                // Menampilkan simulasi refresh form
                Navigator.pop(context);  // Menutup halaman feedback dan kembali ke halaman sebelumnya
                Navigator.pushNamed(context, '/feedback');  // Mengarahkan kembali ke halaman feedback (untuk menyegarkan form)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown.shade600,  // Warna tombol kirim
                padding: const EdgeInsets.symmetric(vertical: 14),  // Padding vertikal untuk tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),  // Membuat sudut tombol melengkung
                ),
              ),
              child: const Text(
                'Kirim',  // Teks tombol kirim
                style: TextStyle(fontSize: 16, color: Colors.white),  // Gaya teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
