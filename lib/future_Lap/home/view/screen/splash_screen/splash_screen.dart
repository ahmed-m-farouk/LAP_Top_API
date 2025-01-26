import 'dart:async';

import 'package:flutter/material.dart';

import 'package:post_login/future_Lap/home/view/screen/screen_LapTop/screen_lap.dart';

class SplashScreenLap extends StatefulWidget {
  const SplashScreenLap({super.key});

  @override
  State<SplashScreenLap> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenLap> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenLap(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAOSlTxo3Ghx8KBQAMcbw0jXrkgYlbboLknv_u13ZyLKynYGuzHSi7LO1idS9_qYXl3Qg&usqp=CAU'),
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Welcome to my project(Upload_Data)',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
