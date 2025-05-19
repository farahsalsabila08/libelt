import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startApp(); // Panggil fungsi di sini
  }

  Future<void> startApp() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed('/onboarding'); // Arahkan ke onboarding
  }
}
