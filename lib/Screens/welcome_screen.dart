import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen1.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/bafrow logo.png'),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineLarge,
                      children: [
                        TextSpan(
                          text: 'Finance',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: 'Tracker',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(OnBoardingScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
