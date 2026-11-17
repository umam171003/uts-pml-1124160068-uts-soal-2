import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage('assets/images/umam.jpeg'),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'Tentang Saya',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Keahlian dan Hobi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Programming'),
              subtitle: Text('Belajar Flutter dan Dart'),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.computer),
              title: Text('Software Engineering'),
              subtitle: Text('Mempelajari pengembangan aplikasi'),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Belajar Teknologi'),
              subtitle: Text('Mempelajari teknologi terbaru'),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('Perguruan Tinggi'),
              subtitle: Text('Program Studi Software Engineering'),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('SMA / SMK'),
              subtitle: Text('Isi nama sekolah dan tahun lulus'),
            ),
          ),
        ],
      ),
    );
  }
}
