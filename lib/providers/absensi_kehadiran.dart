import 'package:flutter/material.dart';
import '../models/siswa.dart';

class AttendanceProvider with ChangeNotifier {
  List<Siswa> _siswas = [
    Siswa(name: 'Ali'),
    Siswa(name: 'Budi'),
    Siswa(name: 'Citra'),
  ];

  List<Map<String, dynamic>> _attendanceHistory = [];

  List<Siswa> get siswas => _siswas;
  List<Map<String, dynamic>> get attendanceHistory => _attendanceHistory;

  void toggleAttendance(int index) {
    _siswas[index].isPresent = !_siswas[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    final currentDate = DateTime.now();
    int presentCount = _siswas.where((s) => s.isPresent).length;
    int absentCount = _siswas.length - presentCount;

    _attendanceHistory.insert(0, {
      'date': currentDate,
      'present': presentCount,
      'absent': absentCount,
    });

    for (var student in _siswas) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
