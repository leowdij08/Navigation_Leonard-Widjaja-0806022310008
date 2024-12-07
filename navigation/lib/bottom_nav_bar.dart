import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  // Konstruktor yang menerima parameter currentIndex untuk menunjukkan indeks item yang sedang dipilih
  BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Menetapkan indeks item yang dipilih
      onTap: (index) {
        // Menangani perubahan halaman berdasarkan item yang dipilih
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/'); // Navigasi ke halaman utama
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/history'); // Navigasi ke halaman riwayat
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/feedback'); // Navigasi ke halaman ulasan
        }
      },
      items: [
        // Item pertama (Beranda)
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda', // Label untuk item pertama
        ),
        // Item kedua (Riwayat)
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat', // Label untuk item kedua
        ),
        // Item ketiga (Ulasan)
        BottomNavigationBarItem(
          icon: Icon(Icons.feedback),
          label: 'Ulasan', // Label untuk item ketiga
        ),
      ],
      // Menambahkan gaya untuk BottomNavigationBar
      backgroundColor: Colors.deepOrange.shade50, // Latar belakang BottomNavBar
      selectedItemColor: Colors.deepOrange, // Warna item yang dipilih
      unselectedItemColor: Colors.deepOrange.shade200, // Warna item yang tidak dipilih
      showUnselectedLabels: true, // Menampilkan label item yang tidak dipilih
    );
  }
}
