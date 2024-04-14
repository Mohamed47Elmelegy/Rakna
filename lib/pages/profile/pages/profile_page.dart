import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/config/widgets/custom_login_sginup_button.dart';
import 'package:rakna_graduation_project/config/widgets/custom_text_field.dart';
import 'package:rakna_graduation_project/pages/MENU/pages/menu.dart';
import 'package:rakna_graduation_project/pages/MENU/widgets/custom_appbar.dart';
import 'package:rakna_graduation_project/pages/SignIn/widgets/constants.dart';
import 'package:rakna_graduation_project/pages/profile/pages/add_photo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String routName = 'Profile';
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _dropdownValue = 'Gender';
  String? name, phoneNumber, email, platesNumber;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _items = ['male', 'female', 'Gender'];

  //firebase firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      drawer: const MenuDrower(),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              const SizedBox(
                height: 150,
                width: 250,
                child: Add_photo(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Name',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 1),
                  CustomTextField(
                    onSaved: (value) {
                      name = value;
                    },
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 1),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      phoneNumber = value;
                    },
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your Phone Number";
                      } else if (value.length != 11) {
                        return "Mobile Number must be of 11 digit !";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Email',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 1),
                  CustomTextField(
                    onChanged: (value) {
                      email = value;
                    },
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your e-mail address";
                      }

                      var regex = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                      if (!regex.hasMatch(value)) {
                        return "Invalid e-mail address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      'Plates Number',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 1),
                  CustomTextField(
                    onSaved: (value) {
                      platesNumber = value;
                    },
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your name";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Container(
                    width: 140,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: DropdownButton(
                        items: _items.map((String item) {
                          return DropdownMenuItem(
                              value: item, child: Text(item));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropdownValue = newValue!;
                          });
                        },
                        value: _dropdownValue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomButton(
                    text: 'Confirm',
                    isEnabled: false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        //firebase firestore
                        String userId = "User_Id";
                        _firestore.collection('users').doc(userId).set({
                          'name': name,
                          'phoneNumber': phoneNumber,
                          'email': email,
                          'platesNumber': platesNumber,
                          'gender': _dropdownValue
                        }, SetOptions(merge: true)).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Profile Updated!')));
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Failed to update profile: $error')));
                        });
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
