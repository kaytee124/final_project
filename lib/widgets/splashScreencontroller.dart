import 'package:final_project/Screens/welcome_screen.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class splashScreencontroller extends GetxController {
  static splashScreencontroller get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true; // Trigger the animation to slide up
    await Future.delayed(
      Duration(milliseconds: 5000),
    ); // Wait for the animation to finish
    Get.to(MyHomePage());
  }
}
