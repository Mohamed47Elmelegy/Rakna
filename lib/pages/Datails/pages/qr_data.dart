import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rakna_graduation_project/config/widgets/appbar.dart';
import 'package:rakna_graduation_project/config/widgets/constants.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:firebase_core/firebase_core.dart';

class ReservationModel {
  final String? startTime;
  final String? endTime;
  final double totalCost;
  final String date;

  ReservationModel({
    this.startTime,
    this.endTime,
    required this.totalCost,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'start_time': startTime,
      'end_time': endTime,
      'total_cost': totalCost,
      'date': date,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      startTime: map['start_time'],
      endTime: map['end_time'],
      totalCost: map['total_cost'],
      date: map['date'],
    );
  }
}

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);
  static String routName = 'Tickets';

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  ReservationModel? reservation;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((_) {
      _fetchLatestReservation();
    });
  }

  Future<void> _fetchLatestReservation() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('reservations')
          .orderBy('date', descending: true)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        setState(() {
          reservation =
              ReservationModel.fromMap(doc.data() as Map<String, dynamic>);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        isError = true;
      });
      print('Error fetching latest reservation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: const MyAppBar(
        app_bar_name: 'Details',
        center_Title: true,
        font_Size: 30,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : isError
                ? const Text(
                    'Error fetching latest reservation',
                    style: TextStyle(color: Colors.white),
                  )
                : reservation == null
                    ? const Text(
                        'No reservations available',
                        style: TextStyle(color: Colors.white),
                      )
                    : SizedBox(
                        child: TicketWidget(
                          width: 300,
                          height: 550,
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
                              const SizedBox(height: 25),
                              const Text(
                                'Rakna',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Start Time: ${_formatTime(reservation!.startTime)}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: QrImageView(
                                  data:
                                      'Start Time: ${_formatTime(reservation!.startTime)}\n'
                                      'End Time: ${_formatTime(reservation!.endTime)}\n'
                                      'Date: ${reservation!.date}\n'
                                      'Total Cost: ${reservation!.totalCost.toString()} EGP',
                                  version: QrVersions.auto,
                                  size: 250.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
      ),
    );
  }

  String _formatTime(String? time) {
    if (time == null) return 'No time available';
    return time;
  }
}
