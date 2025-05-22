import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:zen_app/controllers/country_data_controller.dart';
import 'package:zen_app/controllers/splash_controller.dart';
import 'package:zen_app/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashController()),
        ChangeNotifierProvider(create: (context) => CountryDataController()),
      ],
      child: Sizer(
        builder: (BuildContext, Orientation, ScreenType) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme:
                // ThemeData.dark()
                ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 52, 8, 225),
              ),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
