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