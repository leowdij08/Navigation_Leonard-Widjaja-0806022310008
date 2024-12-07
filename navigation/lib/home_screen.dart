import 'package:flutter/material.dart';

class CountdownArgs {
  final DateTime selectedDate;

  CountdownArgs({required this.selectedDate});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate;

  // Fungsi untuk membuka date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang
      backgroundColor: const Color(0xFFFFECEC),
      appBar: AppBar(
        title: const Text('Alat Penghitung Tanggal'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Judul utama aplikasi
            const Text(
              'Selamat Datang di\nAplikasi Hitung Mundur!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Kotak input tanggal
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Kotak untuk hari
                _buildDigitBox(selectedDate?.day.toString() ?? '--'),
                const SizedBox(width: 8),
                // Kotak untuk bulan
                _buildDigitBox(selectedDate?.month.toString() ?? '--'),
                const SizedBox(width: 8),
                // Kotak untuk tahun
                _buildDigitBox(selectedDate?.year.toString() ?? '----'),
                const SizedBox(width: 8),
                // Tombol untuk membuka kalender
                IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.pinkAccent),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Tombol "Hitung Mundur"
            ElevatedButton(
              onPressed: selectedDate != null
                  ? () {
                      Navigator.pushNamed(
                        context,
                        '/countdown',
                        arguments: CountdownArgs(selectedDate: selectedDate!),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Hitung Mundur',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kotak tanggal
  Widget _buildDigitBox(String value) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
