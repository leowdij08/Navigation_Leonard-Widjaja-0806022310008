import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'feedback_screen.dart';
import 'countdown_screen.dart';
import 'error_screen.dart';
import 'date_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alat Penghitung Tanggal',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/history': (context) => HistoryScreen(),
        '/feedback': (context) => FeedbackScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/countdown') {
          final args = settings.arguments as CountdownArgs?;
          if (args != null) {
            return MaterialPageRoute(
              builder: (context) => CountdownScreen(args: args),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => ErrorScreen(
                routeName: settings.name ?? 'Unknown',
                errorMessage: 'Invalid arguments for CountdownScreen',
              ),
            );
          }
        }
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(
            routeName: settings.name ?? 'Unknown',
            errorMessage: 'Route not found!',
          ),
        );
      },
    );
  }
}
