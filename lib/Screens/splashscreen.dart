// ignore_for_file: camel_case_types

import 'package:final_project/utils/image_strings.dart';
import 'package:final_project/widgets/splashScreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashScreen extends StatelessWidget {
  splashScreen({super.key});

  final splash = Get.put(splashScreencontroller());

  @override
  Widget build(BuildContext context) {
    splash.startAnimation();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned widget to center the image
            Obx(
              () => AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                top:
                    splash.animate.value
                        ? MediaQuery.of(context).size.height / 2 - 150
                        : MediaQuery.of(
                          context,
                        ).size.height, // Start from the bottom
                left:
                    MediaQuery.of(context).size.width / 2 -
                    150, // Center horizontally
                child: Image.asset(tSplashImage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
