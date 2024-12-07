import 'package:flutter/material.dart';

// Kelas untuk menerima argumen tanggal yang dipilih
class CountdownArgs {
  final DateTime selectedDate;
  CountdownArgs({required this.selectedDate});
}

class CountdownScreen extends StatelessWidget {
  final CountdownArgs args;

  // Konstruktor untuk menerima argumen CountdownArgs
  CountdownScreen({required this.args});

  @override
  Widget build(BuildContext context) {
    // Menghitung sisa waktu berdasarkan selisih hingga detik
    int daysRemaining = args.selectedDate.difference(DateTime.now()).inDays +
        (args.selectedDate.difference(DateTime.now()).inSeconds % 86400 > 0 ? 1 : 0);

    // Fungsi untuk navigasi ke layar berikutnya
    void navigateCountdown(int days) {
      if (days > 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CountdownScreen(
              args: CountdownArgs(
                selectedDate: DateTime.now().add(Duration(days: days - 1)),
              ),
            ),
          ),
        );
      } else {
        // Jika countdown selesai, kembali ke halaman utama
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    }

    return WillPopScope(
      onWillPop: () async {
        // Mengatur tombol Back membawa pengguna kembali ke HomeScreen
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return false; // Mencegah back default
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Countdown'),
          backgroundColor: daysRemaining.isEven ? Colors.orange : Colors.purple, // Warna appbar bergantung pada sisa hari
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigasi langsung ke HomeScreen
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ),
        body: Container(
          color: daysRemaining.isEven ? Colors.orange.shade100 : Colors.purple.shade100, // Warna background bergantung pada sisa hari
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tanggal yang kamu nantikan tersisa:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '$daysRemaining Hari', // Menampilkan jumlah hari yang tersisa
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => navigateCountdown(daysRemaining), // Aksi tombol bergantung pada sisa hari
                  child: Text(daysRemaining > 1 ? 'Lanjutkan' : 'Selesai'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
