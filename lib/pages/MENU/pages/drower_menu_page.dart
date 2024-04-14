// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:rakna_graduation_project/layout_view.dart';
// import 'package:rakna_graduation_project/pages/History/pages/history.dart';
// import 'package:rakna_graduation_project/pages/help/page/help.dart';

// class DrowerMenu extends StatefulWidget {
//   const DrowerMenu({super.key});
//   static const String routName = "DrowerMenu";

//   @override
//   State<DrowerMenu> createState() => _DrowerMenuState();
// }

// class _DrowerMenuState extends State<DrowerMenu> {
//   List<ScreenHiddenDrawer> _pages = [];

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: "History",
//           baseStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//           selectedStyle: const TextStyle(),
//         ),
//         const History(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: "Help",
//           baseStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//           selectedStyle: const TextStyle(),
//         ),
//         const Help(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: "Log Out",
//           baseStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//           selectedStyle: const TextStyle(),
//         ),
//         const Help(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: "Report",
//           baseStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//           selectedStyle: const TextStyle(),
//         ),
//         const Help(),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       screens: _pages,
//       backgroundColorMenu: const Color(0xff5B5B5B),
//       initPositionSelected: 0,
//     );
//   }
// }
