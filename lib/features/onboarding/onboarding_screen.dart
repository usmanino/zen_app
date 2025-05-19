import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Timer? timer;
  String text = 'Onboarding Screen';
  int count = 0;
  void textBlinking() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      count++;
      setState(() {
        if (count % 2 == 0) {
          text = 'Onboarding Screen';
        } else {
          text = '';
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textBlinking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              elevation: 20,
              shadowColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(text),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
