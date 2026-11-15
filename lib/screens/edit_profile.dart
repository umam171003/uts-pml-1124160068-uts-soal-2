
import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController prodiController;
  late TextEditingController kelasController;
  late TextEditingController bioController;
  late TextEditingController emailController;
  late TextEditingController hpController;
  late TextEditingController githubController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.profile.nama,
    );

    nimController = TextEditingController(
      text: widget.profile.nim,
    );

    prodiController = TextEditingController(
      text: widget.profile.prodi,
    );

    kelasController = TextEditingController(
      text: widget.profile.kelas,
    );

    bioController = TextEditingController(
      text: widget.profile.bio,
    );

    emailController = TextEditingController(
      text: widget.profile.email,
    );

    hpController = TextEditingController(
      text: widget.profile.HP,
    );

    githubController = TextEditingController(
      text: widget.profile.github,
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    prodiController.dispose();
    kelasController.dispose();
    bioController.dispose();
    emailController.dispose();
    hpController.dispose();
    githubController.dispose();

    super.dispose();
  }

  void simpanProfil() {
    if (formKey.currentState!.validate()) {
      final dataBaru = Profile(
        nama: namaController.text,
        nim: nimController.text,
        prodi: prodiController.text,
        kelas: kelasController.text,
        bio: bioController.text,
        email: emailController.text,
        HP: hpController.text,
        github: githubController.text,
      );

      Navigator.pop(context, dataBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                  labelText: 'Program Studi',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email wajib diisi';
                  }

                  final emailRegex = RegExp(
                    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                  );

                  if (!emailRegex.hasMatch(value)) {
                    return 'Format email tidak valid';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: hpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor HP wajib diisi';
                  }

                  if (!RegExp(r'^[0-9]{10,13}$').hasMatch(value)) {
                    return 'Nomor HP harus 10-13 digit angka';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: githubController,
                decoration: const InputDecoration(
                  labelText: 'Akun GitHub',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: simpanProfil,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Profil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
