import 'package:flutter/material.dart';  // Mengimpor package material untuk komponen UI Flutter
import 'package:provider/provider.dart';  // Mengimpor package provider untuk state management
import 'date_provider.dart';  // Mengimpor DateProvider untuk manajemen status tanggal
import 'bottom_nav_bar.dart';  // Mengimpor bottom navigation bar
import 'package:intl/intl.dart';  // Mengimpor intl untuk format tanggal
import 'countdown_screen.dart';  // Mengimpor halaman countdown

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan daftar tanggal yang dipilih dari DateProvider
    final history = Provider.of<DateProvider>(context).selectedDates;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pilihan Tanggal'),  // Judul aplikasi di bar atas
        backgroundColor: Colors.brown,  // Warna latar belakang app bar
      ),
      // Menampilkan Bottom Navigation Bar dengan indeks yang menandakan halaman History
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
      body: Container(
        color: Colors.brown.shade100,  // Warna latar belakang body
        padding: const EdgeInsets.all(16.0),  // Memberikan padding di sekitar body
        child: history.isEmpty  // Jika daftar tanggal kosong
            ? const Center(
                child: Text(
                  'Belum ada tanggal yang dipilih!',  // Tampilkan pesan ini jika tidak ada tanggal yang dipilih
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.brown,  // Warna teks pesan
                  ),
                ),
              )
            : ListView.builder(  // Menampilkan daftar tanggal dalam bentuk list
                itemCount: history.length,  // Jumlah item yang akan ditampilkan sesuai panjang history
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),  // Memberikan jarak vertikal antar item
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,  // Warna latar belakang tiap item
                        border: Border.all(color: Colors.brown),  // Border dengan warna coklat
                        borderRadius: BorderRadius.circular(8),  // Sudut melengkung
                      ),
                      child: ListTile(
                        // Menampilkan tanggal dalam format "dd MMMM yyyy"
                        title: Text(
                          DateFormat('dd MMMM yyyy').format(history[index]),  // Format tanggal menggunakan DateFormat
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,  // Gaya teks tanggal
                          ),
                        ),
                        leading: Icon(
                          Icons.calendar_today,  // Ikon kalender di samping tanggal
                          color: Colors.brown,  // Warna ikon
                        ),
                        onTap: () {
                          // Ketika item tanggal dipilih, arahkan ke halaman countdown
                          Navigator.pushNamed(
                            context,
                            '/countdown',  // Navigasi ke halaman countdown
                            arguments: CountdownArgs(selectedDate: history[index]),  // Mengirim tanggal yang dipilih ke halaman countdown
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
