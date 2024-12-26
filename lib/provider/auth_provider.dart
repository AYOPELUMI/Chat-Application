import 'dart:developer';

import 'package:chat_application/res/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  Authenticated,
  NotAuthenticated,
  Authenticating,
  UserNotFound,
  Error
}

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  AuthStatus status = AuthStatus.NotAuthenticated;

  static AuthProvider instance = AuthProvider();

  void loginUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      status = AuthStatus.Authenticated;
      print("logged in successfully");
    } catch (e, _) {
      status = AuthStatus.Error;
      print(_);
      log(e.toString());
      HelperFunctions.context = context;
      HelperFunctions.showToast(message: e.toString());
    }
    notifyListeners();
  }
}
