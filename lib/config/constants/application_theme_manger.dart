import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color prymaryColor = Color(0xff2B2B2B);
  static ThemeData applicationThemeData = ThemeData(
    primaryColor: prymaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    //AppBarrTheme  Style
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: prymaryColor,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(35),
    //       bottomRight: Radius.circular(35),
    //     ),
    //   ), //IconTheme
    //   iconTheme: IconThemeData(
    //     color: Color(0xffF8A00E),
    //     size: 35,
    //   ),
    //   centerTitle: true,
    // ),
    iconTheme: const IconThemeData(
      size: 30,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      padding: EdgeInsets.zero,
      color: Color(0xff2B2B2B),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Color(0xFFF8A00E),
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xff9F9F9F),
        size: 30,
      ),
    ),
    // TextTheme Style Font(Color , Width & Famiy)
    // textTheme: const TextTheme(
    //   titleLarge: TextStyle(
    //     fontWeight: FontWeight.w500,
    //     fontSize: 22,
    //     color: Color(0xffF8A00E),
    //   ),
    //   bodyLarge: TextStyle(
    //     fontFamily: "Exo",
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //     color: Color(0xffF8A00E),
    //   ),
    //   bodyMedium: TextStyle(
    //     fontFamily: "Exo",
    //     fontWeight: FontWeight.w500,
    //     fontSize: 22,
    //     color: Color(0xffF8A00E),
    //   ),
    //   bodySmall: TextStyle(
    //     fontFamily: "Exo",
    //     fontWeight: FontWeight.w400,
    //     fontSize: 14,
    //     color: Color(0xffF8A00E),
    //   ),
    // ),
  );
}
