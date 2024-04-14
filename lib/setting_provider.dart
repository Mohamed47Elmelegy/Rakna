import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/pages/1stDASHBOARD/pages/dash_bord_page.dart';
import 'package:rakna_graduation_project/pages/Datails/pages/qr_data.dart';
import 'package:rakna_graduation_project/pages/profile/pages/profile_page.dart';
import 'package:rakna_graduation_project/pages/reserve/pages/reservation_parking.dart';

class SettingProvider extends ChangeNotifier {
  List<Widget> screens = [
    const DashBordPage(),
    const QRPage(),
    const ReservePage(),
    const ProfilePage()
  ];
  int currentIndex = 0;
  ThemeMode currentTheme = ThemeMode.light;
  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
