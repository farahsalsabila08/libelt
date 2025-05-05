import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // The navigation is now handled by the "Get Started" button
    // No need for automatic navigation after 3 seconds
    // If you still want the automatic navigation as a fallback:
    Future.delayed(Duration(seconds: 6), () {
      if (Get.currentRoute == '/splash') {
        Get.offAllNamed('/home');
      }
    });
  }
}