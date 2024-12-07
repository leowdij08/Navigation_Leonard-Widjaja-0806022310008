import 'package:flutter/material.dart';  // Mengimpor package material untuk komponen UI Flutter
import 'home_screen.dart';  // Mengimpor halaman utama
import 'history_screen.dart';  // Mengimpor halaman riwayat
import 'feedback_screen.dart';  // Mengimpor halaman feedback
import 'countdown_screen.dart';  // Mengimpor halaman hitung mundur
import 'error_screen.dart';  // Mengimpor halaman error jika rute tidak ditemukan
import 'date_provider.dart';  // Mengimpor provider untuk manajemen tanggal
import 'package:provider/provider.dart';  // Mengimpor package provider untuk state management

void main() {
  // Menjalankan aplikasi dengan provider untuk mengelola status aplikasi
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateProvider(),  // Membuat instance DateProvider untuk manajemen status
      child: MyApp(),  // Menjalankan aplikasi utama
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Menonaktifkan banner debug di aplikasi
      title: 'Alat Penghitung Tanggal',  // Menentukan judul aplikasi
      initialRoute: '/',  // Menentukan rute awal aplikasi
      routes: {
        // Mendefinisikan rute untuk halaman utama, riwayat, dan feedback
        '/': (context) => HomeScreen(),  // Rute utama yang mengarah ke HomeScreen
        '/history': (context) => HistoryScreen(),  // Rute untuk riwayat
        '/feedback': (context) => FeedbackScreen(),  // Rute untuk feedback
      },
      onGenerateRoute: (settings) {
        // Fungsi ini digunakan untuk menangani rute yang lebih kompleks, seperti dengan argumen
        if (settings.name == '/countdown') {
          // Memeriksa apakah nama rute adalah '/countdown'
          final args = settings.arguments as CountdownArgs?;  // Mengambil argumen yang diteruskan
          if (args != null) {
            // Jika argumen tidak null, arahkan ke halaman CountdownScreen dengan argumen
            return MaterialPageRoute(
              builder: (context) => CountdownScreen(args: args),
            );
          } else {
            // Jika argumen tidak valid, arahkan ke halaman ErrorScreen
            return MaterialPageRoute(
              builder: (context) => ErrorScreen(
                routeName: settings.name ?? 'Unknown',  // Menampilkan nama rute jika ada
                errorMessage: 'Invalid arguments for CountdownScreen',  // Pesan error
              ),
            );
          }
        }
        // Jika rute tidak ditemukan, arahkan ke halaman ErrorScreen
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(
            routeName: settings.name ?? 'Unknown',  // Menampilkan nama rute yang tidak valid
            errorMessage: 'Route not found!',  // Pesan error untuk rute yang tidak ditemukan
          ),
        );
      },
    );
  }
}
