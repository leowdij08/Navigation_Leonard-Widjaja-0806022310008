import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'feedback_screen.dart';
import 'countdown_screen.dart'; // Impor untuk CountdownArgs dan CountdownScreen
import 'error_screen.dart';
import 'date_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Hitung Mundur',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/history': (context) => HistoryScreen(),
        '/feedback': (context) => FeedbackScreen(),
      },
      // Menangani rute yang memerlukan argument
      onGenerateRoute: (settings) {
        if (settings.name == '/countdown') {
          final args = settings.arguments;

          // Pastikan args ada dan sesuai dengan tipe CountdownArgs
          if (args is CountdownArgs) {
            return MaterialPageRoute(
              builder: (context) => CountdownScreen(args: args),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => ErrorScreen(
                routeName: settings.name ?? 'Unknown',
                errorMessage: 'Argumen tidak valid untuk CountdownScreen',
              ),
            );
          }
        }

        // Rute tidak ditemukan
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(
            routeName: settings.name ?? 'Unknown',
            errorMessage: 'Rute tidak ditemukan!',
          ),
        );
      },
    );
  }
}
