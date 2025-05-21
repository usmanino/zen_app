import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_app/controllers/employee.dart';
import 'package:zen_app/core/reuseables/custom_button.dart';
import 'package:zen_app/features/onboarding/country_data_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final em = Employee(
      // role: 'Developer',
      );
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

  List cars = [
    'Audi',
    'BMW',
    'Mercedes',
    'Volvo',
    'Honda',
    'Toyota',
    'Lexus',
    'Ford',
    'Chevrolet',
    'Dodge',
    'Nissan',
    'Suzuki',
    'Mazda',
    'Hyundai',
    'Kia',
    'Subaru',
    'Mitsubishi',
    'Hyundai',
  ];

  List foods = [
    'Pizza',
    'Burger',
    'Tacos',
    'Ice Cream',
    'Hot Dog',
    'French Fries',
    'Sushi',
    'Ramen',
    'Spaghetti',
    'Salad',
    'Pasta',
    'Sandwich',
    'Steak',
    'Meat',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textBlinking();
  }

  // void playSound() {
  //   // player.play(
  //   //   AssetSource('audio/orin.mp3'),
  //   // );
  //   player.play(UrlSource(
  //       'https://firebasestorage.googleapis.com/v0/b/atop-c60ad.appspot.com/o/ORIN%2FEDE%2FEDE%20-%20Bata%20a%20ro%20kokoka.mp3?alt=media&token=8ba1f67a-cb65-4a95-95e4-71f8b32fdce9'));
  // }

  void playSound() => player.play(UrlSource(
      'https://firebasestorage.googleapis.com/v0/b/atop-c60ad.appspot.com/o/ORIN%2FEDE%2FEDE%20-%20Bata%20a%20ro%20kokoka.mp3?alt=media&token=8ba1f67a-cb65-4a95-95e4-71f8b32fdce9'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CountryDataScreen();
                    }));
                    // playSound();
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 500,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 20),
                          itemCount: cars.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(2),
                              color:
                                  index % 2 == 0 ? Colors.white : Colors.grey,
                              child: Row(
                                children: [
                                  // const Icon(Icons.car_rental),
                                  Image.asset(
                                    'assets/cars/audi.jpg',
                                    height: 50,
                                    width: 50,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(cars[index]),
                                      Text(DateTime.now().toString()),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Column(
                                    children: [
                                      Text('\$200'),
                                      Text('Free'),
                                    ],
                                  ),
                                ],
                              ),
                            );
                            // ListTile(
                            //   leading: Icon(Icons.car_rental),
                            //   title: Text(cars[index]),
                            //   subtitle: Text(DateTime.now().toString()),
                            //   trailing: Column(
                            //     children: [
                            //       Text('\$200'),
                            //       Text('Free'),
                            //     ],
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Get',
                  onPress: () {
                    em.get(name: 'Factorial', role: 'Developer');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
