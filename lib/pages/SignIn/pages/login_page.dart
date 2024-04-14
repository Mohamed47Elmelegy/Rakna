import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rakna_graduation_project/config/widgets/custom_text_field.dart';
import 'package:rakna_graduation_project/pages/1stDASHBOARD/pages/dash_bord_page.dart';
import 'package:rakna_graduation_project/pages/ForgotPassword/pages/forgot_password.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/constants.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/custom_button.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/custom_container.dart';
import 'package:rakna_graduation_project/services/snack_bar_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String routName = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isLoading = false;
  bool _obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> signInWithGoogle() async {
    // GoogleSignInAccount
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to DashBordPage
      Navigator.pushNamed(context, "DashBordPage");
    } catch (e) {
      // Handle the sign-in error
      print("Error signing in with Google: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              right: -500,
              top: -300,
              bottom: 530,
              child: Image.asset(
                'assets/icons/subtract.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(1),
                    const SizedBox(
                      height: 130,
                    ),
                    Center(
                      child: Image.asset(
                        kLogin,
                        height: 100,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Email address',
                      style: TextStyle(color: kPrimaryColorText, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: "E-mail address",
                      suffixWidget: const Icon(
                        Icons.email_rounded,
                        color: Color(0xffF8A00E),
                      ),
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your e-mail address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(color: kPrimaryColorText, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        password = data;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      hint: "Enter your password",
                      isPassword: true,
                      maxLines: 1,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ForgotPassword.routName,
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: kPrimaryColorText, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButtonKm(
                      text: 'Sign In',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            // Check if email is verified
                            User? user = FirebaseAuth.instance.currentUser;
                            if (user != null && user.emailVerified) {
                              // Email is verified, navigate to dashboard
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                DashBordPage.routName,
                                (route) => false,
                              );
                            } else {
                              // Email is not verified, show a message
                              SnackBarService.showErrorMessage(
                                  "Please verify your email.");
                            }
                          } catch (e) {
                            print("Error signing in: $e");
                            SnackBarService.showErrorMessage(
                                "Error signing in. Please try again.");
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in with',
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 93, 93),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const containerIcons(
                          height: 60,
                          width: 60,
                          decorationColor: Color(0xff454545),
                          borderColor: kPrimaryColorText,
                          asset: 'assets/icons/vector.png',
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const containerIcons(
                          height: 60,
                          width: 60,
                          decorationColor: Color(0xff454545),
                          borderColor: kPrimaryColorText,
                          asset: 'assets/icons/apple.png',
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            signInWithGoogle();
                          },
                          child: const containerIcons(
                            height: 60,
                            width: 60,
                            decorationColor: Color(0xff454545),
                            borderColor: kPrimaryColorText,
                            asset: 'assets/icons/google.png',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'SginUp');
                          },
                          child: const Text(
                            ' Sign Up',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
