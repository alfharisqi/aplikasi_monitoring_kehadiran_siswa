import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/absensi_kehadiran.dart';
import 'package:intl/intl.dart';

class RiwayatKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceHistory = Provider.of<AbsensiKehadiran>(context).attendanceHistory;

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran Mahasiswa')),
      body: Stack(
        children: [
          // Background logo
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/logo_univ.jpeg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // ListView untuk menampilkan riwayat kehadiran
          ListView.builder(
            itemCount: attendanceHistory.length,
            itemBuilder: (ctx, index) {
              final record = attendanceHistory[index];
              return ListTile(
                title: Text(DateFormat('dd MMM yyyy').format(record['date'])),
                subtitle: Text('Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
