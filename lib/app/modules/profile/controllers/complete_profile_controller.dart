import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileController extends GetxController {
  var currentStep = 0.obs;
  var profileImage = Rx<XFile?>(null);

  void nextStep() {
    if (currentStep.value < 2) {
      currentStep.value++;
    } else {
      Get.offAllNamed('/home');
    }
  }

  void skip() {
    Get.offAllNamed('/home');
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      profileImage.value = picked;
    }
  }
}
