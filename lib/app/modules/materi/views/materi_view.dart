import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/materi_controller.dart';

class MateriView extends GetView<MateriController> {
  const MateriView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.offNamed('/home'),
        ),
        title: const Text(
          'Materi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButton<String>(
                      value: controller.selectedKelas.value,
                      isExpanded: true,
                      underline: Container(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: [
                        'Semua Kelas', 'Kelas 7', 'Kelas 8', 'Kelas 9'
                      ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) => controller.updateKelas(val!),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Materi...',
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    onChanged: controller.updateSearch,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _materiCard(
                    title: 'Sistem Pencernaan',
                    kelas: '8',
                    mapel: 'IPA',
                    fitur: ['Mulai Belajar', 'Latihan', 'Kuis'],
                  ),
                  _materiCard(
                    title: 'Sistem Pencernaan',
                    kelas: '8',
                    mapel: 'IPA',
                    fitur: ['Mulai Belajar', 'Latihan', 'Kuis'],
                  ),
                  _materiCard(
                    title: 'Sistem Pencernaan',
                    kelas: '8',
                    mapel: 'IPA',
                    fitur: ['Mulai Belajar', 'Latihan', 'Kuis'],
                  ),
                  _materiCard(
                    title: 'Revolusi Industri',
                    kelas: '9',
                    mapel: 'IPS',
                    fitur: ['Mulai Belajar', 'Latihan', 'Kuis'],
                  ),
                  _materiCard(
                    title: 'Geometri',
                    kelas: '7',
                    mapel: 'Matematika',
                    fitur: ['Mulai Belajar', 'Latihan', 'Kuis'],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _materiCard({
    required String title,
    required String kelas,
    required String mapel,
    required List<String> fitur,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1B263B),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Kelas $kelas | $mapel',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                for (int i = 0; i < fitur.length; i++) ...[
                  if (i > 0) const SizedBox(width: 8),
                  _buildFeatureButton(fitur[i], i == 0),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(String text, bool isPrimary) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.amber : Colors.white,
        foregroundColor: isPrimary ? Colors.black : Colors.black87,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
    );
  }
}