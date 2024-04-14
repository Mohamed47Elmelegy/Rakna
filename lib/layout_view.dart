import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna_graduation_project/setting_provider.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static String routName = "LayoutView";

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    // return Scaffold(
    //   bottomNavigationBar: CurvedNavigationBar(
    //     buttonBackgroundColor: const Color(0xffF8A00E),
    //     backgroundColor: const Color(0xff5B5B5B),
    //     color: const Color(0xff2A2A2A),
    //     animationDuration: const Duration(milliseconds: 400),
    //     onTap: vm.changeIndex,
    //     items: const [
    //       ImageIcon(
    //         AssetImage(
    //           'assets/icons/iconex_broken_home.png',
    //         ),
    //       ),
    //       ImageIcon(
    //         AssetImage('assets/icons/barcode.png'),
    //       ),
    //       ImageIcon(
    //         AssetImage('assets/icons/book.png'),
    //       ),
    //       ImageIcon(
    //         AssetImage('assets/icons/iconex_broken_user.png'),
    //       ),
    //     ],
    //   ),
    //   extendBody: true,
    //   body: vm.screens[vm.currentIndex],
    // );var vm = Provider.of<SettingsProvider>(context);
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      // showModalBottomSheet(
      //   context: context,
      //   isDismissible: true,
      //   backgroundColor: Colors.transparent,
      // builder: (context) => TaskBottomSheet(),
      // );
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      extendBody: true,
      body: vm.screens[vm.currentIndex],
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          currentIndex: vm.currentIndex,
          onTap: vm.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/icons/iconex_broken_home.png',
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/barcode.png'),
              ),
              label: "Datails",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/book.png'),
              ),
              label: "Reservation",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/iconex_broken_user.png'),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
