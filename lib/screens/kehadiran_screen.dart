import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/absensi_kehadiran.dart';
import 'package:intl/intl.dart'; // Tambahkan untuk memformat tanggal

class KehadiranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AbsensiKehadiran>(context);
    final String currentDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Presensi Mahasiswa'),
            Text(
              currentDate,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/logo_univ.jpeg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          ListView.builder(
            itemCount: attendanceProvider.siswas.length,
            itemBuilder: (ctx, index) {
              final student = attendanceProvider.siswas[index];
              return CheckboxListTile(
                title: Text(student.name),
                value: student.isPresent,
                onChanged: (bool? value) {
                  attendanceProvider.toggleAttendance(index);
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: attendanceProvider.siswas.isEmpty
          ? null
          : FloatingActionButton.extended(
        onPressed: () {
          attendanceProvider.saveAttendance();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Kehadiran disimpan')),
          );
        },
        label: Text('Simpan Kehadiran'),
      ),
    );
  }
}
