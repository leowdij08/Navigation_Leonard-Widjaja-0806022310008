import 'package:flutter/material.dart';

// Provider untuk mengelola data tanggal yang dipilih
class DateProvider extends ChangeNotifier {
  // Menyimpan daftar tanggal yang dipilih
  final List<DateTime> _selectedDates = [];

  // Getter untuk mendapatkan daftar tanggal yang telah dipilih
  List<DateTime> get selectedDates => _selectedDates;

  // Menambahkan tanggal ke daftar, jika belum ada
  void addDate(DateTime date) {
    // Periksa apakah tanggal sudah ada di dalam daftar
    if (!_selectedDates.contains(date)) {
      _selectedDates.add(date);  // Menambahkan tanggal ke daftar
      notifyListeners();  // Memberitahu listener (UI) untuk melakukan pembaruan
    }
  }

  // Menghapus semua tanggal yang disimpan
  void clearDates() {
    _selectedDates.clear();  // Menghapus seluruh daftar tanggal
    notifyListeners();  // Memberitahu listener bahwa data telah berubah
  }
}
