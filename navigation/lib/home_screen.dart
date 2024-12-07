import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';  // Import Lottie
import 'date_provider.dart';
import 'countdown_screen.dart';
import 'bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alat Penghitung Tanggal'),
        backgroundColor: Colors.brown,
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade100,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Input Tanggal yang Ingin Kamu Hitung Mundur',
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDateBox('Hari', _selectedDate?.day ?? '--'),
                    SizedBox(width: 8),
                    _buildDateBox('Bulan', _selectedDate?.month ?? '--'),
                    SizedBox(width: 8),
                    _buildDateBox('Tahun', _selectedDate?.year ?? '----'),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Pilih Tanggal',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedDate != null) {
                      Provider.of<DateProvider>(context, listen: false)
                          .addDate(_selectedDate!);

                      Navigator.pushNamed(
                        context,
                        '/countdown',
                        arguments: CountdownArgs(selectedDate: _selectedDate!),
                      );
                    } else {
                      _showErrorDialog(context, 'Silakan pilih tanggal terlebih dahulu.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade600,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Hitung Mundur',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateBox(String label, dynamic value) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.brown),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.brown),
        ),
      ],
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Kesalahan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
