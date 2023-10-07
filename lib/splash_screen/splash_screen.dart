import 'package:flutter/material.dart';
import 'dart:async';

import '../main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add a delay using Timer to navigate to MyApp after a certain duration
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const MyApp()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          '../../assets/products/ArtoSell.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          ), // Change the asset path accordingly
      ),
    );
  }
}
