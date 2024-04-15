import 'package:flutter/material.dart';

class CusotmHistoryWidget extends StatelessWidget {
  const CusotmHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Subtract.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
