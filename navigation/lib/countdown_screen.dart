import 'package:flutter/material.dart';

class CountdownArgs {
  final DateTime selectedDate;
  CountdownArgs({required this.selectedDate});
}

class CountdownScreen extends StatelessWidget {
  final CountdownArgs args;

  CountdownScreen({required this.args});

  @override
  Widget build(BuildContext context) {
    int daysRemaining = args.selectedDate.difference(DateTime.now()).inDays;

    void navigateCountdown(int days) {
      if (days > 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountdownScreen(
              args: CountdownArgs(
                selectedDate: DateTime.now().add(Duration(days: days - 1)),
              ),
            ),
          ),
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown'),
        backgroundColor: daysRemaining.isEven ? Colors.orange : Colors.purple,
      ),
      body: Container(
        color: daysRemaining.isEven ? Colors.orange.shade100 : Colors.purple.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tanggal yang kamu nantikan tersisa:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '$daysRemaining Hari',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () => navigateCountdown(daysRemaining),
                child: Text(daysRemaining > 1 ? 'Lanjutkan' : 'Selesai'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
