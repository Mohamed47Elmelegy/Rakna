import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rakna_graduation_project/config/widgets/constants.dart';
import 'package:rakna_graduation_project/config/widgets/custom_login_sginup_button.dart';
import 'package:rakna_graduation_project/config/widgets/custom_text_field.dart';

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
  Uint8List? _image;
  File? selectedImage;
  String? imageUrl;

  void _saveDataToFirebase() async {
    try {
      await FirebaseFirestore.instance.collection('profiles').add({
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'platesNumber': platesNumber,
        'gender': _dropdownValue,
      });
      // Data saved successfully
      print('Data saved to Firebase');
    } catch (e) {
      // Error saving data
      print('Error saving data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 250,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : const CircleAvatar(
                              radius: 250,
                              backgroundImage:
                                  AssetImage("assets/icons/download.png"),
                            ),
                      Positioned(
                        bottom: -10,
                        right: 119,
                        child: IconButton(
                          onPressed: () {
                            showImagePickerOption(context);
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
              const SizedBox(height: 25),
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
                  const SizedBox(height: 18),
                  CustomButton(
                    text: 'Confirm',
                    isEnabled: true,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        setState(() {
                          autovalidateMode = AutovalidateMode.disabled;
                        });
                        _saveDataToFirebase();
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

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    selectedImage = File(pickedImage.path);
    _image = await selectedImage!.readAsBytes();

    uploadImageToFirebaseStorage();
  }

  Future _pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;

    selectedImage = File(pickedImage.path);
    _image = await selectedImage!.readAsBytes();

    uploadImageToFirebaseStorage();
  }

  Future<void> uploadImageToFirebaseStorage() async {
    if (selectedImage == null) return;

    try {
      // Upload image to Firebase Storage
      final storageRef =
          FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');
      await storageRef.putFile(selectedImage!);

      // Get download URL
      imageUrl = await storageRef.getDownloadURL();

      // Save download URL to Firestore
      await FirebaseFirestore.instance.collection('images').add({
        'url': imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });

      setState(() {
        // Update UI with the new image
        // (if you want to display it after upload)
      });
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }
}
