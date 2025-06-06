import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zen_app/controllers/splash_controller.dart';
import 'package:zen_app/core/reuseables/custom_button.dart';
import 'package:zen_app/features/test/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late SplashController splashController;

  @override
  void initState() {
    // splashController = Provider.of<SplashController>(context, listen: false);

    // final splashController = Provider.of<SplashController>(context);
    // TODO: implement initState
    super.initState();

    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) {
    //       return const OnboardingScreen();
    //     }),
    //   );
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final splashController = Provider.of<SplashController>(context);
    return Consumer<SplashController>(
        builder: (context, splashController, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${splashController.count}',
                          style: TextStyle(
                            fontSize: 50,
                            color: splashController.count >= 10
                                ? Colors.green
                                : (splashController.count >= 1 &&
                                        splashController.count <= 9
                                    ? Colors.blue
                                    : Colors.red),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                splashController.decrement();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Decrement',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                splashController.increment();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 18, 80, 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Increment',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/images/ad2.png',
                          width: double.infinity,
                          height: 300,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkResponse(
                          onTap: () {
                            print('object');
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'Go to Onboarding',
                                fontSize: 12,

                                // bgColor: Colors.red,
                                hasIcon: true,
                                icon: (Icons.arrow_forward),
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return const OnboardingScreen();
                                    }),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: CustomButton(
                                text: 'Go to Onboarding',
                                fontSize: 12,

                                // bgColor: Colors.red,
                                hasIcon: true,
                                icon: (Icons.arrow_forward),
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return const OnboardingScreen();
                                    }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //   'ks  sn scnskc sncks cjks vjnfj wjfnsk cjf jbfjw fjs jwdnkwfnjebfje fkwnfj ejnfjebfjenfjwbgbejngekbgjebjfgb ks  sn scnskc sncks cjks vjnfj wjfnsk cjf jbfjw fjs jwdnkwfnjebfje fkwnfj ejnfjebfjenfjwbgbejngekbgjebjfgbks  sn scnskc sncks cjks vjnfj wjfnsk cjf jbfjw fjs jwdnkwfnjebfje fkwnfj ejnfjebfjenfjwbgbejngekbgjebjfgb',
                        //   textAlign: TextAlign.justify,
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
