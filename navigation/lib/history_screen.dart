import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'date_provider.dart';
import 'bottom_nav_bar.dart';
import 'package:intl/intl.dart';
import 'countdown_screen.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan daftar tanggal dari DateProvider
    final history = Provider.of<DateProvider>(context).selectedDates;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pilihan Tanggal'),
        backgroundColor: Colors.brown,
      ),
      // Menampilkan Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
      body: Container(
        color: Colors.brown.shade100,
        padding: const EdgeInsets.all(16.0),
        child: history.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada tanggal yang dipilih!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.brown,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.brown),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        // Menampilkan tanggal dalam format "dd MMMM yyyy"
                        title: Text(
                          DateFormat('dd MMMM yyyy').format(history[index]),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        leading: Icon(
                          Icons.calendar_today,
                          color: Colors.brown,
                        ),
                        onTap: () {
                          // Ketika tanggal dipilih, arahkan ke halaman countdown
                          Navigator.pushNamed(
                            context,
                            '/countdown',
                            arguments: CountdownArgs(selectedDate: history[index]),
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
