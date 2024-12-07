import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: Colors.brown,
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
      body: Container(
        color: Colors.brown.shade100,
        padding: const EdgeInsets.all(16.0), // Padding untuk form
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input nama
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                labelStyle: TextStyle(color: Colors.brown),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Input email
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.brown),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Input ulasan
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ulasan',
                labelStyle: TextStyle(color: Colors.brown),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown, width: 2),
                ),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            // Tombol submit
            ElevatedButton(
              onPressed: () {
                // Menampilkan simulasi refresh form
                Navigator.pop(context);
                Navigator.pushNamed(context, '/feedback');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
