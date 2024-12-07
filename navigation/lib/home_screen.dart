import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'countdown_screen.dart';
import 'date_provider.dart';
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
        backgroundColor: Colors.pinkAccent,
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
      body: Container(
        color: Colors.pink.shade50,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang di Aplikasi Hitung Mundur!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Input Tanggal yang Ingin Kamu Hitung Mundur',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (picked != null && picked != _selectedDate) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              child: Text('Pilih Tanggal'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedDate == null
                  ? null
                  : () {
                      // Tambahkan tanggal ke history
                      Provider.of<DateProvider>(context, listen: false).addDate(_selectedDate!);

                      Navigator.pushNamed(
                        context,
                        '/countdown',
                        arguments: CountdownArgs(selectedDate: _selectedDate!),
                      );
                    },
              child: Text('Hitung Mundur'),
            ),
          ],
        ),
      ),
    );
  }
}
