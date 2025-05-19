import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;

  void nextPage() {
    if (pageIndex < 1) {
      pageIndex++;
    } else {
      Get.offAllNamed('/home');
    }
  }

  void skip() {
    Get.offAllNamed('/home');
  }
}
