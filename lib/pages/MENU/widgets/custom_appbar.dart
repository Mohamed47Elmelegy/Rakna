import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rakna_graduation_project/config/constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? username;
  String? email;
  @override
  void initState() {
    super.initState();
    retrieveUserData(); // استدعاء الوظيفة لاستعادة البيانات عند تحميل الصفحة
  }

  Future<void> retrieveUserData() async {
    final storage = FlutterSecureStorage();
    String? storedUsername = await storage.read(key: "name");
    String? storedEmail = await storage.read(key: "email");
    setState(() {
      username = storedUsername;
      email = storedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: Constants.mediaQuery.width * 0.7,
                height: Constants.mediaQuery.height * 0.07,
                decoration: BoxDecoration(
                  color: const Color(0xff3C3F46),
                  borderRadius: BorderRadius.circular(
                    80,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ClipRect(
                      child: CircleAvatar(
                        //User Image
                        backgroundImage: AssetImage('assets/icons/artwork.png'),
                        radius: 20,
                      ),
                    ),
                    const Gap(15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello.${username ?? 'N/A'}",
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          email ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: const Color(0xff2B2B2B),
    );
  }
}
