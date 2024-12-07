import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/history');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/feedback');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.feedback),
          label: 'Feedback',
        ),
      ],
      // Menambahkan warna senada pada BottomNavBar
      backgroundColor: Colors.deepOrange.shade50, // Latar belakang BottomNavBar
      selectedItemColor: Colors.deepOrange, // Warna item yang dipilih
      unselectedItemColor: Colors.deepOrange.shade200, // Warna item yang tidak dipilih
      showUnselectedLabels: true, // Menampilkan label item yang tidak dipilih
    );
  }
}
