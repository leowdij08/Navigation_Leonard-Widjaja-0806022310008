import 'package:flutter/material.dart';

// Model untuk menerima data argument di halaman Countdown
class CountdownArgs {
  final DateTime selectedDate;
  final DateTime currentDate;

  CountdownArgs({
    required this.selectedDate,
    required this.currentDate,
  });
}

// Halaman untuk menampilkan countdown waktu
class CountdownScreen extends StatelessWidget {
  final CountdownArgs args;

  // Konstruktor dengan parameter args
  const CountdownScreen({required this.args, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menghitung sisa waktu (durasi) antara tanggal saat ini dan tanggal yang dipilih
    final duration = args.selectedDate.difference(args.currentDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Mundur'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        color: Colors.deepOrange.shade50,
        padding: const EdgeInsets.all(16.0), // Memberikan padding untuk estetika
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Judul utama
            const Text(
              'Waktu Tersisa:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Menampilkan durasi yang tersisa dalam format hari, jam, menit, dan detik
            Text(
              '${duration.inDays} Hari\n${duration.inHours % 24} Jam\n${duration.inMinutes % 60} Menit\n${duration.inSeconds % 60} Detik',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, color: Colors.deepOrange),
            ),
            const SizedBox(height: 20),
            // Tombol kembali ke halaman utama
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Kembali',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
