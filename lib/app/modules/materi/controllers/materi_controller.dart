// ===== materi_controller.dart =====
import 'package:get/get.dart';

class MateriController extends GetxController {
  var selectedKelas = 'Semua Kelas'.obs;
  var searchQuery = ''.obs;

  void updateKelas(String kelas) {
    selectedKelas.value = kelas;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }
}