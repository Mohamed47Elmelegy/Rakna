import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:rakna_graduation_project/config/widgets/appbar.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/constants.dart';
import 'package:ticket_widget/ticket_widget.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);
  static const String routName = "QRPage";
  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  // FirebaseFirestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void _saveTicketData(String data) {
    _firestore.collection('tickets').add({
      'garageName': 'RAKNA',
      'entryTime': '11:11',
      'qrData': data,
    }).then((DocumentReference document) {
      print('Ticket added with ID: ${document.id}');
    }).catchError((e) {
      print('Error adding ticket: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: const MyAppBar(
          app_bar_name: 'Details', center_Title: true, font_Size: 30),
      body: Center(
        child: SizedBox(
          child: TicketWidget(
            width: 350,
            height: 600,
            color: const Color(0xffE39628),
            isCornerRounded: true,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Ticket',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'garage name',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'RAKNA',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'entry time',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '11:11',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 230,
                  width: 230,
                  child: QrImageView(
                    // Pass your QR data here
                    data: 'Karam Mohamed Karam',
                    // String qrData = 'Karam Mohamed Karam';
                    // Additional properties as needed (version, size, etc.)
                    version: QrVersions.auto,
                    gapless: false,
                    size: 200,
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(80, 80),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
