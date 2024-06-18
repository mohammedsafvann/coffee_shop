import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preference.dart';

class LoginController {
  bool isLogin = false;
  // signInWithGoogle(BuildContext context) async {
  Future<bool> signInWithGoogle() async {
    try {
      print("jsdasdsak");
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      print("Google Sign-In Account: $googleSignInAccount");
      if (googleSignInAccount == null) {
        print("User canceled Google Sign-In");
      }
      print("aaaaaaaaaaaaaaaaaaa");

      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        SharedPreferenceHelper.saveBoolValue(value: true);
        SharedPreferenceHelper.saveStringValue(uid: user.uid);
        isLogin = true;
      }

      addFireStoreUserData(email: user!.email.toString(), uid: user!.uid);
      return isLogin;
    } catch (error) {
      print('Google Sign-In failed: $error');
    }
    return isLogin;
  }

  addLocalStorage() {}
  addFireStoreUserData({
    required String email,
    required String uid,
  }) {
    FirebaseFirestore.instance
        .collection("user")
        .add({"email": email, "name": "", "uid": uid});
  }
}
