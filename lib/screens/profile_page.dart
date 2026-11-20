import 'package:flutter/material.dart';
import 'edit_profile.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;
  final Function(bool) onThemeChanged;

  const ProfilePage({
    super.key,
    required this.profile,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  Future<void> editProfile() async {
    final result = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: widget.profile),
      ),
    );

    if (result != null) {
      setState(() {
        widget.profile.nama = result.nama;
        widget.profile.nim = result.nim;
        widget.profile.prodi = result.prodi;
        widget.profile.kelas = result.kelas;
        widget.profile.bio = result.bio;
        widget.profile.email = result.email;
        widget.profile.HP = result.HP;
        widget.profile.github = result.github;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? 'profil saya' : 'Tentang saya'),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),

              child: Center(
                child: Text(
                  'MENU APLIKASI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SwitchListTile(
              title: const Text('Mode Gelap'),
              secondary: const Icon(Icons.dark_mode),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: widget.onThemeChanged,
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: selectedIndex == 0 ? buildProfile() : const AboutPage(),

      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              onPressed: editProfile,
              child: const Icon(Icons.edit),
            )
          : null,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }

  Widget buildProfile() {
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

          Text(
            widget.profile.nama,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(widget.profile.bio),

          const SizedBox(height: 25),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Identitas Mahasiswa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          InfoTile(
            icon: Icons.person,
            label: 'Nama Lengkap',
            value: widget.profile.nama,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Informasi Nama Lengkap')),
              );
            },
          ),

          InfoTile(
            icon: Icons.badge,
            label: 'NIM',
            value: widget.profile.nim,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('NIM: ${widget.profile.nim}')),
              );
            },
          ),

          InfoTile(
            icon: Icons.school,
            label: 'Program Studi',
            value: widget.profile.prodi,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Prodi: ${widget.profile.prodi}')),
              );
            },
          ),

          InfoTile(
            icon: Icons.class_,
            label: 'Kelas',
            value: widget.profile.kelas,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Kelas: ${widget.profile.kelas}')),
              );
            },
          ),

          InfoTile(
            icon: Icons.email,
            label: 'Email',
            value: widget.profile.email,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Email: ${widget.profile.email}')),
              );
            },
          ),

          InfoTile(
            icon: Icons.phone,
            label: 'Nomor HP',
            value: widget.profile.HP,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Nomor HP: ${widget.profile.HP}')),
              );
            },
          ),

          InfoTile(
            icon: Icons.code,
            label: 'GitHub',
            value: widget.profile.github,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Github: ${widget.profile.github}')),
              );
            },
          ),
        ],
      ),
    );
  }
}
