import 'package:get/get.dart';

class HomeController extends GetxController {
  // Contoh reactive state
  var userName = 'Choi Seungcheol'.obs;
  var currentSliderIndex = 0.obs;

  // Nanti bisa ditambah materi, poin, dll
  var userPoints = 980.obs;
  var weeklyRank = [
    {'name': 'Farah Salsabila', 'class': '7A', 'points': 980},
    {'name': 'Choi Beomgyu', 'class': '7C', 'points': 852},
    {'name': 'Yoon Jeonghan', 'class': '9B', 'points': 776},
  ].obs;

  void updateSliderIndex(int index) {
    currentSliderIndex.value = index;
  }
} 
