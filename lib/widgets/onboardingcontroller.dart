import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../Screens/OnBoardingPagewidget.dart.dart';
import '../services/on_boarding_model.dart';
import '../utils/colors.dart';
import '../utils/image_strings.dart';
import '../utils/text_strings.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnboardingScreenImage1,
        title: tOnBoardingTitle1,
        description: tOnBoardingdescription1,
        bgColor: tOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnboardingScreenImage2,
        title: tOnBoardingTitle2,
        description: tOnBoardingdescription2,
        bgColor: tOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnboardingScreenImage3,
        title: tOnBoardingTitle3,
        description: tOnBoardingdescription3,
        bgColor: tOnBoardingPage3Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnboardingScreenImage4,
        title: tOnBoardingTitle4,
        description: tOnBoardingdescription4,
        bgColor: tOnBoardingPage4Color,
      ),
    ),
  ];
  pageAnimate() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage, duration: 200);
  }

  OnPageChangeCallback(int activePageindex) =>
      currentPage.value = activePageindex;
  skip() => controller.jumpToPage(page: 3);
}
