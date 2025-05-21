import 'package:flutter/material.dart';
import 'package:zen_app/core/models/onboarding_model.dart';
import 'package:zen_app/core/style/colors.dart';
import 'package:zen_app/features/auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedPageIndex = 0;

  PageController pageController = PageController();
  bool get isLastPage => selectedPageIndex == onboardingModels.length - 1;

  forwardAction() {
    if (isLastPage) {
      // Navigator.pushAndRemoveUntil(context,
      //     MaterialPageRoute(builder: (context) {
      //   return const LoginScreen();
      // }), (route) => false);
      //go to home page
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<OnboardingModel> onboardingModels = [
    OnboardingModel(
      icon: Icons.location_on,
      title: 'Discover Nearby',
      description:
          'Find local spots, connect with your community, and explore what’s around you with just a few taps. Let your location guide your experience.',
      buttonText: 'Next',
      buttonColor: Colors.blue,
      backgroundColor: AppColor().primary,
      textColor: Colors.white,
    ),
    OnboardingModel(
      icon: Icons.search,
      title: 'Explore Features',
      description:
          'Search, filter, and find exactly what you’re looking for. Our smart tools make it easy to navigate and discover new content effortlessly.',
      buttonText: 'Next',
      buttonColor: Colors.green,
      backgroundColor: AppColor().limeGreen,
      textColor: Colors.black87,
    ),
    OnboardingModel(
      icon: Icons.person_add,
      title: 'Create Your Profile',
      description:
          'Sign up to personalize your experience. Save preferences, connect with others, and access exclusive features tailored to you.',
      buttonText: 'Get Started',
      buttonColor: Colors.brown,
      backgroundColor: const Color.fromARGB(255, 225, 207, 50),
      textColor: Colors.deepPurple.shade900,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: onboardingModels.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: onboardingModels[index].backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        onboardingModels[index].icon,
                        color: Colors.white,
                        size: 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        onboardingModels[index].title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        onboardingModels[index].description!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    forwardAction();

                    if (onboardingModels[index].buttonText.toString() ==
                        'Get Started') {
                      print(isLastPage);
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, animation, __) =>
                              const LoginScreen(),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                        ),
                      );
                    }
                    // page.animateToPage(
                    //   index + 1,
                    //   duration: const Duration(milliseconds: 500),
                    //   curve: Curves.easeInOut,
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: onboardingModels[index].buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    onboardingModels[index].buttonText!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
