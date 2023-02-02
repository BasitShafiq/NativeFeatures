import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import './placesList_screen.dart';
import 'package:lottie/lottie.dart';
import '../main.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, PlacesList.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GeoLocator',
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: 600,
          child: Lottie.network(
              fit: BoxFit.cover,
              "https://assets10.lottiefiles.com/packages/lf20_UgZWvP.json"),
        ),
      ),
    );
  }
}
