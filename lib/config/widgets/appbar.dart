import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.app_bar_name,
    required this.center_Title,
    required this.font_Size,
  }) : super(key: key);
  final String app_bar_name;
  final bool center_Title;
  final double font_Size;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      centerTitle: center_Title,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        app_bar_name,
        style: TextStyle(
            color: Color(0xfff8a00e),
            fontSize: font_Size,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
