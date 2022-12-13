import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Stream<User?> streamAuthStatus() {
  //   return auth.authStateChanges();
  // }

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  FirebaseAuth getAuth() => auth;

  Future<User?> login(String email, String password) async {
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      userCredential.credential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          print('invalid email, error code : ' + e.code);
          break;
        case 'wrong-password':
          print('invalid password, error code : ' + e.code);
          break;
        case 'user-not-found':
          print('user not found, error code : ' + e.code);
          break;
        case 'user-disabled':
          print('user disabled, error code : ' + e.code);
          break;
        default:
          print('error code : ' + e.code);
          break;
      }
    }
    return user;
  }

  void signup() {}
  void logout(BuildContext context, mounted) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pop(context);
  }
}
