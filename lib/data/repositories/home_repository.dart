import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/home_models.dart';

class HomeRepository {
  Future<HomeData> fetchHome() async {
    final raw = await rootBundle.loadString('assets/data/list.json');
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final data = HomeData.fromJson(map);

    // Ensure to show bundled avatars if JSON left them empty/remote.
    final safeUser = data.user.profileImage.isEmpty ||
            data.user.profileImage.startsWith('http')
        ? data.user.copyWith(profileImage: 'assets/profile.png')
        : data.user;

    return data.copyWith(user: safeUser);
  }
}
