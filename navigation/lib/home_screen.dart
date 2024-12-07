import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'date_provider.dart';
import 'countdown_screen.dart';
import 'bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _dateController = TextEditingController();
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
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang di Aplikasi Hitung Mundur!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Input Tanggal yang Ingin Kamu Hitung Mundur',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tanggal (DD-MM-YYYY)',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
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
                                  _dateController.text =
                                      "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
                                });
                              }
                            },
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                  ],
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
                  child: Text('Hitung Mundur'),
                ),
              ],
            ),
          ),
        ),
      ),
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
