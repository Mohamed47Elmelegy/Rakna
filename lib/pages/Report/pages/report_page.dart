import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rakna_graduation_project/config/widgets/appbar.dart';
import 'package:rakna_graduation_project/config/widgets/custom_login_sginup_button.dart';
import 'package:rakna_graduation_project/pages/Report/widgets/custom_text_field_report.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/constants.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});
  static const String routName = "ReportsPage";
  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String? name, problem;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: const MyAppBar(
        app_bar_name: "",
        center_Title: true,
        font_Size: 25,
      ),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Report',
                style: TextStyle(
                    color: kPrimaryColorText,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 580,
                  decoration: ShapeDecoration(
                    color: const Color(0xff4c4c4c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          child: Image.asset(
                            'assets/icons/warning.png',
                            height: 500,
                            width: 500,
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: kPrimaryColorText,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        CustomTextFieldReport(
                          onSaved: (value) {
                            name = value;
                          },
                          hint: 'Karam Mohamed',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          children: [
                            Text(
                              'Type your problem',
                              style: TextStyle(
                                color: kPrimaryColorText,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        CustomTextFieldReport(
                          onSaved: (value) {
                            problem = value;
                          },
                          hint: 'content',
                          maxLines: 7,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 0.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                text: 'Confirm',
                isEnabled: true,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(() {
                      autovalidateMode = AutovalidateMode.disabled;
                    });
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
