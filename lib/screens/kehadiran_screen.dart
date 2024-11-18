import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/absensi_kehadiran.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Mahasiswa')),
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
