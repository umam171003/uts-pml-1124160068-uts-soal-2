import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget{
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

class _ProfilePageState extends State<ProfilePage>{
  int selectedIndex = 0;

  Future<void> editProfile() async{
    final result = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          profile: widget.profile,
        ),
      ),
    );

    if (result != null){
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
  Widger
}