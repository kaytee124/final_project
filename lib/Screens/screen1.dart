import 'package:final_project/Screens/sign_up.dart';
import 'package:final_project/widgets/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.OnPageChangeCallback,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 100.0,
            child: ElevatedButton(
              onPressed: () => obcontroller.pageAnimate(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.blue,
              ),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => obcontroller.skip(),
              child: const Text("Skip", style: TextStyle(color: Colors.black)),
            ),
          ),
          Positioned(
            bottom: 200,
            child: AnimatedSmoothIndicator(
              activeIndex: obcontroller.currentPage.value,
              count: 4,
              effect: const WormEffect(
                activeDotColor: Color(0xff272727),
                dotHeight: 5.0,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            child: Obx(
              () =>
                  obcontroller.currentPage.value == 3
                      ? Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAll(signup());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                      : SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
