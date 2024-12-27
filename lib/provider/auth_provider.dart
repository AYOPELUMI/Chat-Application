import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:chat_application/res/helper_functions.dart';
import 'package:chat_application/router/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum for authentication states
enum AuthStatus {
  authenticated,
  notAuthenticated,
  authenticating,
  userNotFound,
  error,
}

// AuthProvider class with Riverpod
class AuthNotifier extends StateNotifier<AuthStatus> {
  final FirebaseAuth _auth;

  User? user;
  AuthStatus get status => state;

  AuthNotifier(this._auth) : super(AuthStatus.notAuthenticated);

  Future<void> loginUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    state = AuthStatus.authenticating;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
      state = AuthStatus.authenticated;
      log("User logged in successfully");
    } on FirebaseAuthException catch (e) {
      state = AuthStatus.error;
      log(e.toString());
      HelperFunctions.context = context;
      HelperFunctions.showToast(message: e.message ?? "An error occurred");
    }
  }

  Future<void> signUpUserWithEmailAndPassword(String email, String password,
      BuildContext context, Future<void> Function(String uid) onSuccess) async {
    state = AuthStatus.authenticating;
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
      state = AuthStatus.authenticated;
      HelperFunctions.context = context;
      HelperFunctions.showToast(
        message: "Registration successful",
        isSuccess: true,
      );

      await onSuccess(user!.uid);

      context.router.replace(LoginRoute());
    } on FirebaseAuthException catch (e) {
      state = AuthStatus.error;
      log(e.toString());
      HelperFunctions.context = context;
      HelperFunctions.showToast(message: e.message ?? "An error occurred");
    }
  }

  void logout(BuildContext context) async {
    await _auth.signOut();
    user = null;
    state = AuthStatus.notAuthenticated;
    context.router.replace(LoginRoute());
  }
}

// Provider for AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthStatus>((ref) {
  return AuthNotifier(FirebaseAuth.instance);
});
