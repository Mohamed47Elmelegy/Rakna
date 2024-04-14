import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/config/constants/constants.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: const ImageIcon(
                    AssetImage('assets/icons/arrow_back.png'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Text(
              title,
              style: Constants.theme.textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
