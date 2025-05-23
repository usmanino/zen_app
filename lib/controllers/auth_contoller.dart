import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zen_app/features/dashboard/dashboard.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signupWithEmailAndPassword(
      String email, String password, String phone) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = FirebaseAuth.instance;

      await result.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(
        msg: 'Account created successfully',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      _isLoading = false;
      notifyListeners();

      // if (result.currentUser != null) {
      //   await result.currentUser!.sendEmailVerification();
      // }
    } on SocketException {
      _isLoading = false;
      notifyListeners();

      Fluttertoast.showToast(
        msg: 'Something went wrong',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e, x) {
      _isLoading = false;
      notifyListeners();
      print("Error received on fetching wallets: ${e.toString()}");
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = FirebaseAuth.instance;

      await result.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Fluttertoast.showToast(
        msg: 'Account Signed In',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return const Dashboard();
        }), (route) => false);
      });

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error creating account',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      _isLoading = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
