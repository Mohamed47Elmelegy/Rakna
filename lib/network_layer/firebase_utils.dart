// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:rakna_graduation_project/services/snack_bar_service.dart';

// class FirebaseUtils {
//   Future<bool> createNewAccount(String emailAddress, String password) async {
//     try {
//       EasyLoading.show();
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailAddress,
//         password: password,
//       );

//       print(credential.user);
//       EasyLoading.dismiss();
//       return Future.value(true);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//         SnackBarService.showErrorMessage("The password provided is too weak.");
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//         SnackBarService.showErrorMessage(
//             'The account already exists for that email.');
//       }
//       EasyLoading.dismiss();
//       return Future.value(false);
//     } catch (e) {
//       print(e);
//       EasyLoading.dismiss();
//       return Future.value(false);
//     }
//   }

//   Future<bool> signIN(String emailAddress, String password) async {
//     try {
//       EasyLoading.show();
//       final credential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: emailAddress, password: password);
//       EasyLoading.dismiss();
//       return Future.value(true);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//         SnackBarService.showErrorMessage('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');

//         SnackBarService.showErrorMessage(
//             'Wrong password provided for that user.');
//       }
//       EasyLoading.dismiss();
//       return Future.value(false);
//     }
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rakna_graduation_project/services/snack_bar_service.dart';

class FirebaseUtils {
  Future<bool> createNewAccount(String emailAddress, String password) async {
    try {
      EasyLoading.show();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // Send verification email
      await credential.user!.sendEmailVerification();

      EasyLoading.dismiss();
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        SnackBarService.showErrorMessage("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        SnackBarService.showErrorMessage(
            'The account already exists for that email.');
      }
      EasyLoading.dismiss();
      return Future.value(false);
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
      return Future.value(false);
    }
  }

  Future<bool> signIn(String emailAddress, String password) async {
    try {
      EasyLoading.show();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      EasyLoading.dismiss();
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SnackBarService.showErrorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        SnackBarService.showErrorMessage(
            'Wrong password provided for that user.');
      }
      EasyLoading.dismiss();
      return Future.value(false);
    }
  }
}
