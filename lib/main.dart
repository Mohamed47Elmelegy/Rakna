import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:rakna_graduation_project/config/constants/application_theme_manger.dart';
import 'package:rakna_graduation_project/firebase_options.dart';
import 'package:rakna_graduation_project/pages/1stDASHBOARD/pages/dash_bord_page.dart';
import 'package:rakna_graduation_project/pages/Datails/pages/qr_data.dart';
import 'package:rakna_graduation_project/pages/ForgotPassword/pages/forgot_password.dart';
import 'package:rakna_graduation_project/pages/History/pages/history.dart';
import 'package:rakna_graduation_project/pages/MENU/pages/menu.dart';
import 'package:rakna_graduation_project/pages/PrivacyPolicey/pages/privacy_policey.dart';
import 'package:rakna_graduation_project/pages/Report/pages/report_page.dart';
import 'package:rakna_graduation_project/pages/SignIn/pages/login_page.dart';
import 'package:rakna_graduation_project/pages/SignUp/pages/signup_page.dart';
import 'package:rakna_graduation_project/pages/Splash/pages/splash_screen.dart';
import 'package:rakna_graduation_project/pages/profile/pages/profile_page.dart';
import 'package:rakna_graduation_project/pages/reserve/pages/reservation_parking.dart';
import 'package:rakna_graduation_project/layout_view.dart';
import 'package:rakna_graduation_project/services/fcm_services.dart';
import 'package:rakna_graduation_project/services/loading_service.dart';
import 'package:rakna_graduation_project/setting_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //To ensure that everything await is initialized before the application is executed
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FcmService.init(); //MassigeNotification
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: const Rakna(),
    ),
  );
  configLoading();
}

class Rakna extends StatefulWidget {
  const Rakna({super.key});

  @override
  State<Rakna> createState() => _RaknaState();
}

class _RaknaState extends State<Rakna> {
  // This widget is the root of your application.
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('========User is currently signed out!');
      } else {
        print('========User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return MaterialApp(
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ApplicationThemeManager.applicationThemeData,
      themeMode: ThemeMode.light,
      initialRoute: Splash_Screen.routName,
      routes: {
        Splash_Screen.routName: (context) => const Splash_Screen(),
        LayoutView.routName: (context) => const LayoutView(),
        Tickets.routName: (context) => const Tickets(),
        Reservation.routName: (context) => const Reservation(),
        ProfilePage.routName: (context) => const ProfilePage(),
        HistoryPage.routName: (context) => const HistoryPage(),
        MenuDrower.routName: (context) => const MenuDrower(),
        ReportsPage.routName: (context) => const ReportsPage(),
        LoginPage.routName: (context) => const LoginPage(),
        ForgotPassword.routName: (context) => const ForgotPassword(),
        SginUp.routName: (context) => const SginUp(),
        Splash_Screen.routName: (context) => const Splash_Screen(),
        DashBordPage.routName: (context) => const DashBordPage(),
        PrivacyPoliceyPage.routName: (context) => const PrivacyPoliceyPage(),
      },
    );
  }
}
