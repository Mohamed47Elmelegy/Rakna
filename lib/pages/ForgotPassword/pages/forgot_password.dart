import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/pages/ForgotPassword/widgets/custom_textfield.dart';

import 'package:rakna_graduation_project/pages/SignIn/widgets/constants.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/custom_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static String routName = 'ForgotPassword';
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // String? password;
  // String? confirmPassword;
  String? email;

  GlobalKey<FormState> formKey = GlobalKey();

  //firebase resetPass
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password Reset Email Sent! Check Your Email.'),
        ),
      );
      // Inform the user that the email has been sent
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.message}'),
        ),
      ); // Handle error, e.g., user not found or invalid email
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/icons/img.png',
                    height: 250,
                    width: 250,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: kPrimaryColorText,
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Dont worry! it happens. Please enter the email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'associated with your account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          'Email Address',
                          style: TextStyle(
                            color: kPrimaryColorText,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Enter your email address',
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomButtonKm(
                    text: 'Reset Password',
                    onTap: () {
                      if (formKey.currentState!.validate() && email != null) {
                        sendPasswordResetEmail(email!);
                      } else {
                        // Inform the user to enter their email if it's null
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your email.'),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
