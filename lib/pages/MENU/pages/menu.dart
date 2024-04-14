import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rakna_graduation_project/config/constants/constants.dart';
import 'package:rakna_graduation_project/pages/Report/pages/report_page.dart';
import 'package:rakna_graduation_project/pages/SignIn/pages/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MenuDrower extends StatefulWidget {
  const MenuDrower({
    super.key,
    this.image,
  });
  static const String routName = "MenuDrower";
  final String? image;

  @override
  State<MenuDrower> createState() => _MenuDrowerState();
}

class _MenuDrowerState extends State<MenuDrower> {
  String? userName;
  @override
  void initState() {
    super.initState();
    retrieveUserData(); // استدعاء الوظيفة لاستعادة البيانات عند تحميل الصفحة
  }

  Future<void> retrieveUserData() async {
    final storage = FlutterSecureStorage();
    String? storedUsername = await storage.read(key: "name");

    setState(() {
      userName = storedUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff5B5B5B),
      width: Constants.mediaQuery.width * 0.8,
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            //Edit Profile Coulmn
            Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color(0xff5B5B5B),
                    width: Constants.mediaQuery.width * 0.8,
                    alignment: Alignment.centerLeft,
                    child: const ClipRect(
                      child: CircleAvatar(
                        //User Image
                        backgroundImage: AssetImage('assets/icons/artwork.png'),
                        radius: 30,
                      ),
                    ),
                  ),
                  const Gap(9),
                  //User Name
                  Text(
                    userName ?? 'N/A',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(12),
                  SizedBox(
                    width: 150,
                    height: 23,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "Profile");
                        },
                        child: const Row(
                          children: [
                            ImageIcon(
                              AssetImage(
                                'assets/icons/bytesize_edit.png',
                              ),
                              color: Color(0xffF8A00E),
                            ),
                            Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Constants.mediaQuery.height * 0.5,
              child: ListView(
                children: [
                  //Notifications Page
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(
                        'assets/icons/Notifications.png',
                      ),
                      color: Color(0xffF8A00E),
                    ),
                    title: const Text(
                      "Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "routeName");
                    },
                  ),
                  //  Dvider Line
                  Image.asset('assets/icons/Line 3.png'),
                  //History Page
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(
                        'assets/icons/backward_5_seconds.png',
                      ),
                      color: Color(0xffF8A00E),
                    ),
                    title: const Text(
                      "History",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "HistoryPage");
                    },
                  ),
                  //  Dvider Line
                  Image.asset('assets/icons/Line 3.png'),
                  //Help Page
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(
                        'assets/icons/help.png',
                      ),
                      color: Color(0xffF8A00E),
                    ),
                    title: const Text(
                      "Help",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "routeName");
                    },
                  ),
                  //  Dvider Line
                  Image.asset('assets/icons/Line 3.png'),
                  //LogOut Page
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(
                        'assets/icons/jam_log-out.png',
                      ),
                      color: Color(0xffF8A00E),
                    ),
                    title: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.routName);
                    },
                  ),
                  //  Dvider Line
                  Image.asset('assets/icons/Line 3.png'),
                  //Reports Page
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(
                        'assets/icons/bx_message.png',
                      ),
                      color: Color(0xffF8A00E),
                    ),
                    title: const Text(
                      "Reports",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, ReportsPage.routName);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
