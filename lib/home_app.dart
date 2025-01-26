import 'package:flutter/material.dart';

import 'package:post_login/future_Lap/home/view/screen/splash_screen/splash_screen.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenLap(),
    );
  }
}
