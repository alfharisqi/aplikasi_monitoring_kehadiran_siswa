import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/absensi_kehadiran.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceHistory = Provider.of<AttendanceProvider>(context).attendanceHistory;

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: attendanceHistory.length,
        itemBuilder: (ctx, index) {
          final record = attendanceHistory[index];
          return ListTile(
            title: Text(DateFormat('dd MMM yyyy').format(record['date'])),
            subtitle: Text('Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}'),
          );
        },
      ),
    );
  }
}
