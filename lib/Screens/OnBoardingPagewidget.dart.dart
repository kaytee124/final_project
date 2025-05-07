import 'package:flutter/material.dart';

import '../services/on_boarding_model.dart';
import '../utils/sizes.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({super.key, required this.model});

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.3),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              Text(
                model.description,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80.0),
            ],
          ),
        ],
      ),
    );
  }
}
