// ===== ranking_controller.dart =====
import 'package:get/get.dart';

class RankingController extends GetxController {
  final userRank = 31.obs;
  final userName = 'Choi Seungcheol';
  final userScore = 234.obs;

  final rankings = [
    {'rank': 1, 'name': 'Farah Salsabila', 'score': 234},
    {'rank': 2, 'name': 'Choi Beomgyu', 'score': 234},
    {'rank': 3, 'name': 'Yoon Jeonghan', 'score': 234},
    {'rank': 4, 'name': 'Jeon Wonwoo', 'score': 700},
    {'rank': 5, 'name': 'Wen Junhui', 'score': 677},
    {'rank': 6, 'name': 'Kim Mingyu', 'score': 674},
    {'rank': 31, 'name': 'Choi Seungcheol', 'score': 234},
  ];
}