import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/config/widgets/appbar.dart';
import 'package:rakna_graduation_project/config/widgets/constants.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  static const String routName = "HistoryPage";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: MyAppBar(
        app_bar_name: "History",
        center_Title: true,
        font_Size: 25,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
