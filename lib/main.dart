
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/features/authentication/screens/onboarding.dart';
import 'package:ecommerce_app/utils/theme/theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Init Local Storage
  // TODO: Await Native Splash
  // TODO: Initialize Firebase
  // TODO: Initialize Authentication

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,

      home: const OnBoardingScreen(),
        );
  }
}
