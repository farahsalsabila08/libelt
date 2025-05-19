import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // STATE untuk visibilitas password
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Toggle visibilitas password
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Fungsi login
  void login(String email, String password) {
    debugPrint('Login dengan $email dan $password');

    // Dummy: anggap data profil belum lengkap
    var profileIsComplete = false.obs;

    if (profileIsComplete.value) {
      Get.offAllNamed('/home'); // langsung ke dashboard
    } else {
      Get.offAllNamed('/complete-profile'); // arahkan isi profil dulu
    }
  }

  // Fungsi register
  void register(String name, String email, String pass, String confirmPass) {
    debugPrint('Register $name | $email');

    // Setelah daftar langsung ke login
    Get.offAllNamed('/login');
  }
}
