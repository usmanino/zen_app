import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_app/core/reuseables/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final player = AudioPlayer();
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

  void playSound() {
    player.play(AssetSource('audio/orin.mp3'));
    // await player.play(UrlSource(
    //     'https://pixabay.com/music/modern-country-country-song-nobody-is-you-334647/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
            const SizedBox(height: 30),
            CustomButton(
              text: 'Get Started',
              bgColor: Colors.tealAccent,
              textColor: const Color.fromARGB(255, 60, 59, 59),
              onPress: () {
                playSound();
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     // behavior: SnackBarBehavior.fixed,
                //     // action: SnackBarAction(
                //     //   label: 'X',
                //     //   onPressed: () {},
                //     // ),
                //     content: Text('Coming Soon...'),
                //   ),
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}
