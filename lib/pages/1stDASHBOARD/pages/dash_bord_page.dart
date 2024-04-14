import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rakna_graduation_project/config/constants/application_theme_manger.dart';
import 'package:rakna_graduation_project/config/constants/constants.dart';
import 'package:rakna_graduation_project/pages/MENU/pages/menu.dart';
import 'package:rakna_graduation_project/pages/MENU/widgets/custom_appbar.dart';

class DashBordPage extends StatelessWidget {
  const DashBordPage({super.key, this.freeSlots});
  static const String routName = "DashBordPage";
  final int? freeSlots; //free slots from firebase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      drawer: const MenuDrower(),
      body: Column(
        children: [
          Container(
              width: Constants.mediaQuery.width,
              color: ApplicationThemeManager.prymaryColor,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 22,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Book your place !',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Color(0xffF8A00E),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    width: Constants.mediaQuery.width * 0.88,
                    height: Constants.mediaQuery.height * 0.28,
                    child: Image.asset(
                      'assets/images/frame425.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Gap(20),
                  Container(
                    width: Constants.mediaQuery.width * 1,
                    height: Constants.mediaQuery.height * 0.4,
                    decoration: const BoxDecoration(
                      color: Color(0xff5B5B5B),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          60,
                        ),
                        topRight: Radius.circular(
                          60,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                /*freeSlots.toString()*/ "4", //Free Slots from firebase
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                              Gap(10),
                              Text(
                                "Free Slot",
                                style: TextStyle(
                                    fontSize: 28, color: Color(0xffF8A00E)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Image.asset("assets/images/Group 36681.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
