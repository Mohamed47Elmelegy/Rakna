import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakna_graduation_project/pages/SignIn/pages/login_page.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/constants.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});
  static String routName = 'Splash_Screen';
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              from: 150,
              duration: const Duration(microseconds: 670000),
              delay: const Duration(microseconds: 1),
              child: Image.asset(
                'assets/icons/group361690.png',
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            FadeInUp(
              from: 160,
              duration: const Duration(microseconds: 550000),
              child: Image.asset(
                'assets/icons/group36690.png',
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            FadeInRight(
              from: 150,
              duration: const Duration(microseconds: 670000),
              child: Image.asset('assets/icons/group366190.png'),
            ),
          ],
        ),
      ),
    );
  }
}
