import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rakna_graduation_project/config/widgets/custom_text_field.dart';
import 'package:rakna_graduation_project/network_layer/firebase_utils.dart';
import 'package:rakna_graduation_project/pages/SignIn/pages/login_page.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/custom_button.dart';
import 'package:rakna_graduation_project/services/snack_bar_service.dart';

class SginUp extends StatefulWidget {
  static const String routName = "SginUp";

  const SginUp({Key? key}) : super(key: key);

  @override
  State<SginUp> createState() => _SginUpState();
}

class _SginUpState extends State<SginUp> {
  bool agreeToTerms = false;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/signup.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mediaQuery.height * 0.17),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: "AgencyFB",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'create an account to continue!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Actor"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Full Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xffF8A000),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  CustomTextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    hint: "Enter your full name",
                    hintColor: const Color(0xff606060),
                    suffixWidget: const Icon(
                      Icons.person,
                      color: Color(0xffF8A00E),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "E-mail",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xffF8A000),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your e-mail address",
                    hintColor: const Color(0xff606060),
                    suffixWidget: const Icon(
                      Icons.email_rounded,
                      color: Color(0xffF8A00E),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your e-mail address";
                      }

                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid e-mail address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Phone Number",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xffF8A000),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  CustomTextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    hint: "Enter your phone number",
                    hintColor: const Color(0xff606060),
                    suffixWidget: const Icon(
                      Icons.phone,
                      color: Color(0xffF8A00E),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your phone number";
                      } else if (value.length != 11) {
                        return "Mobile number must be of 11 digits";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Password",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xffF8A000),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  CustomTextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hint: "Enter your password",
                    hintColor: const Color(0xff606060),
                    isPassword: true,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your password";
                      }

                      var regex = RegExp(
                          r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.//n])(?=.*[A-Z])(?=.*[a-z]).*$");
                      if (!regex.hasMatch(value)) {
                        return "Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        value: agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            agreeToTerms = value!;
                          });
                        },
                      ),
                      const Text(
                        'I agree to the terms of service and ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "PrivacyPoliceyPage");
                        },
                        child: const Text(
                          'privacy policy',
                          style: TextStyle(
                            color: Color(0xFF4D97F6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  CustomButtonKm(
                    text: "Sign Up",
                    onTap: signUp,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xFF4D97F6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      if (!agreeToTerms) {
        SnackBarService.showErrorMessage(
            "You must agree to the terms of service.");
        return;
      }

      // Create new account in Firebase
      bool success = await FirebaseUtils().createNewAccount(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (success) {
        // Save user data securely using Flutter Secure Storage
        const storage = FlutterSecureStorage();
        await storage.write(key: "name", value: nameController.text.trim());
        await storage.write(key: "email", value: emailController.text.trim());
        await storage.write(key: "phone", value: phoneController.text.trim());
// Assuming you have a Firestore collection named 'users'
        FirebaseFirestore.instance.collection('users').add({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          // You might want to hash the password before saving it to Firestore
          // But for simplicity, I'll just save it as it is. Make sure to secure this.
        });
        SnackBarService.showSuccessMessage("Account successfully created");
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginPage.routName,
          (route) => false,
        );
      } else {
        SnackBarService.showErrorMessage("Failed to create account.");
      }
    }
  }
}
