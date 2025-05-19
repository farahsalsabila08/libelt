import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart' as custom;

class SearchView extends GetView<custom.SearchController>{
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Get.back(),
            ),
            const SizedBox(width: 8),
            const Text(
              'Pencarian',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search field
            TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: 'Cari materi, topik, dll',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Topik/kategori chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(6, (index) =>
                Chip(
                  label: Text('Topik ${index + 1}'),
                  backgroundColor: Colors.grey[200],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Carousel dummy
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(child: Text('Konten carousel di sini')),
            ),
            const SizedBox(height: 8),

            // Dot indicator dummy
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) =>
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0 ? Colors.black : Colors.grey[300],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),
            const Text('Pencarian Populer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            // Populer chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(6, (index) =>
                Chip(
                  label: Text('Populer ${index + 1}'),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}