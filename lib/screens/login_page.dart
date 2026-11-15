
import 'package:flutter/material.dart';
import 'profile_page.dart';
import '../models/profile.dart';

class LoginPage extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const LoginPage({
    super.key,
    required this.onThemeChanged,
  });

  void login(BuildContext context) {
    final profile = Profile(
      nama: 'Muhammad Umam Khaerurojikin',
      nim: '2400068',
      prodi: 'Software Engineering',
      kelas: 'TI SE24',
      bio: 'Mahasiswa yang tertarik dengan dunia teknologi dan pemrograman.',
      email: 'umam@gmail.com',
      HP: '081234567890',
      github: 'github.com/username',
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          profile: profile,
          onThemeChanged: onThemeChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text('Silakan masuk ke aplikasi profil'),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => login(context),
                  child: const Text('MASUK'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

