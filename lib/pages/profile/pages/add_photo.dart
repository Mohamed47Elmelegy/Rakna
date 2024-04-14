import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add_photo extends StatefulWidget {
  const Add_photo({super.key});

  @override
  State<Add_photo> createState() => _Add_photoState();
}

class _Add_photoState extends State<Add_photo> {
  Uint8List? _image;
  File? selectedIMage;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B2B2B),
      body: Center(
        child: Stack(children: [
          _image != null
              ? CircleAvatar(
                  radius: 200,
                  backgroundImage: MemoryImage(_image!),
                )
              : const CircleAvatar(
                  radius: 250,
                  backgroundImage: AssetImage("assets/icons/download.png"),
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
        ]),
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
                      _PickImageFromGallery();
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
                      _PickImageFromCamera();
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

  Future<void> uploadImage(File image) async {
    try {
      String userId = 'User_Id';

      // Firebase Storage عشان يخزن الصوره في
      TaskSnapshot snapshot =
          await _storage.ref('profilePictures/$userId').putFile(image);
      //  عشان ياخد URL بتاع الصوره
      String imageUrl = await snapshot.ref.getDownloadURL();

      // عشان يخزن ال URL في ال FIRESTORE
      await _firestore
          .collection('users')
          .doc(userId)
          .set({'profilePicture': imageUrl}, SetOptions(merge: true));

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile picture updated!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile picture: $e')));
    }
  }

  Future _PickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _PickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
